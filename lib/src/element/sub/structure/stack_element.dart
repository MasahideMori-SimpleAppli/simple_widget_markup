import 'package:flutter/material.dart';
import '../../../element/spwml_element_part.dart';
import '../../../element_params/element_child.dart';
import '../../../element_params/sub/structure/stack_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../style/spwml_font_style.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-01-06 14:53:11
///
class StackElement extends MultiChildElement {
  final StackParamsWrapper elParams;

  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [children] : This element children.
  /// * [elParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  StackElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      StructureElementChildren children,
      this.elParams)
      : super(serial, EnumSpWMLElementType.stack, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, children);

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
