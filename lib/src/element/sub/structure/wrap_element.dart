import 'package:flutter/material.dart';
import '../../../element_params/element_child.dart';
import '../../../element_params/sub/structure/wrap_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../style/spwml_font_style.dart';
import '../../super/spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-04-10 16:18:52
///
class WrapElement extends SpWMLElement {
  final StructureElementChildren children;
  final WrapParamsWrapper elParams;

  WrapElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlEP,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children,
      this.elParams)
      : super(serial, EnumSpWMLElementType.wrap, params, spwmlEP, parentSerial,
            lineStart, lineEnd, style);

  @override
  WrapElement initParams() {
    super.initParams();
    elParams.p.alignment = params.containsKey(EnumSpWMLParams.hAlign)
        ? params[EnumSpWMLParams.hAlign]
        : WrapAlignment.start;
    elParams.p.runAlignment = params.containsKey(EnumSpWMLParams.hAlign)
        ? params[EnumSpWMLParams.hAlign]
        : WrapAlignment.start;
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    return Wrap(
      key: elParams.p.key,
      direction: elParams.p.direction,
      alignment: elParams.p.alignment,
      spacing: elParams.p.spacing,
      runAlignment: elParams.p.runAlignment,
      runSpacing: elParams.p.runSpacing,
      crossAxisAlignment: elParams.p.crossAxisAlignment,
      textDirection: elParams.p.textDirection,
      verticalDirection: elParams.p.verticalDirection,
      clipBehavior: elParams.p.clipBehavior,
      children: elParams.p.children ?? children.getChildren(),
    );
  }
}
