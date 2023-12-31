import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class DropdownBtnParamsWrapper {
  DropdownBtnParams p;

  /// * [p] : The parameter set.
  DropdownBtnParamsWrapper(this.p);
}

///
/// (en) Parameter class used in DropdownBtnParams.
///
/// (ja) DropdownBtnParamsで利用するパラメータのクラス。
///
class DropdownMenuItemParams {
  Key? key;
  void Function()? onTap;
  int? value;
  bool enabled = true;
  AlignmentGeometry alignment = AlignmentDirectional.centerStart;
  Widget? child;
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
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
  EdgeInsetsGeometry? padding;
  // others
  List<DropdownMenuItemParams> dropdownMenuItemParams = [];
  // Pre version, This is selectedIndex.
  IndexManager? manager;
  void Function(int index)? menuCallback;
  bool isEnabled = true;
}
