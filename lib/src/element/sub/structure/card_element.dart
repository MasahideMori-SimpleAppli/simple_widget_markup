import 'package:flutter/material.dart';
import '../../../element_params/element_child.dart';
import '../../../element_params/sub/structure/card_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../style/spwml_font_style.dart';
import '../../super/spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-05-29 20:00:35
///
class CardElement extends SpWMLElement {
  final BlockElementChild child;
  final CardParamsWrapper elParams;

  CardElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlEP,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.child,
      this.elParams)
      : super(serial, EnumSpWMLElementType.card, params, spwmlEP, parentSerial,
            lineStart, lineEnd, style);

  @override
  CardElement initParams() {
    super.initParams();
    elParams.p.color = params.containsKey(EnumSpWMLParams.color)
        ? params[EnumSpWMLParams.color]
        : null;
    elParams.p.elevation = params.containsKey(EnumSpWMLParams.cardElevation)
        ? params[EnumSpWMLParams.cardElevation]
        : null;
    elParams.p.shape = getShape();
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    return Card(
      key: elParams.p.key,
      color: elParams.p.color,
      shadowColor: elParams.p.shadowColor,
      surfaceTintColor: elParams.p.surfaceTintColor,
      elevation: elParams.p.elevation,
      shape: elParams.p.shape,
      borderOnForeground: elParams.p.borderOnForeground,
      margin: elParams.p.margin,
      clipBehavior: elParams.p.clipBehavior,
      child: elParams.p.child ?? child.getChild(),
      semanticContainer: elParams.p.semanticContainer,
    );
  }
}
