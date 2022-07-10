import 'package:flutter/material.dart';

import 'btn_params.dart';
import 'checkbox_params.dart';

class RadioBtnParamsWrapper {
  RadioBtnParams p;

  /// * [p] : The parameter set.
  RadioBtnParamsWrapper(this.p);
}

class RadioBtnParams {
  SelectableIconBtnParams? enableParams;
  SelectableIconBtnParams? disableParams;
  int? selectedIndex;
  void Function(int? selectedIndex)? callback = (int? i) {};
  // If true, enable tap of label.
  bool enableTapLabel = false;
  // If enableTapLabel is true, This value is enable.
  // This inner onTap parameter is disabled.
  InkWellParams enableTapInkWellParams = InkWellParams();
  OutlinedBorder? shape;
}
