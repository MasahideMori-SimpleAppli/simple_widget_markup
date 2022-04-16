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
/// First edition creation date 2021-12-31 18:25:16
///
class RowElement extends SpWMLElement {
  final StructureElementChildren children;

  RowElement(
      int serial,
      List<String> param,
      ElementParams text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children)
      : super(serial, EnumSpWMLElementType.row, param, text, parentSerial,
            lineStart, lineEnd, style);

  const RowElement.convert(
      int serial,
      Map<EnumSpWMLElementParam, dynamic> param,
      ElementParams text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children)
      : super.convert(serial, EnumSpWMLElementType.row, param, text,
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
          child: Row(
            mainAxisAlignment: param.containsKey(EnumSpWMLElementParam.hAlign)
                ? param[EnumSpWMLElementParam.hAlign]
                : MainAxisAlignment.start,
            crossAxisAlignment: param.containsKey(EnumSpWMLElementParam.vAlign)
                ? param[EnumSpWMLElementParam.vAlign]
                : CrossAxisAlignment.start,
            children: children.getChildren(),
          ),
        ));
  }
}
