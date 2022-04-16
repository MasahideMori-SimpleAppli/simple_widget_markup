import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../element_params/element_params.dart';
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

  SpanElement(
      int serial,
      List<String> param,
      ElementParams text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children)
      : super(serial, EnumSpWMLElementType.span, param, text, parentSerial,
            lineStart, lineEnd, style);

  const SpanElement.convert(
      int serial,
      Map<EnumSpWMLElementParam, dynamic> param,
      ElementParams text,
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
    return ConstrainedBox(
        constraints: getConstraints(),
        child: Container(
            width: param.containsKey(EnumSpWMLElementParam.width)
                ? param[EnumSpWMLElementParam.width]!
                : null,
            height: param.containsKey(EnumSpWMLElementParam.height)
                ? param[EnumSpWMLElementParam.height]!
                : null,
            margin: getMargin(),
            padding: getPadding(),
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
                    text: TextSpan(children: _convertChildren(context)))));
  }

  List<TextSpan> _convertChildren(BuildContext context) {
    List<TextSpan> r = [];
    for (Widget i in children.children) {
      if (i is TextElement) {
        r.add(TextSpan(
          text: i.text.s,
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
}
