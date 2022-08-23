import 'package:flutter/material.dart';
import '../../../element_params/element_child.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../style/spwml_font_style.dart';
import '../../super/spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-31 17:50:22
///
class BlockElement extends SpWMLElement {
  final BlockElementChild child;

  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [child] : This element child.
  ///
  /// Throws [SpWMLException] : ParamException.
  /// Throws [SpWMLException] : ParamValueException.
  BlockElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.child)
      : super(serial, EnumSpWMLElementType.block, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style);

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
