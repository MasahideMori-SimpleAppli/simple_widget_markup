import 'package:flutter/material.dart';
import '../util_parser.dart';
import 'enum_spwml_element_param.dart';
import 'enum_spwml_element_type.dart';
import 'spwml_font_style.dart';
import 'spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-30 23:42:11
///
class TextElement extends SpWMLElement {
  TextElement(
      int serial,
      EnumSpWMLElementType type,
      List<String> param,
      String text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style)
      : super(
            serial, type, param, text, parentSerial, lineStart, lineEnd, style);

  const TextElement.convert(
      int serial,
      EnumSpWMLElementType type,
      Map<EnumSpWMLElementParam, dynamic> param,
      String text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style)
      : super.convert(
            serial, type, param, text, parentSerial, lineStart, lineEnd, style);

  @override
  Widget getWidget(BuildContext context) {
    final bool isSelectable =
        param.containsKey(EnumSpWMLElementParam.isSelectable)
            ? param[EnumSpWMLElementParam.isSelectable]
            : true;
    return Container(
      width: param.containsKey(EnumSpWMLElementParam.width)
          ? param[EnumSpWMLElementParam.width]!
          : null,
      height: param.containsKey(EnumSpWMLElementParam.height)
          ? param[EnumSpWMLElementParam.height]!
          : null,
      margin: getMargin(context),
      padding: getPadding(context),
      child: isSelectable
          ? SelectableText(
              text,
              textScaleFactor: MediaQuery.of(context).textScaleFactor,
              style: getStyle(context),
              strutStyle: getStrutStyle(),
              textAlign: param.containsKey(EnumSpWMLElementParam.textAlign)
                  ? param[EnumSpWMLElementParam.textAlign]
                  : TextAlign.left,
              maxLines: null,
            )
          : Text(
              text,
              textScaleFactor: MediaQuery.of(context).textScaleFactor,
              style: getStyle(context),
              strutStyle: getStrutStyle(),
              textAlign: param.containsKey(EnumSpWMLElementParam.textAlign)
                  ? param[EnumSpWMLElementParam.textAlign]
                  : TextAlign.left,
              maxLines: null,
            ),
    );
  }

  StrutStyle getStrutStyle() {
    return StrutStyle(
        fontSize: param.containsKey(EnumSpWMLElementParam.fontSize)
            ? param[EnumSpWMLElementParam.fontSize]
            : getDefFontSize(),
        height: param.containsKey(EnumSpWMLElementParam.textHeight)
            ? param[EnumSpWMLElementParam.textHeight]
            : 1.0);
  }

  TextStyle getStyle(BuildContext context) {
    return TextStyle(
      color: param.containsKey(EnumSpWMLElementParam.textColor)
          ? param[EnumSpWMLElementParam.textColor]
          : UtilParser.convertColor(style.textColor),
      backgroundColor: param.containsKey(EnumSpWMLElementParam.bgColor)
          ? param[EnumSpWMLElementParam.bgColor]
          : null,
      fontSize: param.containsKey(EnumSpWMLElementParam.fontSize)
          ? param[EnumSpWMLElementParam.fontSize]
          : getDefFontSize(),
      fontWeight: param.containsKey(EnumSpWMLElementParam.fontWeight)
          ? param[EnumSpWMLElementParam.fontWeight]
          : getDefFontWeight(),
      fontStyle: param.containsKey(EnumSpWMLElementParam.fontStyle)
          ? param[EnumSpWMLElementParam.fontStyle]
          : FontStyle.normal,
      letterSpacing: param.containsKey(EnumSpWMLElementParam.letterSpacing)
          ? param[EnumSpWMLElementParam.letterSpacing]
          : getDefFontLetterSpacing(),
      wordSpacing: param.containsKey(EnumSpWMLElementParam.wordSpacing)
          ? param[EnumSpWMLElementParam.wordSpacing]
          : null,
      decoration: param.containsKey(EnumSpWMLElementParam.textDeco)
          ? param[EnumSpWMLElementParam.textDeco]
          : TextDecoration.none,
      decorationStyle: param.containsKey(EnumSpWMLElementParam.textDecoStyle)
          ? param[EnumSpWMLElementParam.textDecoStyle]
          : TextDecorationStyle.solid,
      decorationColor: param.containsKey(EnumSpWMLElementParam.textDecoColor)
          ? param[EnumSpWMLElementParam.textDecoColor]
          : null,
      decorationThickness:
          param.containsKey(EnumSpWMLElementParam.textDecoThickness)
              ? param[EnumSpWMLElementParam.textDecoThickness]
              : null,
      fontFamily: param.containsKey(EnumSpWMLElementParam.fontName)
          ? param[EnumSpWMLElementParam.fontName]
          : null,
      height: getTextHeight(context),
    );
  }
}