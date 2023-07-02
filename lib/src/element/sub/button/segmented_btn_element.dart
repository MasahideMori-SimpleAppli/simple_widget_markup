import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';

import '../../../../simple_widget_markup.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2023-05-21 16:44:37
///
class SegmentedBtnElement extends MultiChildElement {
  final SegmentedBtnParamsWrapper elParams;

  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [info] : SpWML info.
  /// * [children] : This element children.
  /// * [elParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  SegmentedBtnElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      StructureElementChildren children,
      this.elParams)
      : super(serial, EnumSpWMLElementType.segmentedBtn, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, children);

  @override
  SegmentedBtnElement initParams() {
    super.initParams();
    elParams.p.multiSelectionEnabled =
        params.containsKey(EnumSpWMLParams.isMultiSelection)
            ? params[EnumSpWMLParams.isMultiSelection]
            : SegmentedBtnParams.defMultiSelectionEnabled;
    elParams.p.emptySelectionAllowed =
        params.containsKey(EnumSpWMLParams.allowEmpty)
            ? params[EnumSpWMLParams.allowEmpty]
            : SegmentedBtnParams.defEmptySelectionAllowed;
    // SIDが設定されていなければエラー。
    if (getSID() == null) {
      throw SpWMLException(EnumSpWMLExceptionType.sidDoesNotExistException,
          lineStart, lineEnd, info);
    }
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    // マネージャークラスが未設定の場合、仮のマネージャークラスを生成する。
    elParams.p.manager ??= MultiIndexManager();
    return _SegmentedBtnElementWidget(
        getSID()!, children, elParams, getShape());
  }

  /// (en)Set callback.
  ///
  /// (ja)コールバックを設定します。
  /// * [callback] : The callback.
  void setCallback(void Function(Set<int>)? onSelectionChanged) {
    elParams.p.onSelectionChanged = onSelectionChanged;
  }

  /// (en) Sets the value. Disabled if the manager class is not set.
  ///
  /// (ja) 値を設定します。マネージャークラスが未設定の場合は無効になります。
  /// * [v] : value.
  void setValue(Set<int> v) {
    if (elParams.p.manager != null) {
      final String? sid = getSID();
      if (sid != null) {
        elParams.p.manager!.setIndexSet(sid, v);
      }
    }
  }

  /// (en) Sets the manager class that manages the state.
  ///
  /// (ja) 状態を管理するマネージャクラスを設定します。
  /// * [m] : Manager class.
  void setManager(MultiIndexManager m) {
    elParams.p.manager = m;
  }
}

class _SegmentedBtnElementWidget extends StatefulWidget {
  final String sid;
  final StructureElementChildren children;
  final SegmentedBtnParamsWrapper elParams;
  final OutlinedBorder? shape;

  const _SegmentedBtnElementWidget(
      this.sid, this.children, this.elParams, this.shape);

  @override
  _SegmentedBtnElementWidgetState createState() =>
      _SegmentedBtnElementWidgetState();
}

class _SegmentedBtnElementWidgetState
    extends State<_SegmentedBtnElementWidget> {
  /// The onTap callback.
  void _onTapCallback(Set<int> selection) {
    setState(() {
      widget.elParams.p.manager!.setIndexSet(widget.sid, selection);
      if (widget.elParams.p.onSelectionChanged != null) {
        widget.elParams.p.onSelectionChanged!(selection);
      }
    });
  }

  List<ButtonSegment<int>> _getSegments() {
    List<ButtonSegment<int>> r = [];
    int count = 0;
    for (Widget i in widget.children.children) {
      if (i is TextElement) {
        r.add(ButtonSegment(value: count, label: i.getText(context)));
      } else if (i is BtnElement) {
        if (i.elParams.p.isUseIcon) {
          r.add(ButtonSegment(
              value: count, label: i.getText(context), icon: i.getIcon(false)));
        } else {
          if (i.elParams.p.type == EnumBtnType.block) {
            r.add(ButtonSegment(value: count, label: i.child.child));
          } else {
            r.add(ButtonSegment(value: count, label: i.getText(context)));
          }
        }
      } else {
        r.add(ButtonSegment(value: count, label: i));
      }
      count += 1;
    }
    return r;
  }

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      key: widget.elParams.p.key,
      segments: widget.elParams.p.segments ?? _getSegments(),
      selected: widget.elParams.p.manager!.getIndexSet(widget.sid),
      onSelectionChanged: _onTapCallback,
      multiSelectionEnabled: widget.elParams.p.multiSelectionEnabled,
      emptySelectionAllowed: widget.elParams.p.emptySelectionAllowed,
      style: widget.elParams.p.style,
      showSelectedIcon: widget.elParams.p.showSelectedIcon,
      selectedIcon: widget.elParams.p.selectedIcon,
    );
  }
}
