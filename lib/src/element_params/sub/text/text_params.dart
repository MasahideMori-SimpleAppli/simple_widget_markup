import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextParamsWrapper {
  TextParams p;

  /// * [p] : The parameter set.
  TextParamsWrapper(this.p);
}

class SelectableTextParams {
  String? data;
  Key? key;
  FocusNode? focusNode;
  TextStyle? style;
  StrutStyle? strutStyle;
  TextAlign? textAlign;
  TextDirection? textDirection;
  double? textScaleFactor;
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
  double? textScaleFactor;
  int? maxLines;
  String? semanticsLabel;
  TextWidthBasis? textWidthBasis;
  TextHeightBehavior? textHeightBehavior;

  // for selectable
  bool isSelectable = true;
  SelectableTextParams? selectableTextParams;
}
