import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'href_element.dart';
import 'text_element.dart';
import '../spwml_exception.dart';
import 'element_child.dart';
import 'enum_spwml_element_param.dart';
import 'enum_spwml_element_type.dart';
import 'spwml_font_style.dart';
import 'spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-01-04 00:15:15
///
class SpanElement extends SpWMLElement {
  final StructureElementChildren children;

  SpanElement(int serial, List<String> param, String text, int parentSerial,
      int lineStart, int lineEnd, SpWMLFontStyle style, this.children)
      : super(serial, EnumSpWMLElementType.span, param, text, parentSerial,
            lineStart, lineEnd, style);

  const SpanElement.convert(
      int serial,
      Map<EnumSpWMLElementParam, dynamic> param,
      String text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children)
      : super.convert(serial, EnumSpWMLElementType.span, param, text,
            parentSerial, lineStart, lineEnd, style);

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
        color: param.containsKey(EnumSpWMLElementParam.bgColor)
            ? param[EnumSpWMLElementParam.bgColor]
            : null,
        child: isSelectable
            ? SelectableText.rich(
                TextSpan(children: _convertChildren(context)),
                textScaleFactor: MediaQuery.of(context).textScaleFactor,
              )
            : RichText(
                textScaleFactor: MediaQuery.of(context).textScaleFactor,
                text: TextSpan(children: _convertChildren(context))));
  }

  List<TextSpan> _convertChildren(BuildContext context) {
    List<TextSpan> r = [];
    for (Widget i in children.children) {
      if (i is TextElement) {
        r.add(TextSpan(
          text: i.text,
          style: i.getStyle(context),
        ));
      } else if (i is HrefElement) {
        r.add(TextSpan(
            text: i.getDisplayText(),
            style: i.getStyle(context),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                i.onTapFunc(context);
              }));
      } else {
        throw SpWMLException(
            EnumSpWMLExceptionType.elementException, lineStart, lineEnd);
      }
    }
    return r;
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
  TextStyle getStyle() {
    return TextStyle(
      color: param.containsKey(EnumSpWMLElementParam.textColor)
          ? param[EnumSpWMLElementParam.textColor]
          : style.textColor,
      backgroundColor: param.containsKey(EnumSpWMLElementParam.bgColor)
          ? param[EnumSpWMLElementParam.bgColor]
          : null,
      fontSize: param.containsKey(EnumSpWMLElementParam.fontSize)
          ? param[EnumSpWMLElementParam.fontSize]
          : getDefFontSize(),
      fontWeight: param.containsKey(EnumSpWMLElementParam.fontWeight)
          ? param[EnumSpWMLElementParam.fontWeight]
          : FontWeight.normal,
      fontStyle: param.containsKey(EnumSpWMLElementParam.fontStyle)
          ? param[EnumSpWMLElementParam.fontStyle]
          : FontStyle.normal,
      letterSpacing: param.containsKey(EnumSpWMLElementParam.letterSpacing)
          ? param[EnumSpWMLElementParam.letterSpacing]
          : null,
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
      height: param.containsKey(EnumSpWMLElementParam.textHeight)
          ? param[EnumSpWMLElementParam.textHeight]
          : 1.0,
    );
  }
}
