import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';
import 'checkbox_params.dart';

import 'btn_params.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class RadioBtn2ParamsWrapper {
  RadioBtn2Params p;

  /// * [p] : The parameter set.
  RadioBtn2ParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class RadioBtn2Params {
  SelectableIconBtnParams? enableParams;
  SelectableIconBtnParams? disableParams;
  TagSelectionManager? manager;
  void Function(String sid)? callback = (String? sid) {};
  // If true, enable tap of label.
  bool enableTapLabel = false;
  // If enableTapLabel is true, This value is enable.
  // This inner onTap parameter is disabled.
  InkWellParams enableTapInkWellParams = InkWellParams();
  OutlinedBorder? shape;
  // The icon position.
  bool isPrefixIcon = true;
  bool isEnabled = true;
  // disabled targets.
  Set<String> disabledSelections = {};
}
