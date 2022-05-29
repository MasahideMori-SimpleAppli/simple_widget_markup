import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ScrollParamsWrapper {
  ScrollParams p;

  /// * [p] : The parameter set.
  ScrollParamsWrapper(this.p);
}

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
}
