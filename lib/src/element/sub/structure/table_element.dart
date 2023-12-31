import 'package:flutter/material.dart';
import '../../../element/super/multi_child_element.dart';
import '../../../element_params/element_child.dart';
import '../../../element_params/spwml_info.dart';
import 'table_row_element.dart';
import '../../../element_params/sub/structure/table_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../spwml_exception.dart';
import '../../../style/spwml_font_style.dart';

///
/// (en) The table.
///
/// (ja) tableの実装。
///
class TableElement extends MultiChildElement {
  final TableParamsWrapper elParams;

  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [info] : SpWML info.
  /// * [children] : This element children.
  /// * [elParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  TableElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      StructureElementChildren children,
      this.elParams)
      : super(serial, EnumSpWMLElementType.table, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, children);

  /// Get this class name.
  @override
  String getClassName() {
    return "TableElement";
  }

  /// Initialize the parameters.
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
          EnumSpWMLExceptionType.tableParamException, lineStart, lineEnd, info);
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

  /// Assemble and return the widget.
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
