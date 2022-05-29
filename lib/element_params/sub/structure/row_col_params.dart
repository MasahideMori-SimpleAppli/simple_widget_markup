import 'package:flutter/material.dart';

class RowColParamsWrapper {
  RowColParams p;

  /// * [p] : The parameter set.
  RowColParamsWrapper(this.p);
}

class RowColParams {
  Key? key;
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;
  MainAxisSize mainAxisSize = MainAxisSize.max;
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start;
  TextDirection? textDirection;
  VerticalDirection verticalDirection = VerticalDirection.down;
  TextBaseline? textBaseline;
  List<Widget>? children;
}
