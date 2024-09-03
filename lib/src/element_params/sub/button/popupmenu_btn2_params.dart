import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class PopupMenuBtn2ParamsWrapper {
  PopupMenuBtn2Params p;

  /// * [p] : The parameter set.
  PopupMenuBtn2ParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class PopupMenuItemParams2 {
  Key? key;
  String? value; // non use
  void Function()? onTap;
  bool enabled = true;
  double height = kMinInteractiveDimension;
  EdgeInsets? padding;
  TextStyle? textStyle;
  MouseCursor? mouseCursor;
  Widget? child;
}

class PopupMenuBtn2Params {
  // popupmenu button parameters
  Key? key;
  List<PopupMenuEntry<String>> Function(BuildContext)? itemBuilder;
  SelectionManager? manager;
  void Function()? onOpened;
  void Function(String)? onSelected;
  void Function()? onCanceled;
  String? tooltip;
  double? elevation;
  EdgeInsetsGeometry padding = const EdgeInsets.all(8.0);
  Widget? child;
  double? splashRadius;
  Widget? icon;
  double? iconSize;
  Offset offset = Offset.zero;
  bool enabled = true;
  ShapeBorder? shape;
  Color? color;
  bool? enableFeedback;
  BoxConstraints? constraints;
  PopupMenuPosition position = PopupMenuPosition.over;
  Clip clipBehavior = Clip.none;
  // others
  List<PopupMenuItemParams2> popupMenuItemParams = [];
  void Function(String sid)? menuCallback;
  bool isEnabled = true;
}
