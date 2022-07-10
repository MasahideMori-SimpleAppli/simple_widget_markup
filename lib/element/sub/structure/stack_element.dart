import 'package:flutter/material.dart';
import '../../../element_params/element_child.dart';
import '../../../element_params/sub/structure/stack_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../spwml_font_style.dart';
import '../../super/spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-01-06 14:53:11
///
class StackElement extends SpWMLElement {
  final StructureElementChildren children;
  final StackParamsWrapper elParams;

  StackElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlEP,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children,
      this.elParams)
      : super(serial, EnumSpWMLElementType.stack, params, spwmlEP, parentSerial,
            lineStart, lineEnd, style);

  @override
  StackElement initParams() {
    super.initParams();
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    return Stack(
      key: elParams.p.key,
      alignment: elParams.p.alignment,
      textDirection: elParams.p.textDirection,
      fit: elParams.p.fit,
      clipBehavior: elParams.p.clipBehavior,
      children: elParams.p.children ?? children.getChildren(),
    );
  }
}
