import 'package:flutter/material.dart';
import 'element_child.dart';
import '../element_params/element_params.dart';
import 'enum_spwml_element_param.dart';
import 'enum_spwml_element_type.dart';
import 'spwml_font_style.dart';
import 'spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-01-06 14:53:11
///
class StackElement extends SpWMLElement {
  final StructureElementChildren children;

  StackElement(
      int serial,
      List<String> param,
      ElementParams text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children)
      : super(serial, EnumSpWMLElementType.stack, param, text, parentSerial,
            lineStart, lineEnd, style);

  const StackElement.convert(
      int serial,
      Map<EnumSpWMLElementParam, dynamic> param,
      ElementParams text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children)
      : super.convert(serial, EnumSpWMLElementType.stack, param, text,
            parentSerial, lineStart, lineEnd, style);

  @override
  Widget getWidget(BuildContext context) {
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
          child: Stack(
            children: children.getChildren(),
          ),
        ));
  }
}
