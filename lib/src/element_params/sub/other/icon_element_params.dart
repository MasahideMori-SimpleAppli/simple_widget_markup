import 'package:flutter/material.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class IconParamsWrapper {
  IconParams p;

  /// * [p] : The parameter set.
  IconParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class IconParams {
  IconData? icon;
  Key? key;
  double? size;
  double? fill;
  double? weight;
  double? grade;
  double? opticalSize;
  Color? color;
  List<Shadow>? shadows;
  String? semanticLabel;
  TextDirection? textDirection;
}
