import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';
import 'package:simple_widget_markup/simple_widget_markup.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class RadioBtnParamsWrapper {
  RadioBtnParams p;

  /// * [p] : The parameter set.
  RadioBtnParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class RadioBtnParams {
  SelectableIconBtnParams? enableParams;
  SelectableIconBtnParams? disableParams;
  // pre version, this is selectedIndex.
  IndexManager? manager;
  void Function(int? selectedIndex)? callback = (int? i) {};
  // If true, enable tap of label.
  bool enableTapLabel = false;
  // If enableTapLabel is true, This value is enable.
  // This inner onTap parameter is disabled.
  InkWellParams enableTapInkWellParams = InkWellParams();
  OutlinedBorder? shape;
  // The icon position.
  bool isPrefixIcon = true;
  bool isEnabled = true;
  // Buttons for indexes included in this list will be disabled.
  List<int> disabledIndexes = [];
}
