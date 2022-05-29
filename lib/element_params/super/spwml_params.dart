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
  Color? color;
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

class SpWMLParams {
  String text;

  // Material
  MaterialParams? material;

  // Expanded
  int? weight;

  // Transform
  double? shiftX;
  double? shiftY;

  // Constrains
  BoxConstraints? constrains;

  // Container
  double? height;
  double? width;
  EdgeInsets? margin;
  EdgeInsets? padding;
  Color? bgColor;

  /// The SpWMLElement Parameters.
  SpWMLParams(this.text,
      {this.material,
      this.weight,
      this.shiftX,
      this.shiftY,
      this.constrains,
      this.height,
      this.width,
      this.margin,
      this.padding,
      this.bgColor});
}
