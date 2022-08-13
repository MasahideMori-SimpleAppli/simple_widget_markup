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
  Color? color;
  String? semanticLabel;
  TextDirection? textDirection;
  List<Shadow>? shadows;
}
