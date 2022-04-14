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
/// First edition creation date 2022-04-10 16:18:52
///
class WrapElement extends SpWMLElement {
  final StructureElementChildren children;

  WrapElement(int serial, List<String> param, ElementParams text, int parentSerial,
      int lineStart, int lineEnd, SpWMLFontStyle style, this.children)
      : super(serial, EnumSpWMLElementType.wrap, param, text, parentSerial,
            lineStart, lineEnd, style);

  const WrapElement.convert(
      int serial,
      Map<EnumSpWMLElementParam, dynamic> param,
      ElementParams text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children)
      : super.convert(serial, EnumSpWMLElementType.wrap, param, text,
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
          child: Wrap(
            alignment: param.containsKey(EnumSpWMLElementParam.hAlign)
                ? param[EnumSpWMLElementParam.hAlign]
                : WrapAlignment.start,
            runAlignment: param.containsKey(EnumSpWMLElementParam.vAlign)
                ? param[EnumSpWMLElementParam.vAlign]
                : WrapAlignment.start,
            children: children.getChildren(),
          ),
        ));
  }

}
