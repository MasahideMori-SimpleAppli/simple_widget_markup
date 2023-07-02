import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';
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
  // pre version, This is value params.
  ValueManager? manager;
  Color? backgroundColor;
  Color? color;
  Animation<Color?>? valueColor;
  double strokeWidth = 4.0;
  String? semanticsLabel;
  String? semanticsValue;
}

class LinearProgressIndicatorParams {
  Key? key;
  // pre version, This is value params.
  ValueManager? manager;
  Color? backgroundColor;
  Color? color;
  Animation<Color?>? valueColor;
  double? minHeight;
  String? semanticsLabel;
  String? semanticsValue;
}
