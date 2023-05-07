import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SwitchBtnParamsWrapper {
  SwitchBtnParams p;

  /// * [p] : The parameter set.
  SwitchBtnParamsWrapper(this.p);
}

class SwitchBtnParams {
  Key? key;
  bool value = false;
  void Function(bool)? onChanged = (bool b) {};
  Color? activeColor;
  Color? activeTrackColor;
  Color? inactiveThumbColor;
  Color? inactiveTrackColor;
  ImageProvider? activeThumbImage;
  void Function(Object, StackTrace?)? onActiveThumbImageError;
  ImageProvider? inactiveThumbImage;
  void Function(Object, StackTrace?)? onInactiveThumbImageError;
  MaterialStateProperty<Color>? thumbColor;
  MaterialStateProperty<Color>? trackColor;
  MaterialStateProperty<Icon?>? thumbIcon;
  MaterialTapTargetSize? materialTapTargetSize;
  DragStartBehavior dragStartBehavior = DragStartBehavior.start;
  MouseCursor? mouseCursor;
  Color? focusColor;
  Color? hoverColor;
  MaterialStateProperty<Color>? overlayColor;
  double? splashRadius;
  FocusNode? focusNode;
  bool autofocus = false;
}
