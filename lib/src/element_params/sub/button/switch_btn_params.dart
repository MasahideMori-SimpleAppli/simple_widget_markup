import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class SwitchBtnParamsWrapper {
  SwitchBtnParams p;

  /// * [p] : The parameter set.
  SwitchBtnParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class SwitchBtnParams {
  Key? key;
  // pre version, This is value params.
  FlagManager? manager;
  void Function(bool)? onChanged = (bool b) {};
  Color? activeColor;
  Color? activeTrackColor;
  Color? inactiveThumbColor;
  Color? inactiveTrackColor;
  ImageProvider? activeThumbImage;
  void Function(Object, StackTrace?)? onActiveThumbImageError;
  ImageProvider? inactiveThumbImage;
  void Function(Object, StackTrace?)? onInactiveThumbImageError;
  WidgetStateProperty<Color>? thumbColor;
  WidgetStateProperty<Color>? trackColor;
  WidgetStateProperty<Icon?>? thumbIcon;
  MaterialTapTargetSize? materialTapTargetSize;
  DragStartBehavior dragStartBehavior = DragStartBehavior.start;
  MouseCursor? mouseCursor;
  Color? focusColor;
  Color? hoverColor;
  WidgetStateProperty<Color>? overlayColor;
  double? splashRadius;
  FocusNode? focusNode;
  bool autofocus = false;
  bool isEnabled = true;
}
