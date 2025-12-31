import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';

import 'package:simple_widget_markup/simple_widget_markup.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class DropdownBtn2ParamsWrapper {
  DropdownBtn2Params p;

  /// * [p] : The parameter set.
  DropdownBtn2ParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class DropdownBtn2Params {
  // dropdown button widget parameters
  Key? key;
  List<DropdownMenuItem<String>>? items;
  List<Widget> Function(BuildContext)? selectedItemBuilder;
  String? value; // non use
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
  TagSelectionManager? manager;
  void Function(String sid)? menuCallback;
  bool isEnabled = true;
}
