import 'package:flutter/material.dart';
import '../../../element/super/multi_child_element.dart';
import '../../../element_params/element_child.dart';
import '../../../element_params/spwml_info.dart';
import '../../../element_params/sub/structure/table_row_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../style/spwml_font_style.dart';

///
/// (en) The tableRow.
///
/// (ja) tableRowの実装。
///
class TableRowElement extends MultiChildElement {
  final TableRowParamsWrapper elParams;

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
  TableRowElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      StructureElementChildren children,
      this.elParams,
      {super.key})
      : super(serial, EnumSpWMLElementType.tableRow, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, children);

  /// Get this class name.
  @override
  String getClassName() {
    return "TableRowElement";
  }

  /// Initialize the parameters.
  @override
  TableRowElement initParams() {
    super.initParams();
    if (params.containsKey(EnumSpWMLParams.color)) {
      elParams.p.decoration =
          BoxDecoration(color: params[EnumSpWMLParams.color]);
    }
    return this;
  }

  /// Assemble and return the widget.
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
