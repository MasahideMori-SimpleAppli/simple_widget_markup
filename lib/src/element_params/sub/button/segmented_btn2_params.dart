import 'dart:core';

import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class SegmentedBtn2ParamsWrapper {
  SegmentedBtn2Params p;

  /// * [p] : The parameter set.
  SegmentedBtn2ParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class SegmentedBtn2Params {
  static const defMultiSelectionEnabled = false;
  static const defEmptySelectionAllowed = true;
  Key? key;
  List<ButtonSegment<String>>? segments;
  MultiSelectionManager? manager;
  // The set value is children indexes.
  void Function(Set<String>)? onSelectionChanged;
  bool multiSelectionEnabled = defMultiSelectionEnabled;
  bool emptySelectionAllowed = defEmptySelectionAllowed;
  ButtonStyle? style;
  bool showSelectedIcon = true;
  Widget? selectedIcon;
  bool isEnabled = true;
}
