import 'dart:core';

import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class SegmentedBtnParamsWrapper {
  SegmentedBtnParams p;

  /// * [p] : The parameter set.
  SegmentedBtnParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class SegmentedBtnParams {
  static const defMultiSelectionEnabled = false;
  static const defEmptySelectionAllowed = true;
  Key? key;
  List<ButtonSegment<int>>? segments;
  // pre version, This is selected params.
  MultiIndexManager? manager;
  // The set value is children indexes.
  void Function(Set<int>)? onSelectionChanged;
  bool multiSelectionEnabled = defMultiSelectionEnabled;
  bool emptySelectionAllowed = defEmptySelectionAllowed;
  ButtonStyle? style;
  bool showSelectedIcon = true;
  Widget? selectedIcon;
  bool isEnabled = true;
}
