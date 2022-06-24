import 'package:flutter/material.dart';

class TableParamsWrapper {
  TableParams p;

  /// * [p] : The parameter set.
  TableParamsWrapper(this.p);
}

class TableParams {
  Key? key;
  List<TableRow> children = const [];
  Map<int, TableColumnWidth>? columnWidths;
  TableColumnWidth defaultColumnWidth = const FlexColumnWidth();
  TextDirection? textDirection;
  TableBorder? border;
  TableCellVerticalAlignment defaultVerticalAlignment =
      TableCellVerticalAlignment.top;
  TextBaseline? textBaseline;
}
