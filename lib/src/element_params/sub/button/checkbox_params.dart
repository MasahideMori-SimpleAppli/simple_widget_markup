import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';

import 'package:simple_widget_markup/simple_widget_markup.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class CheckboxParamsWrapper {
  CheckboxParams p;

  /// * [p] : The parameter set.
  CheckboxParamsWrapper(this.p);
}

///
/// (en) Parameter class used in CheckboxParams.
///
/// (ja) CheckboxParamsで利用するパラメータのクラス。
///
class SelectableIconBtnParams {
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
  // Material V3 color mode.
  // Note, however, that the specifications themselves are not material widget.
  bool isV3 = false;
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class CheckboxParams {
  SelectableIconBtnParams? enableParams;
  SelectableIconBtnParams? disableParams;
  // selection manager. pre version, this is checkValues.
  MultiFlagManager? manager;
  void Function(List<bool>? checkValues)? callback;
  // If true, enable tap of label.
  bool enableTapLabel = false;
  // If enableTapLabel is true, This value is enable.
  // This inner onTap parameter is disabled.
  InkWellParams enableTapInkWellParams = InkWellParams();
  OutlinedBorder? shape;
  // The icon position.
  bool isPrefixIcon = true;
  bool isEnabled = true;
  // Buttons for indexes included in this list will be disabled.
  List<int> disabledIndexes = [];
}
