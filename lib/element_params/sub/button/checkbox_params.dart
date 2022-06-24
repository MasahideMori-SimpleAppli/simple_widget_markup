import 'package:flutter/material.dart';

class CheckboxParamsWrapper {
  CheckboxParams p;

  /// * [p] : The parameter set.
  CheckboxParamsWrapper(this.p);
}

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
  Widget? icon;
}

class CheckboxParams {
  SelectableIconBtnParams? enableParams;
  SelectableIconBtnParams? disableParams;
  List<bool>? checkValues;
  List<void Function(bool isEnabled)?>? callbacks;
}
