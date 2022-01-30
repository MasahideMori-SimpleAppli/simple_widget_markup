import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'enum_spwml_element_type.dart';
import 'util_element.dart';
import '../util_parser.dart';

import '../spwml_exception.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-30 14:34:48
///
enum EnumSpWMLElementParam {
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
  weight,
  id,
  axis
}

extension EXTEnumSpWMLElementParam on EnumSpWMLElementParam {
  String toStr() {
    return toString().split('.').last;
  }

  /// Throws [SpWMLException] : If the parameter value is incorrect,
  /// Throws ParamValueException.
  dynamic parseValue(
      EnumSpWMLElementType type, String v, int lineStart, int lineEnd) {
    try {
      // Frequently used
      if (this == EnumSpWMLElementParam.height ||
          this == EnumSpWMLElementParam.width ||
          this == EnumSpWMLElementParam.mLeft ||
          this == EnumSpWMLElementParam.mRight ||
          this == EnumSpWMLElementParam.mTop ||
          this == EnumSpWMLElementParam.mBottom ||
          this == EnumSpWMLElementParam.pLeft ||
          this == EnumSpWMLElementParam.pRight ||
          this == EnumSpWMLElementParam.pTop ||
          this == EnumSpWMLElementParam.pBottom ||
          this == EnumSpWMLElementParam.weight ||
          this == EnumSpWMLElementParam.thickness ||
          this == EnumSpWMLElementParam.minHeight ||
          this == EnumSpWMLElementParam.minWidth ||
          this == EnumSpWMLElementParam.maxHeight ||
          this == EnumSpWMLElementParam.maxWidth) {
        return double.parse(v);
      }
      // col or row only
      if (type == EnumSpWMLElementType.col) {
        if (this == EnumSpWMLElementParam.vAlign) {
          return UtilElement.convertMainAxisAlign(v, lineStart, lineEnd);
        } else if (this == EnumSpWMLElementParam.hAlign) {
          return UtilElement.convertCrossAxisAlign(v, lineStart, lineEnd);
        }
      } else if (type == EnumSpWMLElementType.row) {
        if (this == EnumSpWMLElementParam.vAlign) {
          return UtilElement.convertCrossAxisAlign(v, lineStart, lineEnd);
        } else if (this == EnumSpWMLElementParam.hAlign) {
          return UtilElement.convertMainAxisAlign(v, lineStart, lineEnd);
        }
      } else if (type == EnumSpWMLElementType.img) {
        if (this == EnumSpWMLElementParam.fit) {
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
        } else if (this == EnumSpWMLElementParam.repeat) {
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
        }
      }
      if (this == EnumSpWMLElementParam.bgColor ||
          this == EnumSpWMLElementParam.color) {
        return UtilParser.convertColor(v);
      } else if (this == EnumSpWMLElementParam.id) {
        return int.parse(v);
      } else if (this == EnumSpWMLElementParam.axis) {
        if (v == "vertical") {
          return Axis.vertical;
        } else if (v == "horizontal") {
          return Axis.horizontal;
        } else {
          throw Exception();
        }
      } else if (this == EnumSpWMLElementParam.fontSize ||
          this == EnumSpWMLElementParam.textHeight ||
          this == EnumSpWMLElementParam.letterSpacing ||
          this == EnumSpWMLElementParam.wordSpacing) {
        return double.parse(v);
      } else if (this == EnumSpWMLElementParam.fontWeight) {
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
      } else if (this == EnumSpWMLElementParam.textColor ||
          this == EnumSpWMLElementParam.textDecoColor) {
        return UtilParser.convertColor(v);
      } else if (this == EnumSpWMLElementParam.fontStyle) {
        if (v == "normal") {
          return FontStyle.normal;
        } else if (v == "italic") {
          return FontStyle.italic;
        } else {
          throw Exception();
        }
      } else if (this == EnumSpWMLElementParam.textDeco) {
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
      } else if (this == EnumSpWMLElementParam.textDecoStyle) {
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
      } else if (this == EnumSpWMLElementParam.textAlign) {
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
      } else if (this == EnumSpWMLElementParam.isSelectable) {
        if (v == "true") {
          return true;
        } else if (v == "false") {
          return false;
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
  static EnumSpWMLElementParam fromStr(String s, int lineStart, int lineEnd) {
    if (s == EnumSpWMLElementParam.height.toStr()) {
      return EnumSpWMLElementParam.height;
    } else if (s == EnumSpWMLElementParam.width.toStr()) {
      return EnumSpWMLElementParam.width;
    } else if (s == EnumSpWMLElementParam.alt.toStr()) {
      return EnumSpWMLElementParam.alt;
    } else if (s == EnumSpWMLElementParam.bgColor.toStr()) {
      return EnumSpWMLElementParam.bgColor;
    } else if (s == EnumSpWMLElementParam.fontName.toStr()) {
      return EnumSpWMLElementParam.fontName;
    } else if (s == EnumSpWMLElementParam.fontSize.toStr()) {
      return EnumSpWMLElementParam.fontSize;
    } else if (s == EnumSpWMLElementParam.fontWeight.toStr()) {
      return EnumSpWMLElementParam.fontWeight;
    } else if (s == EnumSpWMLElementParam.fontStyle.toStr()) {
      return EnumSpWMLElementParam.fontStyle;
    } else if (s == EnumSpWMLElementParam.letterSpacing.toStr()) {
      return EnumSpWMLElementParam.letterSpacing;
    } else if (s == EnumSpWMLElementParam.wordSpacing.toStr()) {
      return EnumSpWMLElementParam.wordSpacing;
    } else if (s == EnumSpWMLElementParam.textColor.toStr()) {
      return EnumSpWMLElementParam.textColor;
    } else if (s == EnumSpWMLElementParam.textDeco.toStr()) {
      return EnumSpWMLElementParam.textDeco;
    } else if (s == EnumSpWMLElementParam.textDecoStyle.toStr()) {
      return EnumSpWMLElementParam.textDecoStyle;
    } else if (s == EnumSpWMLElementParam.textDecoColor.toStr()) {
      return EnumSpWMLElementParam.textDecoColor;
    } else if (s == EnumSpWMLElementParam.textAlign.toStr()) {
      return EnumSpWMLElementParam.textAlign;
    } else if (s == EnumSpWMLElementParam.textHeight.toStr()) {
      return EnumSpWMLElementParam.textHeight;
    } else if (s == EnumSpWMLElementParam.isSelectable.toStr()) {
      return EnumSpWMLElementParam.isSelectable;
    } else if (s == EnumSpWMLElementParam.thickness.toStr()) {
      return EnumSpWMLElementParam.thickness;
    } else if (s == EnumSpWMLElementParam.color.toStr()) {
      return EnumSpWMLElementParam.color;
    } else if (s == EnumSpWMLElementParam.fit.toStr()) {
      return EnumSpWMLElementParam.fit;
    } else if (s == EnumSpWMLElementParam.repeat.toStr()) {
      return EnumSpWMLElementParam.repeat;
    } else if (s == EnumSpWMLElementParam.hAlign.toStr()) {
      return EnumSpWMLElementParam.hAlign;
    } else if (s == EnumSpWMLElementParam.vAlign.toStr()) {
      return EnumSpWMLElementParam.vAlign;
    } else if (s == EnumSpWMLElementParam.mLeft.toStr()) {
      return EnumSpWMLElementParam.mLeft;
    } else if (s == EnumSpWMLElementParam.mTop.toStr()) {
      return EnumSpWMLElementParam.mTop;
    } else if (s == EnumSpWMLElementParam.mRight.toStr()) {
      return EnumSpWMLElementParam.mRight;
    } else if (s == EnumSpWMLElementParam.mBottom.toStr()) {
      return EnumSpWMLElementParam.mBottom;
    } else if (s == EnumSpWMLElementParam.pLeft.toStr()) {
      return EnumSpWMLElementParam.pLeft;
    } else if (s == EnumSpWMLElementParam.pTop.toStr()) {
      return EnumSpWMLElementParam.pTop;
    } else if (s == EnumSpWMLElementParam.pRight.toStr()) {
      return EnumSpWMLElementParam.pRight;
    } else if (s == EnumSpWMLElementParam.pBottom.toStr()) {
      return EnumSpWMLElementParam.pBottom;
    } else if (s == EnumSpWMLElementParam.weight.toStr()) {
      return EnumSpWMLElementParam.weight;
    } else if (s == EnumSpWMLElementParam.id.toStr()) {
      return EnumSpWMLElementParam.id;
    } else if (s == EnumSpWMLElementParam.axis.toStr()) {
      return EnumSpWMLElementParam.axis;
    } else if (s == EnumSpWMLElementParam.minHeight.toStr()) {
      return EnumSpWMLElementParam.minHeight;
    } else if (s == EnumSpWMLElementParam.minWidth.toStr()) {
      return EnumSpWMLElementParam.minWidth;
    } else if (s == EnumSpWMLElementParam.maxHeight.toStr()) {
      return EnumSpWMLElementParam.maxHeight;
    } else if (s == EnumSpWMLElementParam.maxWidth.toStr()) {
      return EnumSpWMLElementParam.maxWidth;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.paramException, lineStart, lineEnd);
    }
  }
}
