import 'package:flutter/material.dart';
import '../../../element_params/spwml_info.dart';
import '../../../element_params/sub/other/vline_element_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../style/spwml_font_style.dart';
import '../../super/spwml_element.dart';

///
/// (en) The vline.
///
/// (ja) vlineの実装。
///
class VLineElement extends SpWMLElement {
  final VLineParamsWrapper elParams;

  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [info] : SpWML info.
  /// * [elParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  VLineElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      this.elParams)
      : super(serial, EnumSpWMLElementType.vline, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info);

  /// Get this class name.
  @override
  String getClassName() {
    return "VLineElement";
  }

  /// Initialize the parameters.
  @override
  VLineElement initParams() {
    super.initParams();
    elParams.p.thickness = params.containsKey(EnumSpWMLParams.thickness)
        ? params[EnumSpWMLParams.thickness]!
        : 1;
    elParams.p.color = params.containsKey(EnumSpWMLParams.color)
        ? params[EnumSpWMLParams.color]
        : null;
    return this;
  }

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    return VerticalDivider(
        key: elParams.p.key,
        width: elParams.p.width,
        thickness: elParams.p.thickness,
        indent: elParams.p.indent,
        endIndent: elParams.p.endIndent,
        color: elParams.p.color);
  }
}
