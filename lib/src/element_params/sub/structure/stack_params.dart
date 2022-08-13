import 'package:flutter/material.dart';

class StackParamsWrapper {
  StackParams p;

  /// * [p] : The parameter set.
  StackParamsWrapper(this.p);
}

class StackParams {
  Key? key;
  AlignmentGeometry alignment = AlignmentDirectional.topStart;
  TextDirection? textDirection;
  StackFit fit = StackFit.loose;
  Clip clipBehavior = Clip.hardEdge;
  List<Widget>? children;
}
