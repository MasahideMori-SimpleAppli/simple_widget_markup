import 'package:flutter/material.dart';

class SpWMLParamsWrapper {
  SpWMLParams p;

  /// * [p] : The parameter set.
  SpWMLParamsWrapper(this.p);
}

class MaterialParams {
  Key? key;
  MaterialType type = MaterialType.canvas;
  double elevation = 0.0;
  Color? color = Colors.transparent;
  Color? shadowColor;
  Color? surfaceTintColor;
  TextStyle? textStyle;
  BorderRadiusGeometry? borderRadius;
  ShapeBorder? shape;
  bool borderOnForeground = true;
  Clip clipBehavior = Clip.none;
  Duration animationDuration = kThemeChangeDuration;
  Widget? child;
}

class ContainerParams {
  Key? key;
  AlignmentGeometry? alignment;
  EdgeInsetsGeometry? padding;
  Color? color;
  Decoration? decoration;
  Decoration? foregroundDecoration;
  double? width;
  double? height;
  BoxConstraints? constraints;
  EdgeInsetsGeometry? margin;
  Matrix4? transform;
  AlignmentGeometry? transformAlignment;
  Widget? child;
  Clip clipBehavior = Clip.none;
}

class SpWMLParams {
  String text;

  // Material
  MaterialParams? materialParams;

  // Expanded
  int? weight;

  // Transform
  double? shiftX;
  double? shiftY;

  // Constrains
  BoxConstraints? constrains;

  // Container
  ContainerParams? containerParams;

  /// The SpWMLElement Parameters.
  SpWMLParams(this.text,
      {this.materialParams,
      this.containerParams,
      this.weight,
      this.shiftX,
      this.shiftY,
      this.constrains});
}
