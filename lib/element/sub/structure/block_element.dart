import 'package:flutter/material.dart';
import '../../../element_params/element_child.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../spwml_font_style.dart';
import '../../super/spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-31 17:50:22
///
class BlockElement extends SpWMLElement {
  final BlockElementChild child;

  BlockElement(
      int serial,
      List<String> param,
      SpWMLParamsWrapper spwmlEP,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.child)
      : super(serial, EnumSpWMLElementType.block, param, spwmlEP, parentSerial,
            lineStart, lineEnd, style);

  @override
  BlockElement initParams() {
    super.initParams();
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    return child.getChild();
  }
}
