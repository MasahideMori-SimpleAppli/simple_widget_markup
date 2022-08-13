import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../text/text_params.dart';

class SpanParamsWrapper {
  SpanParams p;

  /// * [p] : The parameter set.
  SpanParamsWrapper(this.p);
}

class SelectableTextRichParams {
  TextSpan? textSpan;
  SelectableTextParams selectableTextParams = SelectableTextParams();
}

class RichTextParams {
  Key? key;
  InlineSpan? text;
  TextAlign? textAlign;
  TextDirection? textDirection;
  bool softWrap = true;
  TextOverflow overflow = TextOverflow.clip;
  double? textScaleFactor;
  int? maxLines;
  Locale? locale;
  StrutStyle? strutStyle;
  TextWidthBasis textWidthBasis = TextWidthBasis.parent;
  TextHeightBehavior? textHeightBehavior;
}

class TextSpanParams {
  String? text;
  List<InlineSpan>? children;
  TextStyle? style;
  GestureRecognizer? recognizer;
  MouseCursor? mouseCursor;
  void Function(PointerEnterEvent)? onEnter;
  void Function(PointerExitEvent)? onExit;
  String? semanticsLabel;
  Locale? locale;
  bool? spellOut;
}

class SpanParams {
  bool isSelectable = true;
  double? textScaleFactor;
  SelectableTextRichParams? selectableTextRichParams;
  RichTextParams? richTextParams;
  List<TextSpanParams>? textSpanParamsList;
}
