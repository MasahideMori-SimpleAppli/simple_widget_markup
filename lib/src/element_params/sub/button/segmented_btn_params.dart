import 'dart:core';

import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';

class SegmentedBtnParamsWrapper {
  SegmentedBtnParams p;

  /// * [p] : The parameter set.
  SegmentedBtnParamsWrapper(this.p);
}

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
