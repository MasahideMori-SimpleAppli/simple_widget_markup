import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class ScrollParamsWrapper {
  ScrollParams p;

  /// * [p] : The parameter set.
  ScrollParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class ScrollParams {
  Key? key;
  Axis scrollDirection = Axis.vertical;
  bool reverse = false;
  EdgeInsetsGeometry? padding;
  bool? primary;
  ScrollPhysics? physics;
  ScrollController? controller;
  Widget? child;
  DragStartBehavior dragStartBehavior = DragStartBehavior.start;
  Clip clipBehavior = Clip.hardEdge;
  String? restorationId;
  ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
      ScrollViewKeyboardDismissBehavior.manual;
  ScrollBehavior? scrollBehavior;
}
