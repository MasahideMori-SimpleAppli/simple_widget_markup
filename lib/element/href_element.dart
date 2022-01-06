import 'package:flutter/material.dart';
import '../util_parser.dart';
import 'enum_spwml_element_param.dart';
import 'enum_spwml_element_type.dart';
import 'spwml_font_style.dart';
import 'spwml_element.dart';

import 'package:url_launcher/url_launcher.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-01-04 00:16:17
///
class HrefElement extends SpWMLElement {
  HrefElement(int serial, List<String> param, String text, int parentSerial,
      int lineStart, int lineEnd, SpWMLFontStyle style)
      : super(serial, EnumSpWMLElementType.href, param, text, parentSerial,
            lineStart, lineEnd, style);

  const HrefElement.convert(
      int serial,
      Map<EnumSpWMLElementParam, dynamic> param,
      String text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style)
      : super.convert(serial, EnumSpWMLElementType.href, param, text,
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
        child: InkWell(
          child: Text(
            getDisplayText(),
            textScaleFactor: MediaQuery.of(context).textScaleFactor,
            style: getStyle(context),
            strutStyle: getStrutStyle(),
            textAlign: param.containsKey(EnumSpWMLElementParam.textAlign)
                ? param[EnumSpWMLElementParam.textAlign]
                : TextAlign.left,
            maxLines: null,
          ),
          onTap: () {
            onTapFunc(context);
          },
        ));
  }

  /// return alt text or text.
  String getDisplayText() {
    return param.containsKey(EnumSpWMLElementParam.alt)
        ? param[EnumSpWMLElementParam.alt]!
        : text;
  }

  /// launch url.
  void onTapFunc(BuildContext context) async {
    if (await canLaunch(text)) {
      await launch(text);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("The specified URL could not be opened."),
        duration: Duration(seconds: 3),
      ));
    }
  }

  /// get text strut style from parameters.
  StrutStyle getStrutStyle() {
    return StrutStyle(
        fontSize: param.containsKey(EnumSpWMLElementParam.fontSize)
            ? param[EnumSpWMLElementParam.fontSize]
            : getDefFontSize(),
        height: param.containsKey(EnumSpWMLElementParam.textHeight)
            ? param[EnumSpWMLElementParam.textHeight]
            : 1.0);
  }

  /// get text style from parameters.
  TextStyle getStyle(BuildContext context) {
    return TextStyle(
      color: param.containsKey(EnumSpWMLElementParam.textColor)
          ? param[EnumSpWMLElementParam.textColor]
          : UtilParser.convertColor(style.hrefColor),
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
          : EnumSpWMLElementParam.textDeco
              .parseValue(type, style.hrefDeco, lineStart, lineEnd),
      decorationStyle: param.containsKey(EnumSpWMLElementParam.textDecoStyle)
          ? param[EnumSpWMLElementParam.textDecoStyle]
          : EnumSpWMLElementParam.textDecoStyle
              .parseValue(type, style.hrefDecoStyle, lineStart, lineEnd),
      decorationColor: param.containsKey(EnumSpWMLElementParam.textDecoColor)
          ? param[EnumSpWMLElementParam.textDecoColor]
          : UtilParser.convertColor(style.hrefColor),
      decorationThickness:
          param.containsKey(EnumSpWMLElementParam.textDecoThickness)
              ? param[EnumSpWMLElementParam.textDecoThickness]
              : style.hrefDecoThickness,
      fontFamily: param.containsKey(EnumSpWMLElementParam.fontName)
          ? param[EnumSpWMLElementParam.fontName]
          : null,
      height: getTextHeight(context),
    );
  }
}
