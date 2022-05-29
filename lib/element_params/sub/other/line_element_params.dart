import 'package:flutter/material.dart';

class LineParamsWrapper {
  LineParams p;

  /// * [p] : The parameter set.
  LineParamsWrapper(this.p);
}

class LineParams {
  Key? key;
  double? height;
  double? thickness;
  double? indent;
  double? endIndent;
  Color? color;
}
