import 'package:flutter/material.dart';

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
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    return _SegmentedBtnElementWidget(children, elParams, getShape());
  }

  /// (en)Set the initial value.
  /// To keep the value when the screen is refreshed,
  /// hold the value in the upper widget etc. and call this.
  ///
  /// (ja)初期値を設定します。
  /// 画面の更新時に値を保持するには、
  /// 上位のウィジェット等で値を保持し、これを呼び出します。
  /// * [v] : The values.
  void setInitialValues(Set<int> v) {
    elParams.p.selected = v;
  }

  /// (en)Set callback.
  ///
  /// (ja)コールバックを設定します。
  /// * [callback] : The callback.
  void setCallback(void Function(Set<int>)? onSelectionChanged) {
    elParams.p.onSelectionChanged = onSelectionChanged;
  }
}

class _SegmentedBtnElementWidget extends StatefulWidget {
  final StructureElementChildren children;
  final SegmentedBtnParamsWrapper elParams;
  final OutlinedBorder? shape;

  const _SegmentedBtnElementWidget(this.children, this.elParams, this.shape);

  @override
  _SegmentedBtnElementWidgetState createState() =>
      _SegmentedBtnElementWidgetState();
}

class _SegmentedBtnElementWidgetState
    extends State<_SegmentedBtnElementWidget> {
  /// The onTap callback.
  void _onTapCallback(Set<int> selection) {
    setState(() {
      widget.elParams.p.selected = selection;
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

  Set<int> _getSelected() {
    if (widget.elParams.p.selected == null) {
      return {};
    } else {
      return widget.elParams.p.selected!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      key: widget.elParams.p.key,
      segments: widget.elParams.p.segments ?? _getSegments(),
      selected: _getSelected(),
      onSelectionChanged: _onTapCallback,
      multiSelectionEnabled: widget.elParams.p.multiSelectionEnabled,
      emptySelectionAllowed: widget.elParams.p.emptySelectionAllowed,
      style: widget.elParams.p.style,
      showSelectedIcon: widget.elParams.p.showSelectedIcon,
      selectedIcon: widget.elParams.p.selectedIcon,
    );
  }
}
