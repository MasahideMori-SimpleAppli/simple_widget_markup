import 'package:flutter/material.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class CardParamsWrapper {
  CardParams p;

  /// * [p] : The parameter set.
  CardParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class CardParams {
  Key? key;
  Color? color;
  Color? shadowColor;
  Color? surfaceTintColor;
  double? elevation;
  ShapeBorder? shape;
  bool borderOnForeground = true;
  EdgeInsetsGeometry? margin;
  Clip? clipBehavior;
  Widget? child;
  bool semanticContainer = true;
}
