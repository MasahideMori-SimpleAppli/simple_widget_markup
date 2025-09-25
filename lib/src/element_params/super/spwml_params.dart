import 'package:flutter/material.dart';

///
/// (en) A wrapper for storing SpWML parameters.
///
/// (ja) SpWMLのパラメータ格納用のラッパー。
///
class SpWMLParamsWrapper {
  SpWMLParams p;

  /// * [p] : The parameter set.
  SpWMLParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters related to Material.
///
/// (ja) Materialに関係したパラメータを保持するためのクラス。
///
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

///
/// (en) A class for holding parameters related to Container.
///
/// (ja) Containerに関係したパラメータを保持するためのクラス。
///
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

///
/// (en) A class for holding common SpWML parameters.
///
/// (ja) SpWMLの共通パラメータを保持するためのクラス。
///
class SpWMLParams {
  String text;

  // Material
  MaterialParams? materialParams;

  // Expanded
  int? weight;
  FlexFit flexFit;

  // Transform
  double? shiftX;
  double? shiftY;

  // Constrains
  BoxConstraints? constrains;

  // Container
  ContainerParams? containerParams;

  // Visibility
  bool isGone;

  // Force wrap the Material
  bool useMaterial;

  /// The SpWMLElement Parameters.
  SpWMLParams(this.text,
      {this.materialParams,
      this.containerParams,
      this.weight,
      this.flexFit = FlexFit.tight,
      this.shiftX,
      this.shiftY,
      this.constrains,
      this.isGone = false,
      this.useMaterial = false});
}
