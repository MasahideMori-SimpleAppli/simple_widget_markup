import 'package:flutter/material.dart';

class SuperAndSubscriptParamsWrapper {
  SuperAndSubscriptParams p;

  /// * [p] : The parameter set.
  SuperAndSubscriptParamsWrapper(this.p);
}

class SuperAndSubscriptParams {
  static const double defMag = 0.6;
  static const double defBaselineCorrection = 0;
  Key? key;
  // このテキストのサイズに大しての倍率。これをかけたサイズに縮小されます。
  double magnification = defMag;
  // ベースラインの補正値。最終的なベースラインの計算結果に加算されます。
  double baselineCorrection = defBaselineCorrection;
}
