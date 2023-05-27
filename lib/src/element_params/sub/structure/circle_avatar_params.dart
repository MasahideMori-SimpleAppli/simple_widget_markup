import 'package:flutter/material.dart';

class CircleAvatarParamsWrapper {
  CircleAvatarParams p;

  /// * [p] : The parameter set.
  CircleAvatarParamsWrapper(this.p);
}

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
