import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class TextParamsWrapper {
  TextParams p;

  /// * [p] : The parameter set.
  TextParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters used in the text class.
///
/// (ja) テキストクラスで利用するパラメータを保持するためのクラス。
///
class SelectableTextParams {
  String? data;
  Key? key;
  FocusNode? focusNode;
  TextStyle? style;
  StrutStyle? strutStyle;
  TextAlign? textAlign;
  TextDirection? textDirection;
  TextScaler? textScaler;
  bool showCursor = false;
  bool autofocus = false;
  int? minLines;
  int? maxLines;
  double cursorWidth = 0.0;
  double? cursorHeight;
  Radius? cursorRadius;
  Color? cursorColor;
  BoxHeightStyle selectionHeightStyle = BoxHeightStyle.tight;
  BoxWidthStyle selectionWidthStyle = BoxWidthStyle.tight;
  DragStartBehavior dragStartBehavior = DragStartBehavior.start;
  bool enableInteractiveSelection = true;
  TextSelectionControls? selectionControls;
  void Function()? onTap;
  ScrollPhysics? scrollPhysics;
  String? semanticsLabel;
  TextHeightBehavior? textHeightBehavior;
  TextWidthBasis? textWidthBasis;
  Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;
  TextMagnifierConfiguration? magnifierConfiguration;
  void Function(TextSelection, SelectionChangedCause?)? onSelectionChanged;
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class TextParams {
  String? data;
  Key? key;
  TextStyle? style;
  StrutStyle? strutStyle;
  TextAlign? textAlign;
  TextDirection? textDirection;
  Locale? locale;
  bool? softWrap;
  TextOverflow? overflow;
  TextScaler? textScaler;
  int? maxLines;
  String? semanticsLabel;
  TextWidthBasis? textWidthBasis;
  TextHeightBehavior? textHeightBehavior;
  Color? selectionColor;

  // for selectable
  bool isSelectable = true;
  SelectableTextParams? selectableTextParams;
}
