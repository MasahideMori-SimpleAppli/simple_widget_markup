import 'package:flutter/material.dart';
import 'enum_spwml_element_param.dart';
import 'enum_spwml_element_type.dart';
import 'spwml_font_style.dart';
import 'spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-01-03 02:14:18
///
class LineElement extends SpWMLElement {
  LineElement(int serial, List<String> param, String text, int parentSerial,
      int lineStart, int lineEnd, SpWMLFontStyle style)
      : super(serial, EnumSpWMLElementType.line, param, text, parentSerial,
            lineStart, lineEnd, style);

  @override
  Widget getWidget(BuildContext context) {
    final bool isExistWidth = param.containsKey(EnumSpWMLElementParam.width);
    final bool isExistHeight = param.containsKey(EnumSpWMLElementParam.height);
    return Container(
      width: isExistWidth ? param[EnumSpWMLElementParam.width]! : null,
      height: isExistHeight ? param[EnumSpWMLElementParam.height]! : 16,
      margin: getMargin(context),
      padding: getPadding(context),
      color: param.containsKey(EnumSpWMLElementParam.bgColor)
          ? param[EnumSpWMLElementParam.bgColor]
          : null,
      child: Divider(
        height: 0,
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
