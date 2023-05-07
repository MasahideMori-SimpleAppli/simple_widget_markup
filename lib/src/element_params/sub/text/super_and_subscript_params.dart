import 'package:flutter/material.dart';

class SuperAndSubscriptParamsWrapper {
  SuperAndSubscriptParams p;

  /// * [p] : The parameter set.
  SuperAndSubscriptParamsWrapper(this.p);
}

class SuperAndSubscriptParams {
  Key? key;
  // このテキストのサイズに大しての倍率。これをかけたサイズに縮小されます。
  double magnification = 0.5;
  // ベースラインの補正値。最終的なベースラインの計算結果に加算されます。
  double baselineCorrection = 0;
}
