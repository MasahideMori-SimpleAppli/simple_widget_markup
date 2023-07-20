import 'package:flutter/material.dart';
import '../../../element_params/element_child.dart';
import '../../../element_params/spwml_info.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../style/spwml_font_style.dart';
import '../../super/single_child_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-31 17:50:22
///
class BlockElement extends SingleChildElement {
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
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  BlockElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      BlockElementChild child)
      : super(serial, EnumSpWMLElementType.block, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, child);

  /// Get this class name.
  @override
  String getClassName() {
    return "BlockElement";
  }

  /// Initialize the parameters.
  @override
  BlockElement initParams() {
    super.initParams();
    return this;
  }

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    return child.getChild();
  }
}
