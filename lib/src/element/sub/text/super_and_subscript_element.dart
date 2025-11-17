import 'package:flutter/material.dart';
import 'dart:math';

import '../../../../simple_widget_markup.dart';

///
/// (en) The superScript and subScript.
///
/// (ja) superScriptとsubScriptの実装。
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
    super.serial,
    super.type,
    super.params,
    super.spwmlParams,
    super.parentSerial,
    super.lineStart,
    super.lineEnd,
    super.style,
    super.info,
    super.textParams,
    this.elParams, {
    super.key,
  });

  /// Get this class name.
  @override
  String getClassName() {
    return "SuperAndSubscriptElement";
  }

  /// Initialize the parameters.
  @override
  SuperAndSubscriptElement initParams() {
    super.initParams();
    elParams.p.baselineCorrection =
        params.containsKey(EnumSpWMLParams.baselineCorrection)
            ? params[EnumSpWMLParams.baselineCorrection]
            : SuperAndSubscriptParams.defBaselineCorrection;
    elParams.p.magnification = params.containsKey(EnumSpWMLParams.mag)
        ? params[EnumSpWMLParams.mag]
        : SuperAndSubscriptParams.defMag;
    return this;
  }

  /// non null font size.
  double _getDefFontSizeNonNull() {
    return style.styleMap[EnumSpWMLElementType.text]?.fontSize ?? 18;
  }

  /// change small size.
  @override
  double? getFontSize(BuildContext context) {
    double? fontSize = super.getFontSize(context);
    if (fontSize == null) {
      return _getDefFontSizeNonNull() * elParams.p.magnification;
    } else {
      return fontSize * elParams.p.magnification;
    }
  }

  /// calculate and return the script offset.
  Offset getOffset(BuildContext context) {
    if (type == EnumSpWMLElementType.superscript) {
      return Offset(
        0,
        getFontSize(context)! -
            (super.getFontSize(context) ?? 18) -
            (getFontSize(context)! / 7) +
            elParams.p.baselineCorrection,
      );
    } else {
      return Offset(
        0,
        getFontSize(context)! / 3 + elParams.p.baselineCorrection,
      );
    }
  }

  /// Get super font size.
  /// This returns the original font size
  /// before applying any scaling calculations.
  double? getNonResizedFontSize(BuildContext context) {
    return super.getFontSize(context);
  }

  /// Get getNonResizedFontSize method based style.
  TextStyle getNonResizedStyle(BuildContext context) {
    return TextStyle(
      color: params.containsKey(EnumSpWMLParams.textColor)
          ? params[EnumSpWMLParams.textColor]
          : getDefTextColor(),
      backgroundColor: params.containsKey(EnumSpWMLParams.textBGColor)
          ? params[EnumSpWMLParams.textBGColor]
          : getDefTextBGColor(),
      fontSize: getNonResizedFontSize(context),
      fontWeight: params.containsKey(EnumSpWMLParams.fontWeight)
          ? params[EnumSpWMLParams.fontWeight]
          : getDefFontWeight(),
      fontStyle: params.containsKey(EnumSpWMLParams.fontStyle)
          ? params[EnumSpWMLParams.fontStyle]
          : getDefFontStyle(),
      letterSpacing: params.containsKey(EnumSpWMLParams.letterSpacing)
          ? params[EnumSpWMLParams.letterSpacing]
          : getDefFontLetterSpacing(),
      wordSpacing: params.containsKey(EnumSpWMLParams.wordSpacing)
          ? params[EnumSpWMLParams.wordSpacing]
          : getDefWordSpacing(),
      decoration: params.containsKey(EnumSpWMLParams.textDeco)
          ? params[EnumSpWMLParams.textDeco]
          : getDefTextDeco(),
      decorationStyle: params.containsKey(EnumSpWMLParams.textDecoStyle)
          ? params[EnumSpWMLParams.textDecoStyle]
          : getDefDecorationStyle(),
      decorationColor: params.containsKey(EnumSpWMLParams.textDecoColor)
          ? params[EnumSpWMLParams.textDecoColor]
          : getDefTextDecoColor(),
      decorationThickness: params.containsKey(EnumSpWMLParams.textDecoThickness)
          ? params[EnumSpWMLParams.textDecoThickness]
          : getDefTextDecoThickness(),
      fontFamily: params.containsKey(EnumSpWMLParams.fontFamily)
          ? params[EnumSpWMLParams.fontFamily]
          : getDefFontFamily(),
      height: getLineHeight(),
    );
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

  /// calculate and return the script offset for non strict mode.
  Offset getOffsetOfNonStrictMode(BuildContext context) {
    if (type == EnumSpWMLElementType.superscript) {
      return Offset(
        0,
        _amplifiedValue(getFontSize(context)!, 1.225) / 4 +
            getFontSize(context)! / 2 +
            (-1 * super.getFontSize(context)!) +
            elParams.p.baselineCorrection,
      );
    } else {
      return Offset(
        0,
        _amplifiedValue(getFontSize(context)!, 1.225) / 4 +
            elParams.p.baselineCorrection,
      );
    }
  }

  /// Get Text or SelectableText.
  @override
  Widget getTextWidget(BuildContext context) {
    return Transform.translate(
      offset: getOffset(context),
      child: super.getTextWidget(context),
    );
  }

  /// Get text widget
  @override
  Widget getNonSelectableTextWidget(BuildContext context) {
    return Transform.translate(
      offset: getOffset(context),
      child: Text(
        spwmlParams.p.text,
        key: textParams.p.key,
        style: textParams.p.style ?? getStyle(context),
        strutStyle: textParams.p.strutStyle ?? getStrutStyle(context),
        textAlign: textParams.p.textAlign ?? getTextAlign(),
        textDirection: textParams.p.textDirection,
        locale: textParams.p.locale,
        softWrap: textParams.p.softWrap,
        overflow: textParams.p.overflow,
        textScaler:
            textParams.p.textScaler ?? MediaQuery.of(context).textScaler,
        maxLines: textParams.p.maxLines,
        semanticsLabel: textParams.p.semanticsLabel,
        textWidthBasis: textParams.p.textWidthBasis,
        textHeightBehavior: textParams.p.textHeightBehavior,
        selectionColor: textParams.p.selectionColor,
      ),
    );
  }

  Widget _getTextOfNonStrictMode(BuildContext context) {
    return Transform.translate(
      offset: getOffsetOfNonStrictMode(context),
      child: Text(
        spwmlParams.p.text,
        key: textParams.p.key,
        style: textParams.p.style ?? getStyle(context),
        strutStyle: textParams.p.strutStyle ?? getStrutStyle(context),
        textAlign: textParams.p.textAlign ?? getTextAlign(),
        textDirection: textParams.p.textDirection,
        locale: textParams.p.locale,
        softWrap: textParams.p.softWrap,
        overflow: textParams.p.overflow,
        textScaler:
            textParams.p.textScaler ?? MediaQuery.of(context).textScaler,
        maxLines: textParams.p.maxLines,
        semanticsLabel: textParams.p.semanticsLabel,
        textWidthBasis: textParams.p.textWidthBasis,
        textHeightBehavior: textParams.p.textHeightBehavior,
        selectionColor: textParams.p.selectionColor,
      ),
    );
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
        transform(
          material(constraints(container(getNonSelectableTextWidget(context)))),
        ),
      );
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
      return expand(
        transform(
          material(constraints(container(_getTextOfNonStrictMode(context)))),
        ),
      );
    }
  }
}
