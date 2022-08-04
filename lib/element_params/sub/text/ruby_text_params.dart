import 'package:flutter/material.dart';

class RubyTextParamsWrapper {
  RubyTextParams p;

  /// * [p] : The parameter set.
  RubyTextParamsWrapper(this.p);
}

class RubyTextParams {
  static const double defSize = 0.6;
  static const String defText = "";
  static const double defLetterSpacing = 1.0;
  static const double defMargin = 2.0;
  double size = defSize;
  double letterSpacing = defLetterSpacing;
  double margin = defMargin;
  // 以下は通常テキストと同様な要素（ただし、選択機能は無い）
  String text = defText;
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
}
