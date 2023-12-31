import 'package:flutter/material.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class CircleAvatarParamsWrapper {
  CircleAvatarParams p;

  /// * [p] : The parameter set.
  CircleAvatarParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class CircleAvatarParams {
  Key? key;
  Widget? child;
  Color? backgroundColor;
  ImageProvider<Object>? backgroundImage;
  ImageProvider<Object>? foregroundImage;
  void Function(Object, StackTrace?)? onBackgroundImageError;
  void Function(Object, StackTrace?)? onForegroundImageError;
  Color? foregroundColor;
  double? radius;
  double? minRadius;
  double? maxRadius;
}
