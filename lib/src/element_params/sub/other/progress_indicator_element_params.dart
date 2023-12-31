import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';
import '../../../../simple_widget_markup.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class ProgressIndicatorParamsWrapper {
  ProgressIndicatorParams p;

  /// * [p] : The parameter set.
  ProgressIndicatorParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class ProgressIndicatorParams {
  EnumIndicatorType indicatorType = EnumIndicatorType.circular;
  CircularProgressIndicatorParams? circularProgressIndicatorParams;
  LinearProgressIndicatorParams? linearProgressIndicatorParams;
}

///
/// (en) Parameter class used in ProgressIndicatorParams.
///
/// (ja) ProgressIndicatorParamsで利用するパラメータのクラス。
///
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

///
/// (en) Parameter class used in ProgressIndicatorParams.
///
/// (ja) ProgressIndicatorParamsで利用するパラメータのクラス。
///
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
