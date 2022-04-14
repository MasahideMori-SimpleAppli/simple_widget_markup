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
/// First edition creation date 2021-12-31 17:50:22
///
class BlockElement extends SpWMLElement {
  final BlockElementChild child;

  BlockElement(int serial, List<String> param, ElementParams text, int parentSerial,
      int lineStart, int lineEnd, SpWMLFontStyle style, this.child)
      : super(serial, EnumSpWMLElementType.block, param, text, parentSerial,
            lineStart, lineEnd, style);

  const BlockElement.convert(
      int serial,
      Map<EnumSpWMLElementParam, dynamic> param,
      ElementParams text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.child)
      : super.convert(serial, EnumSpWMLElementType.block, param, text,
            parentSerial, lineStart, lineEnd, style);

  @override
  Widget getWidget(BuildContext context) {
    final bool isExistWidth = param.containsKey(EnumSpWMLElementParam.width);
    final bool isExistHeight = param.containsKey(EnumSpWMLElementParam.height);
    return ConstrainedBox(
        constraints: getConstraints(),
        child: Container(
          width: isExistWidth ? param[EnumSpWMLElementParam.width]! : null,
          height: isExistHeight ? param[EnumSpWMLElementParam.height]! : null,
          margin: getMargin(),
          padding: getPadding(),
          color: param.containsKey(EnumSpWMLElementParam.bgColor)
              ? param[EnumSpWMLElementParam.bgColor]
              : null,
          child: child.getChild(),
        ));
  }
}
