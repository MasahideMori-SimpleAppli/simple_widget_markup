import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  Key? key;
  // If horizontal, children is set the horizontal layout.
  Axis axis = Axis.horizontal;
  // The split ratio.
  double ratio = 0.5;
  SystemMouseCursor cursor = SystemMouseCursors.grab;
  double barSize = 8;
  Color color = Colors.grey;
  double clampMin = 0.1;
  double clampMax = 0.9;
  // Bar drag callback
  void Function(double ratio) onChanged = (double ratio) {};
}
