import 'package:flutter/material.dart';

class SliderParamsWrapper {
  SliderParams p;

  /// * [p] : The parameter set.
  SliderParamsWrapper(this.p);
}

class SliderParams {
  static const double defValue = 0.0;
  static const double defMin = 0.0;
  static const double defMax = 10.0;
  static const int defDivisions = 10;
  static const bool defUseAutoLabel = true;
  static const bool defIsIntValue = true;

  Key? key;
  double value = defValue;
  double? secondaryTrackValue;
  void Function(double)? onChanged = (double d) {};
  void Function(double)? onChangeStart;
  void Function(double)? onChangeEnd;
  double min = defMin;
  double max = defMax;
  int? divisions = defDivisions;
  String? label;
  Color? activeColor;
  Color? inactiveColor;
  Color? secondaryActiveColor;
  Color? thumbColor;
  MaterialStateProperty<Color?>? overlayColor;
  MouseCursor? mouseCursor;
  String Function(double)? semanticFormatterCallback;
  FocusNode? focusNode;
  bool autofocus = false;

  // Added SpWML params. If true and divisions is not null, auto set the value string to label.
  bool useAutoLabel = defUseAutoLabel;

  // If true, autoLabel convert Int value.
  bool isIntValue = defIsIntValue;
}
