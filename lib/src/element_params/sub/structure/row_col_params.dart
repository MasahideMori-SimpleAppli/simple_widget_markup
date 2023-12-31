import 'package:flutter/material.dart';

///
/// (en) Wrapper class for parameters used in Row or Col.
///
/// (ja) RowまたはColで利用するパラメータ用ラッパークラス。
///
class RowColParamsWrapper {
  RowColParams p;

  /// * [p] : The parameter set.
  RowColParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters used in Row or hCol.
///
/// (ja) RowまたｈColで利用するパラメータを保持するためのクラス。
///
class RowColParams {
  Key? key;
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;
  MainAxisSize mainAxisSize = MainAxisSize.max;
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start;
  TextDirection? textDirection;
  VerticalDirection verticalDirection = VerticalDirection.down;
  TextBaseline? textBaseline;
  List<Widget>? children;
}
