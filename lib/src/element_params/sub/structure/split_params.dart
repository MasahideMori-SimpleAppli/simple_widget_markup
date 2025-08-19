import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_managers/simple_managers.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class SplitParamsWrapper {
  SplitParams p;

  /// * [p] : The parameter set.
  SplitParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class SplitParams {
  ValueManager? manager;
  static const double defBarSize = 8;
  static const double defClampMin = 0.1;
  static const double defClampMax = 0.9;
  static const double defSplitRatio = 0.5;
  Key? key;
  // If horizontal, children is set the horizontal layout.
  Axis axis = Axis.horizontal;
  SystemMouseCursor cursor = SystemMouseCursors.grab;
  double barSize = defBarSize;
  Color color = Colors.grey;
  double clampMin = defClampMin;
  double clampMax = defClampMax;
  double? splitPane1MinPx; // left or top
  double? splitPane2MinPx; // right or bottom
  // Bar drag callback
  void Function(double ratio) onChanged = (double ratio) {};
}
