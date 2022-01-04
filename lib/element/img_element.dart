import 'package:flutter/material.dart';
import 'enum_spwml_element_param.dart';
import 'enum_spwml_element_type.dart';
import 'spwml_font_style.dart';
import 'spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-30 23:42:11
///
class ImgElement extends SpWMLElement {
  ImgElement(int serial, List<String> param, String text, int parentSerial,
      int lineStart, int lineEnd, SpWMLFontStyle style)
      : super(serial, EnumSpWMLElementType.img, param, text, parentSerial,
            lineStart, lineEnd, style);

  const ImgElement.convert(
      int serial,
      Map<EnumSpWMLElementParam, dynamic> param,
      String text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style)
      : super.convert(serial, EnumSpWMLElementType.img, param, text,
            parentSerial, lineStart, lineEnd, style);

  @override
  Widget getWidget(BuildContext context) {
    return Container(
      width: param.containsKey(EnumSpWMLElementParam.width)
          ? param[EnumSpWMLElementParam.width]!
          : null,
      height: param.containsKey(EnumSpWMLElementParam.height)
          ? param[EnumSpWMLElementParam.height]!
          : null,
      margin: getMargin(context),
      padding: getPadding(context),
      color: param.containsKey(EnumSpWMLElementParam.bgColor)
          ? param[EnumSpWMLElementParam.bgColor]
          : null,
      child: Image.network(
        text,
        fit: param.containsKey(EnumSpWMLElementParam.fit)
            ? param[EnumSpWMLElementParam.fit]!
            : BoxFit.contain,
        repeat: param.containsKey(EnumSpWMLElementParam.repeat)
            ? param[EnumSpWMLElementParam.repeat]!
            : ImageRepeat.noRepeat,
      ),
    );
  }
}
