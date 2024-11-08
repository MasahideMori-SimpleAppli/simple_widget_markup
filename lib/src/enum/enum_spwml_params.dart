import 'package:flutter/material.dart';
import '../../simple_widget_markup.dart';

///
/// (en) Definition of available parameters in SpWML.
///
/// (ja) SpWMLにおける利用可能なパラメータの定義です。
///
enum EnumSpWMLParams {
  // 基本的に解析の優先度順にすることで高速化する。
  // ここの記載順は分かりやすさのためにfromStrと合わせる。
  mAll,
  pAll,
  sid,
  tag,
  // 以下２つは対象に応じて動的にStrから変更
  hAlign,
  vAlign,
  alt,
  bgColor,
  fontFamily,
  fontSize,
  fontWeight,
  fontStyle,
  forceStrutHeight,
  letterSpacing,
  wordSpacing,
  textColor,
  textBGColor,
  textDeco,
  textDecoStyle,
  textDecoColor,
  textDecoThickness,
  textAlign,
  lineHeight,
  isSelectable,
  thickness,
  color,
  // material 3 color mode flag.
  isV3,
  // icon btn param.
  isSelected,
  selectedIconNum,
  // text base line.
  baselineType,
  baselineCorrection,
  //
  fit,
  repeat,
  axis,
  isPrimary,
  borderWidth,
  borderRadius,
  borderColor,
  borderShape,
  shape,
  type,
  iconNum,
  iconSize,
  iconColor,
  splashRadius,
  suffixIconNum,
  suffixIconSize,
  suffixIconColor,
  suffixIconSplashRadius,
  btnBGColor,
  elevation,
  cardElevation,
  shiftX,
  shiftY,
  hint,
  isExpanded,
  fillColor,
  radius,
  mode,
  labelText,
  underlineColor,
  underlineHeight,
  // tableの水平方向の要素数
  hNum,
  // 単一指定系のボーダー角の指定
  rTL,
  rTR,
  rBL,
  rBR,
  ellipticalX,
  ellipticalY,
  enableTapLabel,
  // checkbox
  isPrefixIcon,
  // ruby text parameter
  rubyText,
  rubySize,
  rubyLetterSpacing,
  rubyMargin,
  rubyFontName,
  rubyFontWeight,
  rubyFontStyle,
  rubyWordSpacing,
  rubyColor,
  rubyBGColor,
  rubyDeco,
  rubyDecoStyle,
  rubyDecoColor,
  rubyDecoThickness,
  rubyAlign,
  rubyHeight,
  isRubySelectable,
  fgColor,
  isGone,
  cpL,
  cpT,
  cpR,
  cpB,
  overflow,
  maxLines,
  maxLength,
  indicatorColor,
  indicatorBGColor,
  clipType,
  clipRadius,
  isLayoutStrictMode,
  // スクロールの許可設定
  scrollBehavior,
  // 倍率
  mag,
  // Materialでラップして一部の描画の問題を解消する。
  useMaterial,
  // segmented btn用
  isMultiSelection,
  allowEmpty,
  // slider用
  min, // これはテキストフィールドでも使用できる。
  max, // これはテキストフィールドでも使用できる。
  activeColor,
  inactiveColor,
  divisions,
  useAutoLabel,
  isIntValue,
  // sliderやbadge
  label,
  // badge
  smallSize,
  offsetX,
  // badge and tooltip
  offsetY,
  // tooltip
  triggerMode,
  // col and row
  mainAxisSize,
  // ユーザーのテキストのサイズ設定を反映するかどうかのフラグ。
  useTextScaler,
  // テキストの行送り。
  leading,
  leadingDistribution,
  // フルネーム系は利用頻度が低いので、解析の優先度を下げる。
  mLeft,
  mTop,
  mRight,
  mBottom,
  pLeft,
  pTop,
  pRight,
  pBottom,
  height,
  width,
  weight,
  minHeight,
  minWidth,
  maxHeight,
  maxWidth,
  // ボタンの有効無効フラグ。テキストフィールドでも使用する。
  isEnabled,
  // ラベルの有効無効フラグ
  isLabelVisible,
  // テキストフィールド専用の値。
  readOnly,
  keyboardType,
  inputType,
  // カラーパレット専用の値
  cellWidth,
  cellHeight,
  cellMargin,
  vMargin
}

