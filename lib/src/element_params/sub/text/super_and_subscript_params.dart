import 'package:flutter/material.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class SuperAndSubscriptParamsWrapper {
  SuperAndSubscriptParams p;

  /// * [p] : The parameter set.
  SuperAndSubscriptParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class SuperAndSubscriptParams {
  static const double defMag = 0.6;
  static const double defBaselineCorrection = 0;
  Key? key;
  // このテキストのサイズに大しての倍率。これをかけたサイズに縮小されます。
  double magnification = defMag;
  // ベースラインの補正値。最終的なベースラインの計算結果に加算されます。
  double baselineCorrection = defBaselineCorrection;
}
