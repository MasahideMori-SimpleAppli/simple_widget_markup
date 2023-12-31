import 'package:flutter/material.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class TableParamsWrapper {
  TableParams p;

  /// * [p] : The parameter set.
  TableParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
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