/// 重複を避けて高速化するために、短縮系だけをまとめたもの。
enum _EnumSpWMLParamsShort {
  h,
  w,
  mL,
  mT,
  mR,
  mB,
  pL,
  pT,
  pR,
  pB,
  wt,
  minH,
  minW,
  maxH,
  maxW,
  // 廃止パラメータも直接参照禁止なのでこちら。
  @Deprecated(
      'Use fontFamily instead. This variable will be deprecated in the future.')
  fontName,
  @Deprecated(
      'Use lineHeight instead. This variable will be deprecated in the future.')
  textHeight,
}

/// EnumSpWMLParams extension.
extension EXTEnumSpWMLParams on EnumSpWMLParams {
  /// * [type] : Element type.
  /// * [v] : SpWML parameter value.
  /// * [lineStart] : SpWML line start.
  /// * [lineEnd] : SpWML line end.
  /// * [info] : SPWML information.
  ///
  /// Throws [SpWMLException] : If the parameter value is incorrect,
  ///
  /// Throws [Exception] : param value exception.
  dynamic parseValue(EnumSpWMLElementType type, String v, int lineStart,
      int lineEnd, SpWMLInfo? info) {
    try {
      // Frequently used
      if (this == EnumSpWMLParams.height ||
          this == EnumSpWMLParams.width ||
          this == EnumSpWMLParams.mLeft ||
          this == EnumSpWMLParams.mRight ||
          this == EnumSpWMLParams.mTop ||
          this == EnumSpWMLParams.mBottom ||
          this == EnumSpWMLParams.mAll ||
          this == EnumSpWMLParams.pLeft ||
          this == EnumSpWMLParams.pRight ||
          this == EnumSpWMLParams.pTop ||
          this == EnumSpWMLParams.pBottom ||
          this == EnumSpWMLParams.pAll ||
          this == EnumSpWMLParams.thickness ||
          this == EnumSpWMLParams.textDecoThickness ||
          this == EnumSpWMLParams.minHeight ||
          this == EnumSpWMLParams.minWidth ||
          this == EnumSpWMLParams.maxHeight ||
          this == EnumSpWMLParams.maxWidth ||
          this == EnumSpWMLParams.borderWidth ||
          this == EnumSpWMLParams.borderRadius ||
          this == EnumSpWMLParams.iconSize ||
          this == EnumSpWMLParams.suffixIconSize ||
          this == EnumSpWMLParams.splashRadius ||
          this == EnumSpWMLParams.suffixIconSplashRadius ||
          this == EnumSpWMLParams.elevation ||
          this == EnumSpWMLParams.cardElevation ||
          this == EnumSpWMLParams.shiftX ||
          this == EnumSpWMLParams.shiftY ||
          this == EnumSpWMLParams.radius ||
          this == EnumSpWMLParams.fontSize ||
          this == EnumSpWMLParams.lineHeight ||
          this == EnumSpWMLParams.letterSpacing ||
          this == EnumSpWMLParams.wordSpacing ||
          this == EnumSpWMLParams.underlineHeight ||
          this == EnumSpWMLParams.rTL ||
          this == EnumSpWMLParams.rTR ||
          this == EnumSpWMLParams.rBL ||
          this == EnumSpWMLParams.rBR ||
          this == EnumSpWMLParams.ellipticalX ||
          this == EnumSpWMLParams.ellipticalY ||
          this == EnumSpWMLParams.rubySize ||
          this == EnumSpWMLParams.rubyLetterSpacing ||
          this == EnumSpWMLParams.rubyMargin ||
          this == EnumSpWMLParams.rubyWordSpacing ||
          this == EnumSpWMLParams.rubyDecoThickness ||
          this == EnumSpWMLParams.rubyHeight ||
          this == EnumSpWMLParams.cpL ||
          this == EnumSpWMLParams.cpT ||
          this == EnumSpWMLParams.cpR ||
          this == EnumSpWMLParams.cpB ||
          this == EnumSpWMLParams.baselineCorrection ||
          this == EnumSpWMLParams.mag ||
          this == EnumSpWMLParams.min ||
          this == EnumSpWMLParams.max ||
          this == EnumSpWMLParams.smallSize ||
          this == EnumSpWMLParams.offsetX ||
          this == EnumSpWMLParams.offsetY ||
          this == EnumSpWMLParams.leading ||
          this == EnumSpWMLParams.cellHeight ||
          this == EnumSpWMLParams.cellWidth ||
          this == EnumSpWMLParams.cellMargin ||
          this == EnumSpWMLParams.vMargin) {
        return double.parse(v);
      }
      if (this == EnumSpWMLParams.weight || this == EnumSpWMLParams.hNum) {
        return int.parse(v);
      }
      if (this == EnumSpWMLParams.maxLines ||
          this == EnumSpWMLParams.maxLength ||
          this == EnumSpWMLParams.divisions) {
        return int.tryParse(v);
      }
      // col, row or wrap only
      if (type == EnumSpWMLElementType.col) {
        if (this == EnumSpWMLParams.vAlign) {
          return UtilParams.convertMainAxisAlign(v, lineStart, lineEnd, info);
        } else if (this == EnumSpWMLParams.hAlign) {
          return UtilParams.convertCrossAxisAlign(v, lineStart, lineEnd, info);
        }
      } else if (type == EnumSpWMLElementType.row) {
        if (this == EnumSpWMLParams.vAlign) {
          return UtilParams.convertCrossAxisAlign(v, lineStart, lineEnd, info);
        } else if (this == EnumSpWMLParams.hAlign) {
          return UtilParams.convertMainAxisAlign(v, lineStart, lineEnd, info);
        }
      } else if (type == EnumSpWMLElementType.wrap) {
        if (this == EnumSpWMLParams.vAlign) {
          return UtilParams.convertWrapAlign(v, lineStart, lineEnd, info);
        } else if (this == EnumSpWMLParams.hAlign) {
          return UtilParams.convertWrapAlign(v, lineStart, lineEnd, info);
        }
      } else if (type == EnumSpWMLElementType.colorPalette) {
        if (this == EnumSpWMLParams.vAlign) {
          return UtilParams.convertMainAxisAlign(v, lineStart, lineEnd, info);
        } else if (this == EnumSpWMLParams.hAlign) {
          return UtilParams.convertMainAxisAlign(v, lineStart, lineEnd, info);
        }
      } else if (type == EnumSpWMLElementType.img) {
        if (this == EnumSpWMLParams.fit) {
          if (v == "none") {
            return BoxFit.none;
          } else if (v == "contain") {
            return BoxFit.contain;
          } else if (v == "cover") {
            return BoxFit.cover;
          } else if (v == "fitHeight") {
            return BoxFit.fitHeight;
          } else if (v == "fitWidth") {
            return BoxFit.fitWidth;
          } else {
            throw Exception();
          }
        } else if (this == EnumSpWMLParams.repeat) {
          if (v == "noRepeat") {
            return ImageRepeat.noRepeat;
          } else if (v == "repeat") {
            return ImageRepeat.repeat;
          } else if (v == "repeatX") {
            return ImageRepeat.repeatX;
          } else if (v == "repeatY") {
            return ImageRepeat.repeatY;
          } else {
            throw Exception();
          }
        } else if (this == EnumSpWMLParams.type) {
          return EXTEnumImgType.fromStr(v, lineStart, lineEnd, info);
        }
      }
      // color palette only
      else if (type == EnumSpWMLElementType.colorPalette) {
        if (this == EnumSpWMLParams.type) {
          if (v == EnumColorPaletteType.normal.name) {
            return EnumColorPaletteType.normal;
          } else if (v == EnumColorPaletteType.simple.name) {
            return EnumColorPaletteType.simple;
          } else {
            throw Exception();
          }
        }
      }
      // indicator only
      if (type == EnumSpWMLElementType.progressIndicator) {
        if (this == EnumSpWMLParams.type) {
          return EXTEnumIndicatorType.fromStr(v, lineStart, lineEnd, info);
        }
      }
      // textField only
      if (type == EnumSpWMLElementType.textField) {
        if (this == EnumSpWMLParams.type) {
          return EXTEnumTextFieldType.fromStr(v, lineStart, lineEnd, info);
        } else if (this == EnumSpWMLParams.mode) {
          return EXTEnumTextFieldMode.fromStr(v, lineStart, lineEnd, info);
        }
        // speed up code
        else if (this == EnumSpWMLParams.labelText) {
          return v;
        }
        // input type
        else if (this == EnumSpWMLParams.keyboardType) {
          return EXTEnumTextFieldKeyboardType.fromStr(
              v, lineStart, lineEnd, info);
        } else if (this == EnumSpWMLParams.inputType) {
          return EXTEnumTextFieldInputType.fromStr(v, lineStart, lineEnd, info);
        }
      }
      // btn only
      if (type == EnumSpWMLElementType.btn) {
        if (this == EnumSpWMLParams.type) {
          return EXTEnumBtnType.fromStr(v, lineStart, lineEnd, info);
        }
      }
      // switch btn only
      if (type == EnumSpWMLElementType.switchBtn) {
        if (this == EnumSpWMLParams.type) {
          return EXTEnumSwitchBtnType.fromStr(v, lineStart, lineEnd, info);
        }
      }
      // shape
      if (this == EnumSpWMLParams.shape) {
        if (v == "roundRect") {
          return const RoundedRectangleBorder();
        } else if (v == "stadium") {
          return const StadiumBorder();
        } else if (v == "bevel") {
          return const BeveledRectangleBorder();
        } else if (v == "circle") {
          return const CircleBorder();
        } else {
          throw Exception();
        }
      }
      // clip
      if (this == EnumSpWMLParams.clipType) {
        return EXTEnumClipType.fromStr(v, lineStart, lineEnd, info);
      }
      if (this == EnumSpWMLParams.clipRadius) {
        return BorderRadius.circular(double.parse(v));
      }
      if (this == EnumSpWMLParams.bgColor ||
          this == EnumSpWMLParams.color ||
          this == EnumSpWMLParams.textColor ||
          this == EnumSpWMLParams.textBGColor ||
          this == EnumSpWMLParams.textDecoColor ||
          this == EnumSpWMLParams.iconColor ||
          this == EnumSpWMLParams.suffixIconColor ||
          this == EnumSpWMLParams.btnBGColor ||
          this == EnumSpWMLParams.fillColor ||
          this == EnumSpWMLParams.underlineColor ||
          this == EnumSpWMLParams.borderColor ||
          this == EnumSpWMLParams.rubyColor ||
          this == EnumSpWMLParams.rubyBGColor ||
          this == EnumSpWMLParams.rubyDecoColor ||
          this == EnumSpWMLParams.fgColor ||
          this == EnumSpWMLParams.indicatorColor ||
          this == EnumSpWMLParams.indicatorBGColor ||
          this == EnumSpWMLParams.activeColor ||
          this == EnumSpWMLParams.inactiveColor) {
        return UtilParams.convertColor(v, lineStart, lineEnd, info);
      } else if (this == EnumSpWMLParams.sid || this == EnumSpWMLParams.tag) {
        return v;
      } else if (this == EnumSpWMLParams.axis) {
        if (v == "vertical") {
          return Axis.vertical;
        } else if (v == "horizontal") {
          return Axis.horizontal;
        } else {
          throw Exception();
        }
      } else if (this == EnumSpWMLParams.iconNum ||
          this == EnumSpWMLParams.suffixIconNum ||
          this == EnumSpWMLParams.selectedIconNum) {
        if (v.startsWith('0x')) {
          v = v.replaceFirst('0x', '');
        }
        return IconData(int.parse(v, radix: 16), fontFamily: "MaterialIcons");
      } else if (this == EnumSpWMLParams.fontWeight ||
          this == EnumSpWMLParams.rubyFontWeight) {
        return EXTEnumFontWeight.toObjFromStr(v);
      } else if (this == EnumSpWMLParams.fontStyle ||
          this == EnumSpWMLParams.rubyFontStyle) {
        return EXTEnumFontStyle.toObjFromStr(v);
      } else if (this == EnumSpWMLParams.textDeco ||
          this == EnumSpWMLParams.rubyDeco) {
        return EXTEnumTextDecoration.toObjFromStr(v);
      } else if (this == EnumSpWMLParams.textDecoStyle ||
          this == EnumSpWMLParams.rubyDecoStyle) {
        return EXTEnumTextDecorationStyle.toObjFromStr(v);
      } else if (this == EnumSpWMLParams.textAlign ||
          this == EnumSpWMLParams.rubyAlign) {
        if (v == "left") {
          return TextAlign.left;
        } else if (v == "center") {
          return TextAlign.center;
        } else if (v == "right") {
          return TextAlign.right;
        } else if (v == "justify") {
          return TextAlign.justify;
        } else {
          throw Exception();
        }
      } else if (this == EnumSpWMLParams.isSelectable ||
          this == EnumSpWMLParams.isPrimary ||
          this == EnumSpWMLParams.isExpanded ||
          this == EnumSpWMLParams.enableTapLabel ||
          this == EnumSpWMLParams.isRubySelectable ||
          this == EnumSpWMLParams.isGone ||
          this == EnumSpWMLParams.isPrefixIcon ||
          this == EnumSpWMLParams.isV3 ||
          this == EnumSpWMLParams.isLayoutStrictMode ||
          this == EnumSpWMLParams.isSelected ||
          this == EnumSpWMLParams.useMaterial ||
          this == EnumSpWMLParams.isMultiSelection ||
          this == EnumSpWMLParams.allowEmpty ||
          this == EnumSpWMLParams.useAutoLabel ||
          this == EnumSpWMLParams.isIntValue ||
          this == EnumSpWMLParams.isEnabled ||
          this == EnumSpWMLParams.useTextScaler ||
          this == EnumSpWMLParams.isLabelVisible ||
          this == EnumSpWMLParams.readOnly ||
          this == EnumSpWMLParams.forceStrutHeight) {
        if (v == "true") {
          return true;
        } else if (v == "false") {
          return false;
        } else {
          throw Exception();
        }
      } else if (this == EnumSpWMLParams.borderShape) {
        if (v == "rectangle") {
          return BoxShape.rectangle;
        } else if (v == "circle") {
          return BoxShape.circle;
        } else {
          throw Exception();
        }
      } else if (this == EnumSpWMLParams.overflow) {
        if (v == "clip") {
          return TextOverflow.clip;
        } else if (v == "ellipsis") {
          return TextOverflow.ellipsis;
        } else if (v == "fade") {
          return TextOverflow.fade;
        } else if (v == "visible") {
          return TextOverflow.visible;
        } else {
          throw Exception();
        }
      } else if (this == EnumSpWMLParams.baselineType) {
        if (v == TextBaseline.alphabetic.name) {
          return TextBaseline.alphabetic;
        } else if (v == TextBaseline.ideographic.name) {
          return TextBaseline.ideographic;
        } else {
          throw Exception();
        }
      } else if (this == EnumSpWMLParams.scrollBehavior) {
        return EXTEnumScrollBehavior.toObjFromStr(v, lineStart, lineEnd, info);
      } else if (this == EnumSpWMLParams.mainAxisSize) {
        if (v == "max") {
          return MainAxisSize.max;
        } else if (v == "min") {
          return MainAxisSize.min;
        } else {
          throw Exception();
        }
      } else if (this == EnumSpWMLParams.triggerMode) {
        if (v == "longPress") {
          return TooltipTriggerMode.longPress;
        } else if (v == "manual") {
          return TooltipTriggerMode.manual;
        } else if (v == "tap") {
          return TooltipTriggerMode.tap;
        } else {
          throw Exception();
        }
      } else if (this == EnumSpWMLParams.leadingDistribution) {
        if (v == "even") {
          return TextLeadingDistribution.even;
        } else {
          return TextLeadingDistribution.proportional;
        }
      } else {
        // 変換不要ならそのまま返す。
        return v;
      }
    } catch (e) {
      throw SpWMLException(
          EnumSpWMLExceptionType.paramValueException, lineStart, lineEnd, info);
    }
  }

