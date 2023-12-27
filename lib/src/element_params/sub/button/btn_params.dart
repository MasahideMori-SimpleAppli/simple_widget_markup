import 'package:flutter/material.dart';

import '../../../enum/enum_btn_type.dart';

class BtnParamsWrapper {
  BtnParams p;

  /// * [p] : The parameter set.
  BtnParamsWrapper(this.p);
}

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
  MaterialStatesController? statesController;
  Widget? icon;
  Widget? label;
}

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
  MaterialStateProperty<Color?>? overlayColor;
  Color? splashColor;
  InteractiveInkFeatureFactory? splashFactory;
  double? radius;
  BorderRadius? borderRadius;
  ShapeBorder? customBorder;
  bool? enableFeedback = true;
  bool excludeFromSemantics = false;
  FocusNode? focusNode;
  bool canRequestFocus = true;
  void Function(bool)? onFocusChange;
  bool autofocus = false;
  MaterialStatesController? statesController;
}

class FAButtonDefaultHeroTag {
  const FAButtonDefaultHeroTag();

  @override
  String toString() => 'DefFAButtonHeroTag';
}

class FAButtonExtendedParams {
  double? extendedIconLabelSpacing;
  EdgeInsetsGeometry? extendedPadding;
  TextStyle? extendedTextStyle;
  Widget? icon;
// Label parameter does not exist. Use child parameter of FAButtonParams.
}

class FAButtonParams {
  Key? key;
  Widget? child;
  String? tooltip;
  Color? foregroundColor;
  Color? backgroundColor;
  Color? focusColor;
  Color? hoverColor;
  Color? splashColor;
  Object? heroTag = const FAButtonDefaultHeroTag();
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

class BtnParams {
  EnumBtnType? type;
  bool isUseIcon = false;
  NormalBtnParams? normalBtnParams;
  IconBtnParams? iconBtnParams;
  InkWellParams? inkWellBtnParams;
  FAButtonParams? faButtonParams;
  bool isEnabled = true;
}
