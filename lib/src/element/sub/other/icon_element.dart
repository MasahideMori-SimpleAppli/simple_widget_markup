import 'package:flutter/material.dart';

import 'package:simple_widget_markup/simple_widget_markup.dart';

///
/// (en) The icon.
///
/// (ja) iconの実装。
///
class IconElement extends SpWMLElement {
  final IconParamsWrapper elParams;

  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [info] : SpWML info.
  /// * [elParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  IconElement(
    int serial,
    Map<String, String> params,
    SpWMLParamsWrapper spwmlParams,
    int parentSerial,
    int lineStart,
    int lineEnd,
    SpWMLFontStyle style,
    SpWMLInfo? info,
    this.elParams, {
    super.key,
  }) : super(
          serial,
          EnumSpWMLElementType.icon,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
        );

  /// Get this class name.
  @override
  String getClassName() {
    return "IconElement";
  }

  /// Initialize the parameters.
  @override
  IconElement initParams() {
    super.initParams();
    elParams.p.icon = params.containsKey(EnumSpWMLParams.iconNum)
        ? params[EnumSpWMLParams.iconNum]!
        : null;
    elParams.p.size = params.containsKey(EnumSpWMLParams.iconSize)
        ? params[EnumSpWMLParams.iconSize]!
        : null;
    elParams.p.color = params.containsKey(EnumSpWMLParams.iconColor)
        ? params[EnumSpWMLParams.iconColor]!
        : null;
    return this;
  }

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    return Icon(
      elParams.p.icon,
      key: elParams.p.key,
      size: elParams.p.size,
      fill: elParams.p.fill,
      weight: elParams.p.weight,
      grade: elParams.p.grade,
      opticalSize: elParams.p.opticalSize,
      color: elParams.p.color,
      shadows: elParams.p.shadows,
      semanticLabel: elParams.p.semanticLabel,
      textDirection: elParams.p.textDirection,
    );
  }
}
