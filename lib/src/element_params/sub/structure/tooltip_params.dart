import 'package:flutter/material.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class TooltipParamsWrapper {
  TooltipParams p;

  /// * [p] : The parameter set.
  TooltipParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class TooltipParams {
  Key? key;
  String? message;
  InlineSpan? richMessage;
  double? height;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  double? verticalOffset;
  bool? preferBelow;
  bool? excludeFromSemantics;
  Decoration? decoration;
  TextStyle? textStyle;
  TextAlign? textAlign;
  Duration? waitDuration;
  Duration? showDuration;
  Duration? exitDuration;
  bool enableTapToDismiss = true;
  TooltipTriggerMode? triggerMode;
  bool? enableFeedback;
  void Function()? onTriggered;
  Widget? child;
}
