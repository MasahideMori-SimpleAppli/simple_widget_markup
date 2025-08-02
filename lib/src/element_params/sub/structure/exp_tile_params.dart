import 'package:flutter/material.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class ExpTileParamsWrapper {
  ExpTileParams p;

  /// * [p] : The parameter set.
  ExpTileParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class ExpTileParams {
  Key? key;
  Widget? leading;
  Widget? title;
  Widget? subtitle;
  void Function(bool)? onExpansionChanged;
  List<Widget>? children;
  Widget? trailing;
  bool showTrailingIcon = true;
  bool initiallyExpanded = false;
  bool maintainState = false;
  EdgeInsetsGeometry? tilePadding;
  CrossAxisAlignment? expandedCrossAxisAlignment;
  Alignment? expandedAlignment;
  EdgeInsetsGeometry? childrenPadding;
  Color? backgroundColor;
  Color? collapsedBackgroundColor;
  Color? textColor;
  Color? collapsedTextColor;
  Color? iconColor;
  Color? collapsedIconColor;
  ShapeBorder? shape;
  ShapeBorder? collapsedShape;
  Clip? clipBehavior;
  ListTileControlAffinity? controlAffinity;
  ExpansibleController? controller;
  bool? dense;
  VisualDensity? visualDensity;
  double? minTileHeight;
  bool? enableFeedback = true;
  bool enabled = true;
  AnimationStyle? expansionAnimationStyle;
  bool internalAddSemanticForOnTap = false;
}
