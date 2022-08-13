import 'package:flutter/material.dart';
import 'table_row_element.dart';
import '../../../element_params/element_child.dart';
import '../../../element_params/sub/structure/table_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../spwml_exception.dart';
import '../../../style/spwml_font_style.dart';
import '../../super/spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-06-13 21:12:04
///
class TableElement extends SpWMLElement {
  final StructureElementChildren children;
  final TableParamsWrapper elParams;

  TableElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlEP,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children,
      this.elParams)
      : super(serial, EnumSpWMLElementType.table, params, spwmlEP, parentSerial,
            lineStart, lineEnd, style);

  @override
  TableElement initParams() {
    super.initParams();
    if (params.containsKey(EnumSpWMLParams.hNum)) {
      final int hNum = params[EnumSpWMLParams.hNum];
      elParams.p.columnWidths = {};
      for (int i = 0; i < hNum; i++) {
        elParams.p.columnWidths![i] = const IntrinsicColumnWidth();
      }
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.tableParamException, lineStart, lineEnd);
    }
    elParams.p.border = TableBorder.all(
      color: params.containsKey(EnumSpWMLParams.color)
          ? params[EnumSpWMLParams.color]
          : Colors.black87,
      width: params.containsKey(EnumSpWMLParams.borderWidth)
          ? params[EnumSpWMLParams.borderWidth]
          : 1.0,
      style: BorderStyle.solid,
      borderRadius: params.containsKey(EnumSpWMLParams.borderRadius)
          ? BorderRadius.circular(params[EnumSpWMLParams.borderRadius])
          : BorderRadius.zero,
    );
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    return Table(
      key: elParams.p.key,
      children: _getChildren(),
      columnWidths: elParams.p.columnWidths,
      textDirection: elParams.p.textDirection,
      border: elParams.p.border,
      defaultVerticalAlignment: elParams.p.defaultVerticalAlignment,
      textBaseline: elParams.p.textBaseline,
    );
  }

  List<TableRow> _getChildren() {
    List<TableRow> r = [];
    for (Widget i in children.children) {
      if (i is TableRow) {
        r.add(i as TableRow);
      } else {
        if (i is TableRowElement) {
          r.add(i.getTableRow());
        }
      }
    }
    return r;
  }
}
