import 'package:flutter/rendering.dart';

import 'package:simple_widget_markup/simple_widget_markup.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class SpanParamsWrapper {
  SpanParams p;

  /// * [p] : The parameter set.
  SpanParamsWrapper(this.p);
}

///
/// (en) Parameter class used in SpanParams.
///
/// (ja) SpanParamsで利用するパラメータのクラス。
///
class SelectableTextRichParams {
  TextSpan? textSpan;
  SelectableTextParams selectableTextParams = SelectableTextParams();
}

///
/// (en) Parameter class used in SpanParams.
///
/// (ja) SpanParamsで利用するパラメータのクラス。
///
class RichTextParams {
  Key? key;
  InlineSpan? text;
  TextAlign? textAlign;
  TextDirection? textDirection;
  bool softWrap = true;
  TextOverflow overflow = TextOverflow.clip;
  TextScaler? textScaler;
  int? maxLines;
  Locale? locale;
  StrutStyle? strutStyle;
  TextWidthBasis textWidthBasis = TextWidthBasis.parent;
  TextHeightBehavior? textHeightBehavior;
  SelectionRegistrar? selectionRegistrar;
  Color? selectionColor;
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class SpanParams {
  bool isSelectable = true;
  double? textScaleFactor;
  SelectableTextRichParams? selectableTextRichParams;
  RichTextParams? richTextParams;
  // trueの場合、レイアウトを全てWidgetSpanにし、位置を正確に描画する。
  bool isLayoutStrictMode = false;
}
