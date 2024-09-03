import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';

import '../../../../simple_widget_markup.dart';

///
/// (en) The segmentedBtn2.
/// This is a flavor of segmentedBtn that differs in
/// how it manages the selection.
/// To use this class, you must set the SID for
/// all child (immediate descendants only).
///
/// (ja) segmentedBtn2の実装。
/// これは、選択内容の管理方法が異なる segmentedBtn の一種です。
/// このクラスを使用するには、すべての小要素（直下のみ）にSIDを設定する必要があります。
///
class SegmentedBtn2Element extends MultiChildElement {
  final SegmentedBtn2ParamsWrapper elParams;

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
  SegmentedBtn2Element(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      StructureElementChildren children,
      this.elParams,
      {super.key})
      : super(serial, EnumSpWMLElementType.segmentedBtn2, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, children);

  /// Get this class name.
  @override
  String getClassName() {
    return "SegmentedBtn2Element";
  }

  /// Initialize the parameters.
  @override
  SegmentedBtn2Element initParams() {
    super.initParams();
    elParams.p.isEnabled = params.containsKey(EnumSpWMLParams.isEnabled)
        ? params[EnumSpWMLParams.isEnabled]
        : true;
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

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    return _SegmentedBtn2ElementWidget(
        getSID()!, children, elParams, getShape());
  }

  /// (en)Set callback.
  ///
  /// (ja)コールバックを設定します。
  /// * [callback] : The callback.
  void setCallback(void Function(Set<String>)? onSelectionChanged) {
    elParams.p.onSelectionChanged = onSelectionChanged;
  }

  /// (en) Sets the value. Disabled if the manager class is not set.
  ///
  /// (ja) 値を設定します。マネージャークラスが未設定の場合は無効です。
  /// * [v] : value.
  void setValue(Set<String> v) {
    if (elParams.p.manager != null) {
      final String? sid = getSID();
      if (sid != null) {
        elParams.p.manager!.setSelectionSet(sid, v);
      }
    }
  }

  /// (en) Sets the manager class that manages the state.
  ///
  /// (ja) 状態を管理するマネージャクラスを設定します。
  /// * [m] : Manager class.
  /// * [sid] : This element sid.
  void setManager(MultiSelectionManager m, String sid) {
    elParams.p.manager = m;
    elParams.p.manager!.getSelectionSet(sid);
  }

  /// (en) Enable/disable this button.
  ///
  /// (ja)このボタンの有効・無効を切り替えます。
  ///
  /// * [isEnabled] : If true, the button is enabled.
  void setEnabled(bool isEnabled) {
    elParams.p.isEnabled = isEnabled;
  }
}

class _SegmentedBtn2ElementWidget extends StatefulWidget {
  final String sid;
  final StructureElementChildren children;
  final SegmentedBtn2ParamsWrapper elParams;
  final OutlinedBorder? shape;

  const _SegmentedBtn2ElementWidget(
      this.sid, this.children, this.elParams, this.shape);

  @override
  _SegmentedBtn2ElementWidgetState createState() =>
      _SegmentedBtn2ElementWidgetState();
}

class _SegmentedBtn2ElementWidgetState
    extends State<_SegmentedBtn2ElementWidget> {
  /// The onTap callback.
  void _onTapCallback(Set<String> selection) {
    if (mounted) {
      setState(() {
        widget.elParams.p.manager!.setSelectionSet(widget.sid, selection);
        if (widget.elParams.p.onSelectionChanged != null) {
          widget.elParams.p.onSelectionChanged!(selection);
        }
      });
    }
  }

  List<ButtonSegment<String>> _getSegments() {
    List<ButtonSegment<String>> r = [];
    for (int i = 0; i <= widget.children.children.length; i++) {
      final Widget w = widget.children.children[i];
      if (w is! SpWMLElement) {
        throw SpWMLException(
            EnumSpWMLExceptionType.childrenSidNotExistException,
            -1,
            -1,
            SpWMLInfo(errorHint: 'segmentedBtn2, sid=${widget.sid}'));
      }
      final String? targetSID = w.getSID();
      if (targetSID == null) {
        throw SpWMLException(
            EnumSpWMLExceptionType.childrenSidNotExistException,
            -1,
            -1,
            SpWMLInfo(errorHint: 'segmentedBtn2, sid=${widget.sid}'));
      }
      if (w is TextElement) {
        r.add(ButtonSegment(
            value: targetSID, label: w.getNonSelectableTextWidget(context)));
      } else if (w is BtnElement) {
        if (w.elParams.p.isUseIcon) {
          r.add(ButtonSegment(
              value: targetSID,
              label: w.getNonSelectableTextWidget(context),
              icon: w.getIcon(false)));
        } else {
          if (w.elParams.p.type == EnumBtnType.block) {
            r.add(ButtonSegment(value: targetSID, label: w.child.child));
          } else {
            r.add(ButtonSegment(
                value: targetSID,
                label: w.getNonSelectableTextWidget(context)));
          }
        }
      } else {
        r.add(ButtonSegment(value: targetSID, label: w));
      }
    }
    return r;
  }

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<String>(
      key: widget.elParams.p.key,
      segments: widget.elParams.p.segments ?? _getSegments(),
      selected: widget.elParams.p.manager!.getSelectionSet(widget.sid),
      onSelectionChanged: widget.elParams.p.isEnabled ? _onTapCallback : null,
      multiSelectionEnabled: widget.elParams.p.multiSelectionEnabled,
      emptySelectionAllowed: widget.elParams.p.emptySelectionAllowed,
      style: widget.elParams.p.style,
      showSelectedIcon: widget.elParams.p.showSelectedIcon,
      selectedIcon: widget.elParams.p.selectedIcon,
    );
  }
}
