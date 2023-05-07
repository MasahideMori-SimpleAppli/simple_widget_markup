import 'package:flutter/rendering.dart';

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
  SelectionRegistrar? selectionRegistrar;
  Color? selectionColor;
}

class SpanParams {
  bool isSelectable = true;
  double? textScaleFactor;
  SelectableTextRichParams? selectableTextRichParams;
  RichTextParams? richTextParams;
  // trueの場合、レイアウトを全てWidgetSpanにし、位置を正確に描画する。
  bool isLayoutStrictMode = false;
}
