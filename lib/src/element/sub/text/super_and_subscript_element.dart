import 'package:flutter/material.dart';
import 'dart:math';

import '../../../../simple_widget_markup.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2023-05-06 23:16:05
///
class SuperAndSubscriptElement extends TextElement {
  final SuperAndSubscriptParamsWrapper elParams;

  ///
  /// * [serial] : Array Index.
  /// * [type] : Element type.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [info] : SpWML info.
  /// * [textParams] : Parent class parameters.
  /// * [rubyParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  SuperAndSubscriptElement(
      int serial,
      EnumSpWMLElementType type,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      TextParamsWrapper textParams,
      this.elParams)
      : super(serial, type, params, spwmlParams, parentSerial, lineStart,
            lineEnd, style, info, textParams);

  @override
  SuperAndSubscriptElement initParams() {
    super.initParams();
    elParams.p.baselineCorrection =
        params.containsKey(EnumSpWMLParams.baselineCorrection)
            ? params[EnumSpWMLParams.baselineCorrection]
            : 0.0;
    return this;
  }

  /// non null font size.
  double _getDefFontSizeNonNull() {
    return style.styleMap[EnumSpWMLElementType.text]?.fontSize ?? 18;
  }

  /// change small size.
  @override
  double? getFontSize() {
    double? fontSize = super.getFontSize();
    if (fontSize == null) {
      return _getDefFontSizeNonNull() * elParams.p.magnification;
    } else {
      return fontSize * elParams.p.magnification;
    }
  }

  /// calculate script offset.
  Offset _getOffset() {
    if (type == EnumSpWMLElementType.superscript) {
      return Offset(
          0,
          getFontSize()! -
              (super.getFontSize() ?? 18) -
              (getFontSize()! / 7) +
              elParams.p.baselineCorrection);
    } else {
      return Offset(0, getFontSize()! / 3 + elParams.p.baselineCorrection);
    }
  }

  /// non static amplified position shift value.
  double _amplifiedValue(double input, double curveFactor) {
    if (input <= 0) {
      return 0;
    } else {
      double additionalAmount = pow(input, curveFactor) - input;
      return input + additionalAmount.toInt();
    }
  }

  /// calculate script offset.
  Offset _getOffsetOfNonStrictMode() {
    if (type == EnumSpWMLElementType.superscript) {
      return Offset(
          0,
          _amplifiedValue(getFontSize()!, 1.26) / 4 +
              getFontSize()! / 2 +
              (-1 * super.getFontSize()!) +
              elParams.p.baselineCorrection);
    } else {
      return Offset(
          0,
          _amplifiedValue(getFontSize()!, 1.26) / 4 +
              elParams.p.baselineCorrection);
    }
  }

  /// Get Text or SelectableText.
  @override
  Widget getTextWidget(BuildContext context) {
    return Transform.translate(
        offset: _getOffset(), child: super.getTextWidget(context));
  }

  /// Get text widget
  @override
  Widget getText(BuildContext context) {
    return Transform.translate(
        offset: _getOffset(),
        child: Text(
          spwmlParams.p.text,
          key: textParams.p.key,
          style: textParams.p.style ?? getStyle(),
          strutStyle: textParams.p.strutStyle ?? getStrutStyle(),
          textAlign: textParams.p.textAlign ?? getTextAlign(),
          textDirection: textParams.p.textDirection,
          locale: textParams.p.locale,
          softWrap: textParams.p.softWrap,
          overflow: textParams.p.overflow,
          textScaleFactor: textParams.p.textScaleFactor ??
              MediaQuery.of(context).textScaleFactor,
          maxLines: textParams.p.maxLines,
          semanticsLabel: textParams.p.semanticsLabel,
          textWidthBasis: textParams.p.textWidthBasis,
          textHeightBehavior: textParams.p.textHeightBehavior,
          selectionColor: textParams.p.selectionColor,
        ));
  }

  Widget _getTextOfNonStrictMode(BuildContext context) {
    return Transform.translate(
        offset: _getOffsetOfNonStrictMode(),
        child: Text(
          spwmlParams.p.text,
          key: textParams.p.key,
          style: textParams.p.style ?? getStyle(),
          strutStyle: textParams.p.strutStyle ?? getStrutStyle(),
          textAlign: textParams.p.textAlign ?? getTextAlign(),
          textDirection: textParams.p.textDirection,
          locale: textParams.p.locale,
          softWrap: textParams.p.softWrap,
          overflow: textParams.p.overflow,
          textScaleFactor: textParams.p.textScaleFactor ??
              MediaQuery.of(context).textScaleFactor,
          maxLines: textParams.p.maxLines,
          semanticsLabel: textParams.p.semanticsLabel,
          textWidthBasis: textParams.p.textWidthBasis,
          textHeightBehavior: textParams.p.textHeightBehavior,
          selectionColor: textParams.p.selectionColor,
        ));
  }

  /// (en) A dedicated function to be called in a span block.
  /// Using SelectableText in a span will break the range, but you can avoid it.
  ///
  /// (ja) spanブロックの中で呼び出す専用の関数です。
  /// span中でSelectableTextを用いると範囲が壊れますが、それを回避できます。
  @override
  Widget getInSpan(BuildContext context) {
    if (spwmlParams.p.isGone) {
      return const SizedBox();
    } else {
      return expand(
          transform(material(constraints(container(getText(context))))));
    }
  }

  /// (en) A dedicated function to be called in a span block.
  /// Using SelectableText in a span will break the range, but you can avoid it.
  /// A dedicated method called when isLayoutStrictMode is false.
  /// Since the correction is calculated forcibly,
  /// the operation in the case of various font sizes is undefined.
  /// It can also break with an update.
  ///
  /// (ja) spanブロックの中で呼び出す専用の関数です。
  /// span中でSelectableTextを用いると範囲が壊れますが、それを回避できます。
  /// isLayoutStrictModeがfalseの時に呼び出される専用のメソッドです。
  /// 無理やり補正計算しているので、様々なフォントサイズの場合の動作が不定になります。
  /// また、アップデートで壊れる可能性もあります。
  Widget getInSpanOfNonStrictMode(BuildContext context) {
    if (spwmlParams.p.isGone) {
      return const SizedBox();
    } else {
      return expand(transform(
          material(constraints(container(_getTextOfNonStrictMode(context))))));
    }
  }
}
