import 'package:flutter/material.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class StackParamsWrapper {
  StackParams p;

  /// * [p] : The parameter set.
  StackParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class StackParams {
  Key? key;
  AlignmentGeometry alignment = AlignmentDirectional.topStart;
  TextDirection? textDirection;
  StackFit fit = StackFit.loose;
  Clip clipBehavior = Clip.hardEdge;
  List<Widget>? children;
}
