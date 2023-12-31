import 'package:flutter/material.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class WrapParamsWrapper {
  WrapParams p;

  /// * [p] : The parameter set.
  WrapParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class WrapParams {
  Key? key;
  Axis direction = Axis.horizontal;
  WrapAlignment alignment = WrapAlignment.start;
  double spacing = 0.0;
  WrapAlignment runAlignment = WrapAlignment.start;
  double runSpacing = 0.0;
  WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start;
  TextDirection? textDirection;
  VerticalDirection verticalDirection = VerticalDirection.down;
  Clip clipBehavior = Clip.none;
  List<Widget>? children;
}
