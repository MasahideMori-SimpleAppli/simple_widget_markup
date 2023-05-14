import 'package:flutter/material.dart';

import '../../../element_params/spwml_info.dart';
import '../../../element_params/sub/other/icon_element_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../style/spwml_font_style.dart';
import '../../super/spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-30 23:42:11
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
      this.elParams)
      : super(serial, EnumSpWMLElementType.icon, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info);

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
