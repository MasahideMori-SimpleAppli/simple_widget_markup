import 'dart:core';

import 'package:flutter/material.dart';

class SegmentedBtnParamsWrapper {
  SegmentedBtnParams p;

  /// * [p] : The parameter set.
  SegmentedBtnParamsWrapper(this.p);
}

class SegmentedBtnParams {
  Key? key;
  List<ButtonSegment<int>>? segments;
  Set<int>? selected;
  // The set value is children indexes.
  void Function(Set<int>)? onSelectionChanged;
  bool multiSelectionEnabled = false;
  bool emptySelectionAllowed = false;
  ButtonStyle? style;
  bool showSelectedIcon = true;
  Widget? selectedIcon;
}
