import 'package:flutter/material.dart';
import '../../simple_widget_markup.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-30 14:34:48
///
enum EnumSpWMLParams {
  // 基本的に解析の優先度順にすることで高速化する。
  // ここの記載順は分かりやすさのためにfromStrと合わせる。
  h,
  w,
  mL,
  mT,
  mR,
  mB,
  mAll,
  pL,
  pT,
  pR,
  pB,
  pAll,
  wt,
  id,
  sid,
  // 以下２つは対象に応じて動的にStrから変更
  hAlign,
  vAlign,
  alt,
  bgColor,
  @Deprecated(
      'Use fontFamily instead. This variable will be deprecated in the future.')
  fontName,
  fontFamily,
  fontSize,
  fontWeight,
  fontStyle,
  letterSpacing,
  wordSpacing,
  textColor,
  textBGColor,
  textDeco,
  textDecoStyle,
  textDecoColor,
  textDecoThickness,
  textAlign,
  @Deprecated(
      'Use lineHeight instead. This variable will be deprecated in the future.')
  textHeight,
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
  minH,
  minW,
  maxH,
  maxW,
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
  value,
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
}

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
          // ignore: deprecated_member_use_from_same_package
          this == EnumSpWMLParams.textHeight ||
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
          this == EnumSpWMLParams.mag) {
        return double.parse(v);
      }
      if (this == EnumSpWMLParams.weight || this == EnumSpWMLParams.hNum) {
        return int.parse(v);
      }
      if (this == EnumSpWMLParams.maxLines ||
          this == EnumSpWMLParams.maxLength) {
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
          this == EnumSpWMLParams.indicatorBGColor) {
        return UtilParams.convertColor(v, lineStart, lineEnd, info);
      } else if (this == EnumSpWMLParams.id) {
        return int.parse(v);
      } else if (this == EnumSpWMLParams.sid) {
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
          this == EnumSpWMLParams.value ||
          this == EnumSpWMLParams.enableTapLabel ||
          this == EnumSpWMLParams.isRubySelectable ||
          this == EnumSpWMLParams.isGone ||
          this == EnumSpWMLParams.isPrefixIcon ||
          this == EnumSpWMLParams.isV3 ||
          this == EnumSpWMLParams.isLayoutStrictMode ||
          this == EnumSpWMLParams.isSelected) {
        if (type == EnumSpWMLElementType.progressIndicator) {
          return double.parse(v);
        } else {
          if (v == "true") {
            return true;
          } else if (v == "false") {
            return false;
          } else {
            throw Exception();
          }
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
    // 基本的に解析の優先度順にすることで高速化する。
    // なお、一旦Enumになった後は十分早いので気にしないで良い。
    if (s == EnumSpWMLParams.h.name) {
      return EnumSpWMLParams.height;
    } else if (s == EnumSpWMLParams.w.name) {
      return EnumSpWMLParams.width;
    } else if (s == EnumSpWMLParams.mL.name) {
      return EnumSpWMLParams.mLeft;
    } else if (s == EnumSpWMLParams.mT.name) {
      return EnumSpWMLParams.mTop;
    } else if (s == EnumSpWMLParams.mR.name) {
      return EnumSpWMLParams.mRight;
    } else if (s == EnumSpWMLParams.mB.name) {
      return EnumSpWMLParams.mBottom;
    } else if (s == EnumSpWMLParams.mAll.name) {
      return EnumSpWMLParams.mAll;
    } else if (s == EnumSpWMLParams.pL.name) {
      return EnumSpWMLParams.pLeft;
    } else if (s == EnumSpWMLParams.pT.name) {
      return EnumSpWMLParams.pTop;
    } else if (s == EnumSpWMLParams.pR.name) {
      return EnumSpWMLParams.pRight;
    } else if (s == EnumSpWMLParams.pB.name) {
      return EnumSpWMLParams.pBottom;
    } else if (s == EnumSpWMLParams.pAll.name) {
      return EnumSpWMLParams.pAll;
    } else if (s == EnumSpWMLParams.wt.name) {
      return EnumSpWMLParams.weight;
    } else if (s == EnumSpWMLParams.id.name) {
      return EnumSpWMLParams.id;
    } else if (s == EnumSpWMLParams.sid.name) {
      return EnumSpWMLParams.sid;
    }
    // 以下２つは対象に応じて動的にStrから変更
    else if (s == EnumSpWMLParams.hAlign.name) {
      return EnumSpWMLParams.hAlign;
    } else if (s == EnumSpWMLParams.vAlign.name) {
      return EnumSpWMLParams.vAlign;
    } else if (s == EnumSpWMLParams.alt.name) {
      return EnumSpWMLParams.alt;
    } else if (s == EnumSpWMLParams.bgColor.name) {
      return EnumSpWMLParams.bgColor;
    } else if (s == EnumSpWMLParams.fontFamily.name) {
      return EnumSpWMLParams.fontFamily;
    } else if (s == EnumSpWMLParams.fontSize.name) {
      return EnumSpWMLParams.fontSize;
    } else if (s == EnumSpWMLParams.fontWeight.name) {
      return EnumSpWMLParams.fontWeight;
    } else if (s == EnumSpWMLParams.fontStyle.name) {
      return EnumSpWMLParams.fontStyle;
    } else if (s == EnumSpWMLParams.letterSpacing.name) {
      return EnumSpWMLParams.letterSpacing;
    } else if (s == EnumSpWMLParams.wordSpacing.name) {
      return EnumSpWMLParams.wordSpacing;
    } else if (s == EnumSpWMLParams.textColor.name) {
      return EnumSpWMLParams.textColor;
    } else if (s == EnumSpWMLParams.textBGColor.name) {
      return EnumSpWMLParams.textBGColor;
    } else if (s == EnumSpWMLParams.textDeco.name) {
      return EnumSpWMLParams.textDeco;
    } else if (s == EnumSpWMLParams.textDecoStyle.name) {
      return EnumSpWMLParams.textDecoStyle;
    } else if (s == EnumSpWMLParams.textDecoColor.name) {
      return EnumSpWMLParams.textDecoColor;
    } else if (s == EnumSpWMLParams.textDecoThickness.name) {
      return EnumSpWMLParams.textDecoThickness;
    } else if (s == EnumSpWMLParams.textAlign.name) {
      return EnumSpWMLParams.textAlign;
    } else if (s == EnumSpWMLParams.lineHeight.name) {
      return EnumSpWMLParams.lineHeight;
    } else if (s == EnumSpWMLParams.isSelectable.name) {
      return EnumSpWMLParams.isSelectable;
    } else if (s == EnumSpWMLParams.thickness.name) {
      return EnumSpWMLParams.thickness;
    } else if (s == EnumSpWMLParams.color.name) {
      return EnumSpWMLParams.color;
    }
    // material v3 color mode
    else if (s == EnumSpWMLParams.isV3.name) {
      return EnumSpWMLParams.isV3;
    }
    // icon btn params
    else if (s == EnumSpWMLParams.isSelected.name) {
      return EnumSpWMLParams.isSelected;
    } else if (s == EnumSpWMLParams.selectedIconNum.name) {
      return EnumSpWMLParams.selectedIconNum;
    }
    // text baseline
    else if (s == EnumSpWMLParams.baselineType.name) {
      return EnumSpWMLParams.baselineType;
    } else if (s == EnumSpWMLParams.baselineCorrection.name) {
      return EnumSpWMLParams.baselineCorrection;
    }
    //
    else if (s == EnumSpWMLParams.fit.name) {
      return EnumSpWMLParams.fit;
    } else if (s == EnumSpWMLParams.repeat.name) {
      return EnumSpWMLParams.repeat;
    } else if (s == EnumSpWMLParams.minH.name) {
      return EnumSpWMLParams.minHeight;
    } else if (s == EnumSpWMLParams.minW.name) {
      return EnumSpWMLParams.minWidth;
    } else if (s == EnumSpWMLParams.maxH.name) {
      return EnumSpWMLParams.maxHeight;
    } else if (s == EnumSpWMLParams.maxW.name) {
      return EnumSpWMLParams.maxWidth;
    } else if (s == EnumSpWMLParams.axis.name) {
      return EnumSpWMLParams.axis;
    } else if (s == EnumSpWMLParams.isPrimary.name) {
      return EnumSpWMLParams.isPrimary;
    } else if (s == EnumSpWMLParams.borderWidth.name) {
      return EnumSpWMLParams.borderWidth;
    } else if (s == EnumSpWMLParams.borderRadius.name) {
      return EnumSpWMLParams.borderRadius;
    } else if (s == EnumSpWMLParams.borderColor.name) {
      return EnumSpWMLParams.borderColor;
    } else if (s == EnumSpWMLParams.borderShape.name) {
      return EnumSpWMLParams.borderShape;
    } else if (s == EnumSpWMLParams.shape.name) {
      return EnumSpWMLParams.shape;
    } else if (s == EnumSpWMLParams.type.name) {
      return EnumSpWMLParams.type;
    } else if (s == EnumSpWMLParams.iconNum.name) {
      return EnumSpWMLParams.iconNum;
    } else if (s == EnumSpWMLParams.iconSize.name) {
      return EnumSpWMLParams.iconSize;
    } else if (s == EnumSpWMLParams.iconColor.name) {
      return EnumSpWMLParams.iconColor;
    } else if (s == EnumSpWMLParams.splashRadius.name) {
      return EnumSpWMLParams.splashRadius;
    } else if (s == EnumSpWMLParams.suffixIconNum.name) {
      return EnumSpWMLParams.suffixIconNum;
    } else if (s == EnumSpWMLParams.suffixIconSize.name) {
      return EnumSpWMLParams.suffixIconSize;
    } else if (s == EnumSpWMLParams.suffixIconColor.name) {
      return EnumSpWMLParams.suffixIconColor;
    } else if (s == EnumSpWMLParams.suffixIconSplashRadius.name) {
      return EnumSpWMLParams.suffixIconSplashRadius;
    } else if (s == EnumSpWMLParams.btnBGColor.name) {
      return EnumSpWMLParams.btnBGColor;
    } else if (s == EnumSpWMLParams.elevation.name) {
      return EnumSpWMLParams.elevation;
    } else if (s == EnumSpWMLParams.cardElevation.name) {
      return EnumSpWMLParams.cardElevation;
    } else if (s == EnumSpWMLParams.shiftX.name) {
      return EnumSpWMLParams.shiftX;
    } else if (s == EnumSpWMLParams.shiftY.name) {
      return EnumSpWMLParams.shiftY;
    } else if (s == EnumSpWMLParams.hint.name) {
      return EnumSpWMLParams.hint;
    } else if (s == EnumSpWMLParams.isExpanded.name) {
      return EnumSpWMLParams.isExpanded;
    } else if (s == EnumSpWMLParams.fillColor.name) {
      return EnumSpWMLParams.fillColor;
    } else if (s == EnumSpWMLParams.radius.name) {
      return EnumSpWMLParams.radius;
    } else if (s == EnumSpWMLParams.mode.name) {
      return EnumSpWMLParams.mode;
    } else if (s == EnumSpWMLParams.labelText.name) {
      return EnumSpWMLParams.labelText;
    } else if (s == EnumSpWMLParams.value.name) {
      return EnumSpWMLParams.value;
    } else if (s == EnumSpWMLParams.underlineColor.name) {
      return EnumSpWMLParams.underlineColor;
    } else if (s == EnumSpWMLParams.underlineHeight.name) {
      return EnumSpWMLParams.underlineHeight;
    }
    // tableの水平方向の要素数
    else if (s == EnumSpWMLParams.hNum.name) {
      return EnumSpWMLParams.hNum;
    }
    // 単一指定系のボーダー角の指定
    else if (s == EnumSpWMLParams.rTL.name) {
      return EnumSpWMLParams.rTL;
    } else if (s == EnumSpWMLParams.rTR.name) {
      return EnumSpWMLParams.rTR;
    } else if (s == EnumSpWMLParams.rBL.name) {
      return EnumSpWMLParams.rBL;
    } else if (s == EnumSpWMLParams.rBR.name) {
      return EnumSpWMLParams.rBR;
    } else if (s == EnumSpWMLParams.ellipticalX.name) {
      return EnumSpWMLParams.ellipticalX;
    } else if (s == EnumSpWMLParams.ellipticalY.name) {
      return EnumSpWMLParams.ellipticalY;
    } else if (s == EnumSpWMLParams.enableTapLabel.name) {
      return EnumSpWMLParams.enableTapLabel;
    }
    // checkbox
    else if (s == EnumSpWMLParams.isPrefixIcon.name) {
      return EnumSpWMLParams.isPrefixIcon;
    }
    // ruby text parameter
    else if (s == EnumSpWMLParams.rubyText.name) {
      return EnumSpWMLParams.rubyText;
    } else if (s == EnumSpWMLParams.rubySize.name) {
      return EnumSpWMLParams.rubySize;
    } else if (s == EnumSpWMLParams.rubyLetterSpacing.name) {
      return EnumSpWMLParams.rubyLetterSpacing;
    } else if (s == EnumSpWMLParams.rubyMargin.name) {
      return EnumSpWMLParams.rubyMargin;
    } else if (s == EnumSpWMLParams.rubyFontName.name) {
      return EnumSpWMLParams.rubyFontName;
    } else if (s == EnumSpWMLParams.rubyFontWeight.name) {
      return EnumSpWMLParams.rubyFontWeight;
    } else if (s == EnumSpWMLParams.rubyFontStyle.name) {
      return EnumSpWMLParams.rubyFontStyle;
    } else if (s == EnumSpWMLParams.rubyWordSpacing.name) {
      return EnumSpWMLParams.rubyWordSpacing;
    } else if (s == EnumSpWMLParams.rubyColor.name) {
      return EnumSpWMLParams.rubyColor;
    } else if (s == EnumSpWMLParams.rubyBGColor.name) {
      return EnumSpWMLParams.rubyBGColor;
    } else if (s == EnumSpWMLParams.rubyDeco.name) {
      return EnumSpWMLParams.rubyDeco;
    } else if (s == EnumSpWMLParams.rubyDecoStyle.name) {
      return EnumSpWMLParams.rubyDecoStyle;
    } else if (s == EnumSpWMLParams.rubyDecoColor.name) {
      return EnumSpWMLParams.rubyDecoColor;
    } else if (s == EnumSpWMLParams.rubyDecoThickness.name) {
      return EnumSpWMLParams.rubyDecoThickness;
    } else if (s == EnumSpWMLParams.rubyAlign.name) {
      return EnumSpWMLParams.rubyAlign;
    } else if (s == EnumSpWMLParams.rubyHeight.name) {
      return EnumSpWMLParams.rubyHeight;
    } else if (s == EnumSpWMLParams.isRubySelectable.name) {
      return EnumSpWMLParams.isRubySelectable;
    } else if (s == EnumSpWMLParams.fgColor.name) {
      return EnumSpWMLParams.fgColor;
    } else if (s == EnumSpWMLParams.isGone.name) {
      return EnumSpWMLParams.isGone;
    } else if (s == EnumSpWMLParams.cpL.name) {
      return EnumSpWMLParams.cpL;
    } else if (s == EnumSpWMLParams.cpT.name) {
      return EnumSpWMLParams.cpT;
    } else if (s == EnumSpWMLParams.cpR.name) {
      return EnumSpWMLParams.cpR;
    } else if (s == EnumSpWMLParams.cpB.name) {
      return EnumSpWMLParams.cpB;
    } else if (s == EnumSpWMLParams.overflow.name) {
      return EnumSpWMLParams.overflow;
    } else if (s == EnumSpWMLParams.maxLines.name) {
      return EnumSpWMLParams.maxLines;
    } else if (s == EnumSpWMLParams.maxLength.name) {
      return EnumSpWMLParams.maxLength;
    } else if (s == EnumSpWMLParams.indicatorColor.name) {
      return EnumSpWMLParams.indicatorColor;
    } else if (s == EnumSpWMLParams.indicatorBGColor.name) {
      return EnumSpWMLParams.indicatorBGColor;
    } else if (s == EnumSpWMLParams.clipType.name) {
      return EnumSpWMLParams.clipType;
    } else if (s == EnumSpWMLParams.clipRadius.name) {
      return EnumSpWMLParams.clipRadius;
    } else if (s == EnumSpWMLParams.isLayoutStrictMode.name) {
      return EnumSpWMLParams.isLayoutStrictMode;
    } else if (s == EnumSpWMLParams.scrollBehavior.name) {
      return EnumSpWMLParams.scrollBehavior;
    } else if (s == EnumSpWMLParams.mag.name) {
      return EnumSpWMLParams.mag;
    }
    // フルネーム系は利用頻度が低いので、解析の優先度を下げる。
    else if (s == EnumSpWMLParams.mLeft.name) {
      return EnumSpWMLParams.mLeft;
    } else if (s == EnumSpWMLParams.mTop.name) {
      return EnumSpWMLParams.mTop;
    } else if (s == EnumSpWMLParams.mRight.name) {
      return EnumSpWMLParams.mRight;
    } else if (s == EnumSpWMLParams.mBottom.name) {
      return EnumSpWMLParams.mBottom;
    } else if (s == EnumSpWMLParams.pLeft.name) {
      return EnumSpWMLParams.pLeft;
    } else if (s == EnumSpWMLParams.pTop.name) {
      return EnumSpWMLParams.pTop;
    } else if (s == EnumSpWMLParams.pRight.name) {
      return EnumSpWMLParams.pRight;
    } else if (s == EnumSpWMLParams.pBottom.name) {
      return EnumSpWMLParams.pBottom;
    } else if (s == EnumSpWMLParams.height.name) {
      return EnumSpWMLParams.height;
    } else if (s == EnumSpWMLParams.width.name) {
      return EnumSpWMLParams.width;
    } else if (s == EnumSpWMLParams.weight.name) {
      return EnumSpWMLParams.weight;
    } else if (s == EnumSpWMLParams.minHeight.name) {
      return EnumSpWMLParams.minHeight;
    } else if (s == EnumSpWMLParams.minWidth.name) {
      return EnumSpWMLParams.minWidth;
    } else if (s == EnumSpWMLParams.maxHeight.name) {
      return EnumSpWMLParams.maxHeight;
    } else if (s == EnumSpWMLParams.maxWidth.name) {
      return EnumSpWMLParams.maxWidth;
    }
    // 廃止されたパラメータ。互換モードで動作するので優先度は最低です。
    // ignore: deprecated_member_use_from_same_package
    else if (s == EnumSpWMLParams.fontName.name) {
      return EnumSpWMLParams.fontFamily;
    }
    // ignore: deprecated_member_use_from_same_package
    else if (s == EnumSpWMLParams.textHeight.name) {
      return EnumSpWMLParams.lineHeight;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.paramException, lineStart, lineEnd, info);
    }
  }
}
