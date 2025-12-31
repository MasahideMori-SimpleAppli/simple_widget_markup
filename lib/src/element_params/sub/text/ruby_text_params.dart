import 'package:flutter/material.dart';
import 'package:simple_widget_markup/simple_widget_markup.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class RubyTextParamsWrapper {
  RubyTextParams p;

  /// * [p] : The parameter set.
  RubyTextParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
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
  TextScaler? textScaler;
  int? maxLines;
  String? semanticsLabel;
  TextWidthBasis? textWidthBasis;
  TextHeightBehavior? textHeightBehavior;

  // for selectable. ruby text part default is false.
  bool isSelectable = false;
  SelectableTextParams? selectableTextParams;
}
