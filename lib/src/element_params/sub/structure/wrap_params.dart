import 'package:flutter/material.dart';

class WrapParamsWrapper {
  WrapParams p;

  /// * [p] : The parameter set.
  WrapParamsWrapper(this.p);
}

class WrapParams {
  Key? key;
  Axis direction = Axis.horizontal;
  WrapAlignment alignment = WrapAlignment.start;
  double spacing = 0.0;
  WrapAlignment runAlignment = WrapAlignment.start;
  double runSpacing = 0.0;
  WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start;
  TextDirection? textDirection;
  VerticalDirection verticalDirection = VerticalDirection.down;
  Clip clipBehavior = Clip.none;
  List<Widget>? children;
}
