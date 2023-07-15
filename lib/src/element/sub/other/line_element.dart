import 'package:flutter/material.dart';
import '../../../element_params/spwml_info.dart';
import '../../../element_params/sub/other/line_element_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../style/spwml_font_style.dart';
import '../../super/spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-01-03 02:14:18
///
class LineElement extends SpWMLElement {
  final LineParamsWrapper elParams;

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
  LineElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      this.elParams)
      : super(serial, EnumSpWMLElementType.line, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info);

  /// Initialize the parameters.
  @override
  LineElement initParams() {
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
    return Divider(
        key: elParams.p.key,
        height: elParams.p.height,
        thickness: elParams.p.thickness,
        indent: elParams.p.indent,
        endIndent: elParams.p.endIndent,
        color: elParams.p.color);
  }
}
