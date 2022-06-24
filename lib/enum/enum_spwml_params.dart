import 'package:flutter/material.dart';
import '../element/util_element.dart';
import '../enum/enum_btn_type.dart';
import 'enum_img_type.dart';
import 'enum_spwml_element_type.dart';
import '../util_parser.dart';

import '../spwml_exception.dart';
import 'enum_textfield_params.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-30 14:34:48
///
enum EnumSpWMLParams {
  h,
  w,
  height,
  width,
  alt,
  bgColor,
  fontName,
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
  textHeight,
  isSelectable,
  thickness,
  color,
  fit,
  repeat,
  minHeight,
  minWidth,
  maxHeight,
  maxWidth,
  minH,
  minW,
  maxH,
  maxW,
  // 以下２つは対象に応じて動的にStrから変更
  hAlign,
  vAlign,
  mLeft,
  mTop,
  mRight,
  mBottom,
  pLeft,
  pTop,
  pRight,
  pBottom,
  mL,
  mT,
  mR,
  mB,
  pL,
  pT,
  pR,
  pB,
  weight,
  id,
  axis,
  isPrimary,
  type,
  iconNum,
  suffixIconNum,
  borderWidth,
  borderRadius,
  borderColor,
  borderShape,
  shape,
  iconSize,
  iconColor,
  splashRadius,
  suffixIconSize,
  suffixIconColor,
  suffixIconSplashRadius,
  btnBGColor,
  elevation,
  shiftX,
  shiftY,
  hint,
  isExpanded,
  fillColor,
  radius,
  mode,
  labelText,
  value,
  cardElevation,
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
}

extension EXTEnumSpWMLParams on EnumSpWMLParams {
  /// Convert string name.
  String toStr() {
    return toString().split('.').last;
  }

