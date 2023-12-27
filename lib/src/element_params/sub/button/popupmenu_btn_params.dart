import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';

class PopupMenuBtnParamsWrapper {
  PopupMenuBtnParams p;

  /// * [p] : The parameter set.
  PopupMenuBtnParamsWrapper(this.p);
}

class PopupMenuItemParams {
  Key? key;
  int? value;
  void Function()? onTap;
  bool enabled = true;
  double height = kMinInteractiveDimension;
  EdgeInsets? padding;
  TextStyle? textStyle;
  MouseCursor? mouseCursor;
  Widget? child;
}

class PopupMenuBtnParams {
  // popupmenu button parameters
  Key? key;
  List<PopupMenuEntry<int>> Function(BuildContext)? itemBuilder;
  // pre version, this is initialValue.
  IndexManager? manager;
  void Function()? onOpened;
  void Function(int)? onSelected;
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
  List<PopupMenuItemParams> popupMenuItemParams = [];
  void Function(int index)? menuCallback;
  bool isEnabled = true;
}