  /// Throws [SpWMLException] : If the parameter is incorrect, Throws ParamException.
  static EnumSpWMLParams fromStr(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    // 省略系
    if (s == _EnumSpWMLParamsShort.h.name) {
      return EnumSpWMLParams.height;
    } else if (s == _EnumSpWMLParamsShort.w.name) {
      return EnumSpWMLParams.width;
    } else if (s == _EnumSpWMLParamsShort.mL.name) {
      return EnumSpWMLParams.mLeft;
    } else if (s == _EnumSpWMLParamsShort.mT.name) {
      return EnumSpWMLParams.mTop;
    } else if (s == _EnumSpWMLParamsShort.mR.name) {
      return EnumSpWMLParams.mRight;
    } else if (s == _EnumSpWMLParamsShort.mB.name) {
      return EnumSpWMLParams.mBottom;
    } else if (s == _EnumSpWMLParamsShort.pL.name) {
      return EnumSpWMLParams.pLeft;
    } else if (s == _EnumSpWMLParamsShort.pT.name) {
      return EnumSpWMLParams.pTop;
    } else if (s == _EnumSpWMLParamsShort.pR.name) {
      return EnumSpWMLParams.pRight;
    } else if (s == _EnumSpWMLParamsShort.pB.name) {
      return EnumSpWMLParams.pBottom;
    } else if (s == _EnumSpWMLParamsShort.wt.name) {
      return EnumSpWMLParams.weight;
    } else if (s == _EnumSpWMLParamsShort.minH.name) {
      return EnumSpWMLParams.minHeight;
    } else if (s == _EnumSpWMLParamsShort.minW.name) {
      return EnumSpWMLParams.minWidth;
    } else if (s == _EnumSpWMLParamsShort.maxH.name) {
      return EnumSpWMLParams.maxHeight;
    } else if (s == _EnumSpWMLParamsShort.maxW.name) {
      return EnumSpWMLParams.maxWidth;
    } else {
      // それ以外の一括処理。
      try {
        return EnumSpWMLParams.values.byName(s);
      } catch (e) {
        // 廃止されたパラメータ。
        // ignore: deprecated_member_use_from_same_package
        if (s == _EnumSpWMLParamsShort.fontName.name) {
          return EnumSpWMLParams.fontFamily;
        }
        // ignore: deprecated_member_use_from_same_package
        else if (s == _EnumSpWMLParamsShort.textHeight.name) {
          return EnumSpWMLParams.lineHeight;
        } else {
          throw SpWMLException(
              EnumSpWMLExceptionType.paramException, lineStart, lineEnd, info);
        }
      }
    }
  }
}
