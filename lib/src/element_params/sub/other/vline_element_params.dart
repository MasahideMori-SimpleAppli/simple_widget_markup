import 'package:flutter/material.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class VLineParamsWrapper {
  VLineParams p;

  /// * [p] : The parameter set.
  VLineParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class VLineParams {
  Key? key;
  double? width;
  double? thickness;
  double? indent;
  double? endIndent;
  Color? color;
}
