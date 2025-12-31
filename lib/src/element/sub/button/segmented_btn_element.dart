import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';

import 'package:simple_widget_markup/simple_widget_markup.dart';

///
/// (en) The segmentedBtn.
///
/// (ja) segmentedBtnの実装。
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
    this.elParams, {
    super.key,
  }) : super(
          serial,
          EnumSpWMLElementType.segmentedBtn,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          children,
        );

  /// Get this class name.
  @override
  String getClassName() {
    return "SegmentedBtnElement";
  }

  /// Initialize the parameters.
  @override
  SegmentedBtnElement initParams() {
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
      throw SpWMLException(
        EnumSpWMLExceptionType.sidDoesNotExistException,
        lineStart,
        lineEnd,
        info,
      );
    }
    return this;
  }

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    return _SegmentedBtnElementWidget(
      getSID()!,
      children,
      elParams,
      getShape(),
    );
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
  /// (ja) 値を設定します。マネージャークラスが未設定の場合は無効です。
  /// * [v] : value.
  void setValue(Set<int> v) {
    if (elParams.p.manager != null) {
      final String? sid = getSID();
      if (sid != null) {
        elParams.p.manager!.setIndexSet(sid, v);
      }
    }
  }

  /// (en) Get the value.
  /// If the manager class has not been set or there is no value,
  /// null is returned.
  ///
  /// (ja) 値を取得します。
  /// マネージャークラスが未設定の場合や、値が無い場合はnullが返ります。
  Set<int>? getValue() {
    if (elParams.p.manager != null) {
      final String? sid = getSID();
      if (sid != null) {
        return elParams.p.manager!.getIndexSet(sid);
      }
    }
    return null;
  }

  /// (en) Sets the manager class that manages the state.
  ///
  /// (ja) 状態を管理するマネージャクラスを設定します。
  /// * [m] : Manager class.
  /// * [sid] : This element sid.
  void setManager(MultiIndexManager m, String sid) {
    elParams.p.manager = m;
    elParams.p.manager!.getIndexSet(sid);
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

class _SegmentedBtnElementWidget extends StatefulWidget {
  final String sid;
  final StructureElementChildren children;
  final SegmentedBtnParamsWrapper elParams;
  final OutlinedBorder? shape;

  const _SegmentedBtnElementWidget(
    this.sid,
    this.children,
    this.elParams,
    this.shape,
  );

  @override
  _SegmentedBtnElementWidgetState createState() =>
      _SegmentedBtnElementWidgetState();
}

class _SegmentedBtnElementWidgetState
    extends State<_SegmentedBtnElementWidget> {
  /// The onTap callback.
  void _onTapCallback(Set<int> selection) {
    if (mounted) {
      setState(() {
        widget.elParams.p.manager!.setIndexSet(widget.sid, selection);
        if (widget.elParams.p.onSelectionChanged != null) {
          widget.elParams.p.onSelectionChanged!(selection);
        }
      });
    }
  }

  List<ButtonSegment<int>> _getSegments() {
    List<ButtonSegment<int>> r = [];
    int count = 0;
    for (Widget i in widget.children.children) {
      if (i is TextElement) {
        r.add(
          ButtonSegment(
            value: count,
            label: i.getNonSelectableTextWidget(context),
          ),
        );
      } else if (i is BtnElement) {
        if (i.elParams.p.isUseIcon) {
          r.add(
            ButtonSegment(
              value: count,
              label: i.getNonSelectableTextWidget(context),
              icon: i.getIcon(false),
            ),
          );
        } else {
          if (i.elParams.p.type == EnumBtnType.block) {
            r.add(ButtonSegment(value: count, label: i.child.child));
          } else {
            r.add(
              ButtonSegment(
                value: count,
                label: i.getNonSelectableTextWidget(context),
              ),
            );
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
      onSelectionChanged: widget.elParams.p.isEnabled ? _onTapCallback : null,
      multiSelectionEnabled: widget.elParams.p.multiSelectionEnabled,
      emptySelectionAllowed: widget.elParams.p.emptySelectionAllowed,
      style: widget.elParams.p.style,
      showSelectedIcon: widget.elParams.p.showSelectedIcon,
      selectedIcon: widget.elParams.p.selectedIcon,
    );
  }
}
