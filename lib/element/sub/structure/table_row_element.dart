import 'package:flutter/material.dart';

import '../../../element_params/element_child.dart';
import '../../../element_params/sub/structure/table_row_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../spwml_font_style.dart';
import '../../super/spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-06-19 16:00:24
///
class TableRowElement extends SpWMLElement {
  final StructureElementChildren children;
  final TableRowParamsWrapper elParams;

  TableRowElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlEP,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children,
      this.elParams)
      : super(serial, EnumSpWMLElementType.tableRow, params, spwmlEP,
            parentSerial, lineStart, lineEnd, style);

  @override
  TableRowElement initParams() {
    super.initParams();
    if (params.containsKey(EnumSpWMLParams.color)) {
      elParams.p.decoration =
          BoxDecoration(color: params[EnumSpWMLParams.color]);
    }
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    return const SizedBox();
  }

  /// Gets the contents as a TableRow.
  TableRow getTableRow() {
    return TableRow(
        key: elParams.p.key,
        decoration: elParams.p.decoration,
        children: elParams.p.children ?? children.children);
  }
}
