import 'package:flutter/material.dart';
import '../../../element_params/sub/other/line_element_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../spwml_font_style.dart';
import '../../super/spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-01-03 02:14:18
///
class LineElement extends SpWMLElement {
  final LineParamsWrapper elParams;

  LineElement(
      int serial,
      List<String> param,
      SpWMLParamsWrapper spwmlEP,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.elParams)
      : super(serial, EnumSpWMLElementType.line, param, spwmlEP, parentSerial,
            lineStart, lineEnd, style);

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
