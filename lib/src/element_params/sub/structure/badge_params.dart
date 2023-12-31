import 'package:flutter/material.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class BadgeParamsWrapper {
  BadgeParams p;

  /// * [p] : The parameter set.
  BadgeParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class BadgeParams {
  Key? key;
  Color? backgroundColor;
  Color? textColor;
  double? smallSize;
  double? largeSize;
  TextStyle? textStyle;
  EdgeInsetsGeometry? padding;
  AlignmentGeometry? alignment;
  Offset? offset;
  Widget? label;
  bool isLabelVisible = true;
  Widget? child;
}
