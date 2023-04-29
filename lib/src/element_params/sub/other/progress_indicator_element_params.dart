import 'package:flutter/material.dart';
import '../../../../simple_widget_markup.dart';

class ProgressIndicatorParamsWrapper {
  ProgressIndicatorParams p;

  /// * [p] : The parameter set.
  ProgressIndicatorParamsWrapper(this.p);
}

class ProgressIndicatorParams {
  EnumIndicatorType indicatorType = EnumIndicatorType.circular;
  CircularProgressIndicatorParams? circularProgressIndicatorParams;
  LinearProgressIndicatorParams? linearProgressIndicatorParams;
}

class CircularProgressIndicatorParams {
  Key? key;
  double? value;
  Color? backgroundColor;
  Color? color;
  Animation<Color?>? valueColor;
  double strokeWidth = 4.0;
  String? semanticsLabel;
  String? semanticsValue;
}

class LinearProgressIndicatorParams {
  Key? key;
  double? value;
  Color? backgroundColor;
  Color? color;
  Animation<Color?>? valueColor;
  double? minHeight;
  String? semanticsLabel;
  String? semanticsValue;
}
