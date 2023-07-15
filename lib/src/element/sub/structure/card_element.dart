import 'package:flutter/material.dart';
import '../../../element_params/spwml_info.dart';
import '../../super/single_child_element.dart';
import '../../../element_params/element_child.dart';
import '../../../element_params/sub/structure/card_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../style/spwml_font_style.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-05-29 20:00:35
///
class CardElement extends SingleChildElement {
  final CardParamsWrapper elParams;

  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [info] : SpWML info.
  /// * [child] : This element child.
  /// * [elParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  CardElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      BlockElementChild child,
      this.elParams)
      : super(serial, EnumSpWMLElementType.card, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, child);

  /// Initialize the parameters.
  @override
  CardElement initParams() {
    super.initParams();
    elParams.p.color = params.containsKey(EnumSpWMLParams.color)
        ? params[EnumSpWMLParams.color]
        : null;
    elParams.p.elevation = params.containsKey(EnumSpWMLParams.cardElevation)
        ? params[EnumSpWMLParams.cardElevation]
        : null;
    elParams.p.shape = getShape()?.copyWith(side: getBorderSide());
    return this;
  }

  /// Assemble and return the widget.
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
      clipBehavior: elParams.p.clipBehavior ?? Clip.antiAliasWithSaveLayer,
      semanticContainer: elParams.p.semanticContainer,
      child: elParams.p.child ?? child.getChild(),
    );
  }
}
