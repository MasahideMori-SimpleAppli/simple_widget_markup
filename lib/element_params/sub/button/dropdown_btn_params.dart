import 'package:flutter/material.dart';

class DropdownBtnParamsWrapper {
  DropdownBtnParams p;

  /// * [p] : The parameter set.
  DropdownBtnParamsWrapper(this.p);
}

class DropdownMenuItemParams {
  Key? key;
  void Function()? onTap;
  int? value;
  bool enabled = true;
  AlignmentGeometry alignment = AlignmentDirectional.centerStart;
  Widget? child;
}

class DropdownBtnParams {
  // dropdown button widget parameters
  Key? key;
  List<DropdownMenuItem<int>>? items;
  List<Widget> Function(BuildContext)? selectedItemBuilder;
  int? value;
  Widget? hint;
  Widget? disabledHint;
  // cannot use this element
  // void Function(int?)? onChanged;
  void Function()? onTap;
  int elevation = 8;
  TextStyle? style;
  Widget? underline;
  Widget? icon;
  Color? iconDisabledColor;
  Color? iconEnabledColor;
  double iconSize = 24.0;
  bool isDense = false;
  bool isExpanded = false;
  double? itemHeight = kMinInteractiveDimension;
  Color? focusColor;
  FocusNode? focusNode;
  bool autofocus = false;
  Color? dropdownColor;
  double? menuMaxHeight;
  bool? enableFeedback;
  AlignmentGeometry alignment = AlignmentDirectional.centerStart;
  BorderRadius? borderRadius;
  // others
  List<DropdownMenuItemParams> dropdownMenuItemParams = [];
  int? selectedIndex;
  void Function(int index)? menuCallback;
}
