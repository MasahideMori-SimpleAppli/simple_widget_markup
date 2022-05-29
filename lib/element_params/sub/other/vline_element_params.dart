import 'package:flutter/material.dart';

class VLineParamsWrapper {
  VLineParams p;

  /// * [p] : The parameter set.
  VLineParamsWrapper(this.p);
}

class VLineParams {
  Key? key;
  double? width;
  double? thickness;
  double? indent;
  double? endIndent;
  Color? color;
}
