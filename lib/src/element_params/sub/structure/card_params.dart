import 'package:flutter/material.dart';

class CardParamsWrapper {
  CardParams p;

  /// * [p] : The parameter set.
  CardParamsWrapper(this.p);
}

class CardParams {
  Key? key;
  Color? color;
  Color? shadowColor;
  Color? surfaceTintColor;
  double? elevation;
  ShapeBorder? shape;
  bool borderOnForeground = true;
  EdgeInsetsGeometry? margin;
  Clip? clipBehavior;
  Widget? child;
  bool semanticContainer = true;
}
