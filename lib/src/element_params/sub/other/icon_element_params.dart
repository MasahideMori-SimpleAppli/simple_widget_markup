import 'package:flutter/material.dart';

class IconParamsWrapper {
  IconParams p;

  /// * [p] : The parameter set.
  IconParamsWrapper(this.p);
}

class IconParams {
  IconData? icon;
  Key? key;
  double? size;
  double? fill;
  double? weight;
  double? grade;
  double? opticalSize;
  Color? color;
  List<Shadow>? shadows;
  String? semanticLabel;
  TextDirection? textDirection;
}
