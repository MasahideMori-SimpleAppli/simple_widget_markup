import 'package:flutter/material.dart';

import '../../../enum/enum_btn_type.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class BtnParamsWrapper {
  BtnParams p;

  /// * [p] : The parameter set.
  BtnParamsWrapper(this.p);
}

///
/// (en) Parameter class used in BtnParams.
///
/// (ja) BtnParamsで利用するパラメータのクラス。
///
class NormalBtnParams {
  Key? key;
  void Function()? onPressed = () {};
  void Function()? onLongPress;
  void Function(bool)? onHover;
  void Function(bool)? onFocusChange;
  ButtonStyle? style;
  FocusNode? focusNode;
  bool? autofocus;
  Clip? clipBehavior;
  WidgetStatesController? statesController;
  Widget? icon;
  Widget? label;
}

///
/// (en) Parameter class used in BtnParams.
///
/// (ja) BtnParamsで利用するパラメータのクラス。
///
class IconBtnParams {
  Key? key;
  double? iconSize;
  VisualDensity? visualDensity;
  EdgeInsetsGeometry padding = const EdgeInsets.all(8.0);
  AlignmentGeometry alignment = Alignment.center;
  double? splashRadius;
  Color? color;
  Color? focusColor;
  Color? hoverColor;
  Color? highlightColor;
  Color? splashColor;
  Color? disabledColor;
  void Function()? onPressed = () {};
  MouseCursor? mouseCursor;
  FocusNode? focusNode;
  bool autofocus = false;
  String? tooltip;
  bool enableFeedback = true;
  BoxConstraints? constraints;
  ButtonStyle? style;
  bool? isSelected;
  Widget? selectedIcon;
  Widget? icon;
}

///
/// (en) Parameter class used in BtnParams.
///
/// (ja) BtnParamsで利用するパラメータのクラス。
///
class InkWellParams {
  Key? key;
  Widget? child;
  void Function()? onTap = () {};
  void Function()? onDoubleTap;
  void Function()? onLongPress;
  void Function(TapDownDetails)? onTapDown;
  void Function(TapUpDetails)? onTapUp;
  void Function()? onTapCancel;
  void Function(bool)? onHighlightChanged;
  void Function(bool)? onHover;
  MouseCursor? mouseCursor;
  Color? focusColor;
  Color? hoverColor;
  Color? highlightColor;
  WidgetStateProperty<Color?>? overlayColor;
  Color? splashColor;
  InteractiveInkFeatureFactory? splashFactory;
  double? radius;
  BorderRadius? borderRadius;
  ShapeBorder? customBorder;
  bool enableFeedback = true;
  bool excludeFromSemantics = false;
  FocusNode? focusNode;
  bool canRequestFocus = true;
  void Function(bool)? onFocusChange;
  bool autofocus = false;
  WidgetStatesController? statesController;
}

///
/// (en) Parameter class used in FABtnParams.
///
/// (ja) FABtnParamsで利用するパラメータのクラス。
///
class FAButtonExtendedParams {
  double? extendedIconLabelSpacing;
  EdgeInsetsGeometry? extendedPadding;
  TextStyle? extendedTextStyle;
  Widget? icon;
// Label parameter does not exist. Use child parameter of FAButtonParams.
}

///
/// (en) Parameter class used in BtnParams.
///
/// (ja) BtnParamsで利用するパラメータのクラス。
///
class FAButtonParams {
  Key? key;
  Widget? child;
  String? tooltip;
  Color? foregroundColor;
  Color? backgroundColor;
  Color? focusColor;
  Color? hoverColor;
  Color? splashColor;
  Object? heroTag;
  double? elevation;
  double? focusElevation;
  double? hoverElevation;
  double? highlightElevation;
  double? disabledElevation;
  void Function()? onPressed = () {};
  MouseCursor? mouseCursor = SystemMouseCursors.click;
  ShapeBorder? shape;
  Clip clipBehavior = Clip.none;
  FocusNode? focusNode;
  bool autofocus = false;
  MaterialTapTargetSize? materialTapTargetSize;
  bool? enableFeedback;

  // extended params
  FAButtonExtendedParams fabExtParams = FAButtonExtendedParams();
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class BtnParams {
  EnumBtnType? type;
  bool isUseIcon = false;
  NormalBtnParams? normalBtnParams;
  IconBtnParams? iconBtnParams;
  InkWellParams? inkWellBtnParams;
  FAButtonParams? faButtonParams;
  bool isEnabled = true;
}