  /// Throws [SpWMLException] : If the parameter value is incorrect,
  /// Throws ParamValueException.
  dynamic parseValue(
      EnumSpWMLElementType type, String v, int lineStart, int lineEnd) {
    try {
      // Frequently used
      if (this == EnumSpWMLParams.height ||
          this == EnumSpWMLParams.width ||
          this == EnumSpWMLParams.mLeft ||
          this == EnumSpWMLParams.mRight ||
          this == EnumSpWMLParams.mTop ||
          this == EnumSpWMLParams.mBottom ||
          this == EnumSpWMLParams.pLeft ||
          this == EnumSpWMLParams.pRight ||
          this == EnumSpWMLParams.pTop ||
          this == EnumSpWMLParams.pBottom ||
          this == EnumSpWMLParams.thickness ||
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
          this == EnumSpWMLParams.textHeight ||
          this == EnumSpWMLParams.letterSpacing ||
          this == EnumSpWMLParams.wordSpacing ||
          this == EnumSpWMLParams.underlineHeight ||
          this == EnumSpWMLParams.rTL ||
          this == EnumSpWMLParams.rTR ||
          this == EnumSpWMLParams.rBL ||
          this == EnumSpWMLParams.rBR ||
          this == EnumSpWMLParams.ellipticalX ||
          this == EnumSpWMLParams.ellipticalY) {
        return double.parse(v);
      }
      if (this == EnumSpWMLParams.weight || this == EnumSpWMLParams.hNum) {
        return int.parse(v);
      }
      // col, row or wrap only
      if (type == EnumSpWMLElementType.col) {
        if (this == EnumSpWMLParams.vAlign) {
          return UtilElement.convertMainAxisAlign(v, lineStart, lineEnd);
        } else if (this == EnumSpWMLParams.hAlign) {
          return UtilElement.convertCrossAxisAlign(v, lineStart, lineEnd);
        }
      } else if (type == EnumSpWMLElementType.row) {
        if (this == EnumSpWMLParams.vAlign) {
          return UtilElement.convertCrossAxisAlign(v, lineStart, lineEnd);
        } else if (this == EnumSpWMLParams.hAlign) {
          return UtilElement.convertMainAxisAlign(v, lineStart, lineEnd);
        }
      } else if (type == EnumSpWMLElementType.wrap) {
        if (this == EnumSpWMLParams.vAlign) {
          return UtilElement.convertWrapAlign(v, lineStart, lineEnd);
        } else if (this == EnumSpWMLParams.hAlign) {
          return UtilElement.convertWrapAlign(v, lineStart, lineEnd);
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
          return EXTEnumImgType.fromStr(v, lineStart, lineEnd);
        }
      }
      // textField only
      if (type == EnumSpWMLElementType.textField) {
        if (this == EnumSpWMLParams.type) {
          return EXTEnumTextFieldType.fromStr(v, lineStart, lineEnd);
        } else if (this == EnumSpWMLParams.mode) {
          return EXTEnumTextFieldMode.fromStr(v, lineStart, lineEnd);
        }
        // speed up code
        else if (this == EnumSpWMLParams.labelText) {
          return v;
        }
      }
      // btn only
      if (type == EnumSpWMLElementType.btn) {
        if (this == EnumSpWMLParams.type) {
          return EXTEnumBtnType.fromStr(v, lineStart, lineEnd);
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
          this == EnumSpWMLParams.borderColor) {
        return UtilParser.convertColor(v);
      } else if (this == EnumSpWMLParams.id) {
        return int.parse(v);
      } else if (this == EnumSpWMLParams.axis) {
        if (v == "vertical") {
          return Axis.vertical;
        } else if (v == "horizontal") {
          return Axis.horizontal;
        } else {
          throw Exception();
        }
      } else if (this == EnumSpWMLParams.iconNum ||
          this == EnumSpWMLParams.suffixIconNum) {
        if (v.startsWith('0x')) {
          v = v.replaceFirst('0x', '');
        }
        return IconData(int.parse(v, radix: 16), fontFamily: "MaterialIcons");
      } else if (this == EnumSpWMLParams.fontWeight) {
        if (v == "w100" || v == "thin") {
          return FontWeight.w100;
        } else if (v == "w200") {
          return FontWeight.w200;
        } else if (v == "w300" || v == "light") {
          return FontWeight.w300;
        } else if (v == "w400" || v == "normal" || v == "regular") {
          return FontWeight.w400;
        } else if (v == "w500" || v == "medium") {
          return FontWeight.w500;
        } else if (v == "w600") {
          return FontWeight.w600;
        } else if (v == "w700" || v == "bold") {
          return FontWeight.w700;
        } else if (v == "w800") {
          return FontWeight.w800;
        } else if (v == "w900" || v == "black") {
          return FontWeight.w900;
        } else {
          throw Exception();
        }
      } else if (this == EnumSpWMLParams.fontStyle) {
        if (v == "normal") {
          return FontStyle.normal;
        } else if (v == "italic") {
          return FontStyle.italic;
        } else {
          throw Exception();
        }
      } else if (this == EnumSpWMLParams.textDeco) {
        if (v == "none") {
          return TextDecoration.none;
        } else if (v == "underline") {
          return TextDecoration.underline;
        } else if (v == "overline") {
          return TextDecoration.overline;
        } else if (v == "lineThrough") {
          return TextDecoration.lineThrough;
        } else {
          throw Exception();
        }
      } else if (this == EnumSpWMLParams.textDecoStyle) {
        if (v == "solid") {
          return TextDecorationStyle.solid;
        } else if (v == "dotted") {
          return TextDecorationStyle.dotted;
        } else if (v == "dashed") {
          return TextDecorationStyle.dashed;
        } else if (v == "double") {
          return TextDecorationStyle.double;
        } else if (v == "wavy") {
          return TextDecorationStyle.wavy;
        } else {
          throw Exception();
        }
      } else if (this == EnumSpWMLParams.textAlign) {
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
          this == EnumSpWMLParams.value) {
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
      } else {
        // 変換不要ならそのまま返す。
        return v;
      }
    } catch (e) {
      throw SpWMLException(
          EnumSpWMLExceptionType.paramValueException, lineStart, lineEnd);
    }
  }

  /// Throws [SpWMLException] : If the parameter is incorrect, Throws ParamException.
  static EnumSpWMLParams fromStr(String s, int lineStart, int lineEnd) {
    if (s == EnumSpWMLParams.h.toStr()) {
      return EnumSpWMLParams.height;
    } else if (s == EnumSpWMLParams.w.toStr()) {
      return EnumSpWMLParams.width;
    } else if (s == EnumSpWMLParams.height.toStr()) {
      return EnumSpWMLParams.height;
    } else if (s == EnumSpWMLParams.width.toStr()) {
      return EnumSpWMLParams.width;
    } else if (s == EnumSpWMLParams.alt.toStr()) {
      return EnumSpWMLParams.alt;
    } else if (s == EnumSpWMLParams.bgColor.toStr()) {
      return EnumSpWMLParams.bgColor;
    } else if (s == EnumSpWMLParams.fontName.toStr()) {
      return EnumSpWMLParams.fontName;
    } else if (s == EnumSpWMLParams.fontSize.toStr()) {
      return EnumSpWMLParams.fontSize;
    } else if (s == EnumSpWMLParams.fontWeight.toStr()) {
      return EnumSpWMLParams.fontWeight;
    } else if (s == EnumSpWMLParams.fontStyle.toStr()) {
      return EnumSpWMLParams.fontStyle;
    } else if (s == EnumSpWMLParams.letterSpacing.toStr()) {
      return EnumSpWMLParams.letterSpacing;
    } else if (s == EnumSpWMLParams.wordSpacing.toStr()) {
      return EnumSpWMLParams.wordSpacing;
    } else if (s == EnumSpWMLParams.textColor.toStr()) {
      return EnumSpWMLParams.textColor;
    } else if (s == EnumSpWMLParams.textBGColor.toStr()) {
      return EnumSpWMLParams.textBGColor;
    } else if (s == EnumSpWMLParams.textDeco.toStr()) {
      return EnumSpWMLParams.textDeco;
    } else if (s == EnumSpWMLParams.textDecoStyle.toStr()) {
      return EnumSpWMLParams.textDecoStyle;
    } else if (s == EnumSpWMLParams.textDecoColor.toStr()) {
      return EnumSpWMLParams.textDecoColor;
    } else if (s == EnumSpWMLParams.textAlign.toStr()) {
      return EnumSpWMLParams.textAlign;
    } else if (s == EnumSpWMLParams.textHeight.toStr()) {
      return EnumSpWMLParams.textHeight;
    } else if (s == EnumSpWMLParams.isSelectable.toStr()) {
      return EnumSpWMLParams.isSelectable;
    } else if (s == EnumSpWMLParams.thickness.toStr()) {
      return EnumSpWMLParams.thickness;
    } else if (s == EnumSpWMLParams.color.toStr()) {
      return EnumSpWMLParams.color;
    } else if (s == EnumSpWMLParams.fit.toStr()) {
      return EnumSpWMLParams.fit;
    } else if (s == EnumSpWMLParams.repeat.toStr()) {
      return EnumSpWMLParams.repeat;
    } else if (s == EnumSpWMLParams.hAlign.toStr()) {
      return EnumSpWMLParams.hAlign;
    } else if (s == EnumSpWMLParams.vAlign.toStr()) {
      return EnumSpWMLParams.vAlign;
    } else if (s == EnumSpWMLParams.mLeft.toStr()) {
      return EnumSpWMLParams.mLeft;
    } else if (s == EnumSpWMLParams.mTop.toStr()) {
      return EnumSpWMLParams.mTop;
    } else if (s == EnumSpWMLParams.mRight.toStr()) {
      return EnumSpWMLParams.mRight;
    } else if (s == EnumSpWMLParams.mBottom.toStr()) {
      return EnumSpWMLParams.mBottom;
    } else if (s == EnumSpWMLParams.pLeft.toStr()) {
      return EnumSpWMLParams.pLeft;
    } else if (s == EnumSpWMLParams.pTop.toStr()) {
      return EnumSpWMLParams.pTop;
    } else if (s == EnumSpWMLParams.pRight.toStr()) {
      return EnumSpWMLParams.pRight;
    } else if (s == EnumSpWMLParams.pBottom.toStr()) {
      return EnumSpWMLParams.pBottom;
    } else if (s == EnumSpWMLParams.mL.toStr()) {
      return EnumSpWMLParams.mLeft;
    } else if (s == EnumSpWMLParams.mT.toStr()) {
      return EnumSpWMLParams.mTop;
    } else if (s == EnumSpWMLParams.mR.toStr()) {
      return EnumSpWMLParams.mRight;
    } else if (s == EnumSpWMLParams.mB.toStr()) {
      return EnumSpWMLParams.mBottom;
    } else if (s == EnumSpWMLParams.pL.toStr()) {
      return EnumSpWMLParams.pLeft;
    } else if (s == EnumSpWMLParams.pT.toStr()) {
      return EnumSpWMLParams.pTop;
    } else if (s == EnumSpWMLParams.pR.toStr()) {
      return EnumSpWMLParams.pRight;
    } else if (s == EnumSpWMLParams.pB.toStr()) {
      return EnumSpWMLParams.pBottom;
    } else if (s == EnumSpWMLParams.weight.toStr()) {
      return EnumSpWMLParams.weight;
    } else if (s == EnumSpWMLParams.id.toStr()) {
      return EnumSpWMLParams.id;
    } else if (s == EnumSpWMLParams.axis.toStr()) {
      return EnumSpWMLParams.axis;
    } else if (s == EnumSpWMLParams.isPrimary.toStr()) {
      return EnumSpWMLParams.isPrimary;
    } else if (s == EnumSpWMLParams.minHeight.toStr()) {
      return EnumSpWMLParams.minHeight;
    } else if (s == EnumSpWMLParams.minWidth.toStr()) {
      return EnumSpWMLParams.minWidth;
    } else if (s == EnumSpWMLParams.maxHeight.toStr()) {
      return EnumSpWMLParams.maxHeight;
    } else if (s == EnumSpWMLParams.maxWidth.toStr()) {
      return EnumSpWMLParams.maxWidth;
    } else if (s == EnumSpWMLParams.minH.toStr()) {
      return EnumSpWMLParams.minHeight;
    } else if (s == EnumSpWMLParams.minW.toStr()) {
      return EnumSpWMLParams.minWidth;
    } else if (s == EnumSpWMLParams.maxH.toStr()) {
      return EnumSpWMLParams.maxHeight;
    } else if (s == EnumSpWMLParams.maxW.toStr()) {
      return EnumSpWMLParams.maxWidth;
    } else if (s == EnumSpWMLParams.borderWidth.toStr()) {
      return EnumSpWMLParams.borderWidth;
    } else if (s == EnumSpWMLParams.borderRadius.toStr()) {
      return EnumSpWMLParams.borderRadius;
    } else if (s == EnumSpWMLParams.borderColor.toStr()) {
      return EnumSpWMLParams.borderColor;
    } else if (s == EnumSpWMLParams.shape.toStr()) {
      return EnumSpWMLParams.shape;
    } else if (s == EnumSpWMLParams.type.toStr()) {
      return EnumSpWMLParams.type;
    } else if (s == EnumSpWMLParams.iconNum.toStr()) {
      return EnumSpWMLParams.iconNum;
    } else if (s == EnumSpWMLParams.iconSize.toStr()) {
      return EnumSpWMLParams.iconSize;
    } else if (s == EnumSpWMLParams.iconColor.toStr()) {
      return EnumSpWMLParams.iconColor;
    } else if (s == EnumSpWMLParams.suffixIconNum.toStr()) {
      return EnumSpWMLParams.suffixIconNum;
    } else if (s == EnumSpWMLParams.suffixIconSize.toStr()) {
      return EnumSpWMLParams.suffixIconSize;
    } else if (s == EnumSpWMLParams.suffixIconColor.toStr()) {
      return EnumSpWMLParams.suffixIconColor;
    } else if (s == EnumSpWMLParams.btnBGColor.toStr()) {
      return EnumSpWMLParams.btnBGColor;
    } else if (s == EnumSpWMLParams.splashRadius.toStr()) {
      return EnumSpWMLParams.splashRadius;
    } else if (s == EnumSpWMLParams.suffixIconSplashRadius.toStr()) {
      return EnumSpWMLParams.suffixIconSplashRadius;
    } else if (s == EnumSpWMLParams.elevation.toStr()) {
      return EnumSpWMLParams.elevation;
    } else if (s == EnumSpWMLParams.cardElevation.toStr()) {
      return EnumSpWMLParams.cardElevation;
    } else if (s == EnumSpWMLParams.shiftX.toStr()) {
      return EnumSpWMLParams.shiftX;
    } else if (s == EnumSpWMLParams.shiftY.toStr()) {
      return EnumSpWMLParams.shiftY;
    } else if (s == EnumSpWMLParams.hint.toStr()) {
      return EnumSpWMLParams.hint;
    } else if (s == EnumSpWMLParams.isExpanded.toStr()) {
      return EnumSpWMLParams.isExpanded;
    } else if (s == EnumSpWMLParams.fillColor.toStr()) {
      return EnumSpWMLParams.fillColor;
    } else if (s == EnumSpWMLParams.radius.toStr()) {
      return EnumSpWMLParams.radius;
    } else if (s == EnumSpWMLParams.mode.toStr()) {
      return EnumSpWMLParams.mode;
    } else if (s == EnumSpWMLParams.labelText.toStr()) {
      return EnumSpWMLParams.labelText;
    } else if (s == EnumSpWMLParams.value.toStr()) {
      return EnumSpWMLParams.value;
    } else if (s == EnumSpWMLParams.underlineColor.toStr()) {
      return EnumSpWMLParams.underlineColor;
    } else if (s == EnumSpWMLParams.underlineHeight.toStr()) {
      return EnumSpWMLParams.underlineHeight;
    } else if (s == EnumSpWMLParams.hNum.toStr()) {
      return EnumSpWMLParams.hNum;
    } else if (s == EnumSpWMLParams.rTL.toStr()) {
      return EnumSpWMLParams.rTL;
    } else if (s == EnumSpWMLParams.rTR.toStr()) {
      return EnumSpWMLParams.rTR;
    } else if (s == EnumSpWMLParams.rBL.toStr()) {
      return EnumSpWMLParams.rBL;
    } else if (s == EnumSpWMLParams.rBR.toStr()) {
      return EnumSpWMLParams.rBR;
    } else if (s == EnumSpWMLParams.ellipticalX.toStr()) {
      return EnumSpWMLParams.ellipticalX;
    } else if (s == EnumSpWMLParams.ellipticalY.toStr()) {
      return EnumSpWMLParams.ellipticalY;
    } else if (s == EnumSpWMLParams.borderShape.toStr()) {
      return EnumSpWMLParams.borderShape;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.paramException, lineStart, lineEnd);
    }
  }
}
