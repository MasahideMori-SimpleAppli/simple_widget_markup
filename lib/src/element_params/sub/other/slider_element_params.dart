import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class SliderParamsWrapper {
  SliderParams p;

  /// * [p] : The parameter set.
  SliderParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class SliderParams {
  static const double defMin = 0.0;
  static const double defMax = 10.0;
  static const int defDivisions = 10;
  static const bool defUseAutoLabel = true;
  static const bool defIsIntValue = true;

  Key? key;
  // pre version, This is value params.
  ValueManager? manager;
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
  WidgetStateProperty<Color?>? overlayColor;
  MouseCursor? mouseCursor;
  String Function(double)? semanticFormatterCallback;
  FocusNode? focusNode;
  bool autofocus = false;

  // Added SpWML params. If true and divisions is not null, auto set the value string to label.
  bool useAutoLabel = defUseAutoLabel;

  // If true, autoLabel convert Int value.
  bool isIntValue = defIsIntValue;
}
