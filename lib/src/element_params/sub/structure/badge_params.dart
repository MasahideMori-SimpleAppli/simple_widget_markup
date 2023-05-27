import 'package:flutter/material.dart';

class BadgeParamsWrapper {
  BadgeParams p;

  /// * [p] : The parameter set.
  BadgeParamsWrapper(this.p);
}

class BadgeParams {
  Key? key;
  Color? backgroundColor;
  Color? textColor;
  double? smallSize;
  double? largeSize;
  TextStyle? textStyle;
  EdgeInsetsGeometry? padding;
  AlignmentGeometry? alignment;
  Offset? offset;
  Widget? label;
  bool isLabelVisible = true;
  Widget? child;
}
