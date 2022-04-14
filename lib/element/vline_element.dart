import 'package:flutter/material.dart';
import '../element_params/element_params.dart';
import 'enum_spwml_element_param.dart';
import 'enum_spwml_element_type.dart';
import 'spwml_font_style.dart';
import 'spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-01-30 20:07:08
///
class VLineElement extends SpWMLElement {
  VLineElement(int serial, List<String> param, ElementParams text,
      int parentSerial, int lineStart, int lineEnd, SpWMLFontStyle style)
      : super(serial, EnumSpWMLElementType.vline, param, text, parentSerial,
            lineStart, lineEnd, style);

  const VLineElement.convert(
      int serial,
      Map<EnumSpWMLElementParam, dynamic> param,
      ElementParams text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style)
      : super.convert(serial, EnumSpWMLElementType.vline, param, text,
            parentSerial, lineStart, lineEnd, style);

  @override
  Widget getWidget(BuildContext context) {
    final bool isExistWidth = param.containsKey(EnumSpWMLElementParam.width);
    final bool isExistHeight = param.containsKey(EnumSpWMLElementParam.height);
    return Container(
      width: isExistWidth ? param[EnumSpWMLElementParam.width]! : 16,
      height: isExistHeight ? param[EnumSpWMLElementParam.height]! : null,
      margin: getMargin(),
      padding: getPadding(),
      color: param.containsKey(EnumSpWMLElementParam.bgColor)
          ? param[EnumSpWMLElementParam.bgColor]
          : null,
      child: VerticalDivider(
        width: 0,
        thickness: param.containsKey(EnumSpWMLElementParam.thickness)
            ? param[EnumSpWMLElementParam.thickness]!
            : 1,
        color: param.containsKey(EnumSpWMLElementParam.color)
            ? param[EnumSpWMLElementParam.color]
            : null,
      ),
    );
  }
}
