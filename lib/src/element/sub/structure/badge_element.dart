import 'package:flutter/material.dart';
import '../../../../simple_widget_markup.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2023-05-27 17:27:12
///
class BadgeElement extends SingleChildTextElement {
  final BadgeParamsWrapper elParams;

  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [info] : SpWML info.
  /// * [child] : This element child.
  /// * [elParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  BadgeElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      BlockElementChild child,
      TextParamsWrapper textParams,
      this.elParams)
      : super(serial, EnumSpWMLElementType.badge, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, child, textParams);

  /// Initialize the parameters.
  @override
  BadgeElement initParams() {
    super.initParams();
    elParams.p.backgroundColor = params.containsKey(EnumSpWMLParams.color)
        ? params[EnumSpWMLParams.color]
        : null;
    elParams.p.textColor = params.containsKey(EnumSpWMLParams.textColor)
        ? params[EnumSpWMLParams.textColor]
        : null;
    elParams.p.label = params.containsKey(EnumSpWMLParams.label)
        ? Text(params[EnumSpWMLParams.label])
        : null;
    elParams.p.smallSize = params.containsKey(EnumSpWMLParams.smallSize)
        ? params[EnumSpWMLParams.smallSize]
        : null;
    final bool useOffsetX = params.containsKey(EnumSpWMLParams.offsetX);
    final bool useOffsetY = params.containsKey(EnumSpWMLParams.offsetY);
    if (useOffsetX || useOffsetY) {
      elParams.p.offset = Offset(
          useOffsetX ? params[EnumSpWMLParams.offsetX] : 0.0,
          useOffsetY ? params[EnumSpWMLParams.offsetY] : 0.0);
    }
    return this;
  }

  /// (en) Set the label. The label is typically text widget.
  ///
  /// (ja) ラベルを設定します。ラベルは、通常はテキストウィジェットです。
  ///
  /// * [label] : Text widget label.
  void setLabel(Widget label) {
    elParams.p.label = label;
  }

  /// (en) Set the label offset.
  ///
  /// (ja) ラベルのオフセットを設定します。
  ///
  /// * [offset] : The offset of text widget label.
  void setOffset(Offset offset) {
    elParams.p.offset = offset;
  }

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    return Badge(
      key: elParams.p.key,
      backgroundColor: elParams.p.backgroundColor,
      textColor: elParams.p.textColor,
      smallSize: elParams.p.smallSize,
      largeSize: elParams.p.largeSize,
      textStyle: elParams.p.textStyle ?? getStyle(),
      padding: elParams.p.padding,
      alignment: elParams.p.alignment,
      offset: elParams.p.offset,
      label: elParams.p.label,
      isLabelVisible: elParams.p.isLabelVisible,
      child: elParams.p.child ?? child.child,
    );
  }
}
