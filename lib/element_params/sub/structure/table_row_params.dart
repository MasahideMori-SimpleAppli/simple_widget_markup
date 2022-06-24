import 'package:flutter/material.dart';

class TableRowParamsWrapper {
  TableRowParams p;

  /// * [p] : The parameter set.
  TableRowParamsWrapper(this.p);
}

class TableRowParams {
  LocalKey? key;
  Decoration? decoration;
  List<Widget>? children;
}
