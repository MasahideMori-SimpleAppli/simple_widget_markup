import 'package:flutter/material.dart';
import '../element_params/element_params.dart';
import 'enum_spwml_element_param.dart';
import 'enum_spwml_element_type.dart';
import '../spwml_exception.dart';
import '../util_parser.dart';

import 'spwml_font_style.dart';

///
/// (en)Definition of the basic structure of the element.
/// (ja)要素の基本構造の定義。
///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-30 20:38:20
///
class SpWMLElement extends StatelessWidget {
  final int serial;
  final EnumSpWMLElementType type;
  final Map<EnumSpWMLElementParam, dynamic> param;
  final ElementParams text;
  final int parentSerial;
  final int lineStart;
  final int lineEnd;
  final SpWMLFontStyle style;

  ///
  /// * [serial] : Array Index.
  /// * [type] : Element type.
  /// * [param] : Element parameters.
  /// * [text] : The text.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  ///
  /// Throws [SpWMLException] : ParamException.
  /// Throws [SpWMLException] : ParamValueException.
  SpWMLElement(this.serial, this.type, List<String> param, this.text,
      this.parentSerial, this.lineStart, this.lineEnd, this.style)
      : param = _setParam(type, param, lineStart, lineEnd);

  const SpWMLElement.convert(this.serial, this.type, this.param, this.text,
      this.parentSerial, this.lineStart, this.lineEnd, this.style);

  static Map<EnumSpWMLElementParam, dynamic> _setParam(
      EnumSpWMLElementType type,
      List<String> param,
      int lineStart,
      int lineEnd) {
    Map<EnumSpWMLElementParam, dynamic> mParam = {};
    for (String i in param) {
      List<String> p = UtilParser.split(i, ":");
      if (p.length == 2) {
        // 変換される時点（パース時）で値の検査も行う。
        EnumSpWMLElementParam t = EXTEnumSpWMLElementParam.fromStr(
            p[0].replaceAll(" ", "").replaceAll("　", ""), lineStart, lineEnd);
        if (t == EnumSpWMLElementParam.alt) {
          mParam[t] = p[1];
        } else {
          mParam[t] = t.parseValue(type,
              p[1].replaceAll(" ", "").replaceAll("　", ""), lineStart, lineEnd);
        }
      } else {
        throw SpWMLException(
            EnumSpWMLExceptionType.paramException, lineStart, lineEnd);
      }
    }
    return mParam;
  }

  /// get text height from param. If null, return style value or 1.0.
  double getTextHeight() {
    if (type == EnumSpWMLElementType.text ||
        type == EnumSpWMLElementType.body1 ||
        type == EnumSpWMLElementType.body2) {
      return param.containsKey(EnumSpWMLElementParam.textHeight)
          ? param[EnumSpWMLElementParam.textHeight]
          : style.textHeight;
    } else if (type == EnumSpWMLElementType.h1 ||
        type == EnumSpWMLElementType.h2 ||
        type == EnumSpWMLElementType.h3 ||
        type == EnumSpWMLElementType.h4 ||
        type == EnumSpWMLElementType.h5 ||
        type == EnumSpWMLElementType.h6) {
      return param.containsKey(EnumSpWMLElementParam.textHeight)
          ? param[EnumSpWMLElementParam.textHeight]
          : style.hHeight;
    }
    return param.containsKey(EnumSpWMLElementParam.textHeight)
        ? param[EnumSpWMLElementParam.textHeight]
        : 1.0;
  }

  double _getMarginTop() {
    if (type == EnumSpWMLElementType.text ||
        type == EnumSpWMLElementType.body1 ||
        type == EnumSpWMLElementType.body2 ||
        type == EnumSpWMLElementType.href) {
      return param.containsKey(EnumSpWMLElementParam.mTop)
          ? param[EnumSpWMLElementParam.mTop]
          : style.textMTop;
    } else if (type == EnumSpWMLElementType.h1 ||
        type == EnumSpWMLElementType.h2 ||
        type == EnumSpWMLElementType.h3 ||
        type == EnumSpWMLElementType.h4 ||
        type == EnumSpWMLElementType.h5 ||
        type == EnumSpWMLElementType.h6) {
      return param.containsKey(EnumSpWMLElementParam.mTop)
          ? param[EnumSpWMLElementParam.mTop]
          : style.hMTop;
    }
    return param.containsKey(EnumSpWMLElementParam.mTop)
        ? param[EnumSpWMLElementParam.mTop]
        : 0.0;
  }

  /// get margin from param.
  EdgeInsets getMargin() {
    final double left = param.containsKey(EnumSpWMLElementParam.mLeft)
        ? param[EnumSpWMLElementParam.mLeft]
        : 0.0;
    final double top = _getMarginTop();
    final double right = param.containsKey(EnumSpWMLElementParam.mRight)
        ? param[EnumSpWMLElementParam.mRight]
        : 0.0;
    final double bottom = param.containsKey(EnumSpWMLElementParam.mBottom)
        ? param[EnumSpWMLElementParam.mBottom]
        : 0.0;
    return EdgeInsets.fromLTRB(left, top, right, bottom);
  }

  /// get padding from param.
  EdgeInsets getPadding() {
    final double left = param.containsKey(EnumSpWMLElementParam.pLeft)
        ? param[EnumSpWMLElementParam.pLeft]
        : 0.0;
    final double top = param.containsKey(EnumSpWMLElementParam.pTop)
        ? param[EnumSpWMLElementParam.pTop]
        : 0.0;
    final double right = param.containsKey(EnumSpWMLElementParam.pRight)
        ? param[EnumSpWMLElementParam.pRight]
        : 0.0;
    final double bottom = param.containsKey(EnumSpWMLElementParam.pBottom)
        ? param[EnumSpWMLElementParam.pBottom]
        : 0.0;
    return EdgeInsets.fromLTRB(left, top, right, bottom);
  }

  /// get style font size from param.
  double getDefFontSize() {
    if (type == EnumSpWMLElementType.h1) {
      return style.h1Size;
    } else if (type == EnumSpWMLElementType.h2) {
      return style.h2Size;
    } else if (type == EnumSpWMLElementType.h3) {
      return style.h3Size;
    } else if (type == EnumSpWMLElementType.h4) {
      return style.h4Size;
    } else if (type == EnumSpWMLElementType.h5) {
      return style.h5Size;
    } else if (type == EnumSpWMLElementType.h6) {
      return style.h6Size;
    } else if (type == EnumSpWMLElementType.href) {
      return style.body1Size;
    } else if (type == EnumSpWMLElementType.subtitle1) {
      return style.subtitle1Size;
    } else if (type == EnumSpWMLElementType.subtitle2) {
      return style.subtitle2Size;
    } else if (type == EnumSpWMLElementType.body1) {
      return style.body1Size;
    } else if (type == EnumSpWMLElementType.body2) {
      return style.body2Size;
    } else if (type == EnumSpWMLElementType.caption) {
      return style.captionSize;
    } else if (type == EnumSpWMLElementType.overline) {
      return style.overlineSize;
    } else {
      return style.body1Size;
    }
  }

  /// get style font weight from param.
  FontWeight getDefFontWeight() {
    if (type == EnumSpWMLElementType.h1) {
      return EnumSpWMLElementParam.fontWeight
          .parseValue(type, style.h1Weight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.h2) {
      return EnumSpWMLElementParam.fontWeight
          .parseValue(type, style.h2Weight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.h3) {
      return EnumSpWMLElementParam.fontWeight
          .parseValue(type, style.h3Weight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.h4) {
      return EnumSpWMLElementParam.fontWeight
          .parseValue(type, style.h4Weight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.h5) {
      return EnumSpWMLElementParam.fontWeight
          .parseValue(type, style.h5Weight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.h6) {
      return EnumSpWMLElementParam.fontWeight
          .parseValue(type, style.h6Weight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.href) {
      return EnumSpWMLElementParam.fontWeight
          .parseValue(type, style.hrefWeight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.subtitle1) {
      return EnumSpWMLElementParam.fontWeight
          .parseValue(type, style.subtitle1Weight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.subtitle2) {
      return EnumSpWMLElementParam.fontWeight
          .parseValue(type, style.subtitle2Weight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.body1) {
      return EnumSpWMLElementParam.fontWeight
          .parseValue(type, style.body1Weight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.body2) {
      return EnumSpWMLElementParam.fontWeight
          .parseValue(type, style.body2Weight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.caption) {
      return EnumSpWMLElementParam.fontWeight
          .parseValue(type, style.captionWeight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.overline) {
      return EnumSpWMLElementParam.fontWeight
          .parseValue(type, style.overlineWeight, lineStart, lineEnd);
    } else {
      return EnumSpWMLElementParam.fontWeight
          .parseValue(type, style.body1Weight, lineStart, lineEnd);
    }
  }

  /// get style text letter spacing from param.
  double? getDefFontLetterSpacing() {
    if (type == EnumSpWMLElementType.h1) {
      return style.h1LetterSpacing;
    } else if (type == EnumSpWMLElementType.h2) {
      return style.h2LetterSpacing;
    } else if (type == EnumSpWMLElementType.h3) {
      return style.h3LetterSpacing;
    } else if (type == EnumSpWMLElementType.h4) {
      return style.h4LetterSpacing;
    } else if (type == EnumSpWMLElementType.h5) {
      return style.h5LetterSpacing;
    } else if (type == EnumSpWMLElementType.h6) {
      return style.h6LetterSpacing;
    } else if (type == EnumSpWMLElementType.href) {
      return style.body1LetterSpacing;
    } else if (type == EnumSpWMLElementType.subtitle1) {
      return style.subtitle1LetterSpacing;
    } else if (type == EnumSpWMLElementType.subtitle2) {
      return style.subtitle2LetterSpacing;
    } else if (type == EnumSpWMLElementType.body1) {
      return style.body1LetterSpacing;
    } else if (type == EnumSpWMLElementType.body2) {
      return style.body2LetterSpacing;
    } else if (type == EnumSpWMLElementType.caption) {
      return style.captionLetterSpacing;
    } else if (type == EnumSpWMLElementType.overline) {
      return style.overlineLetterSpacing;
    } else {
      return style.body1LetterSpacing;
    }
  }

  BoxConstraints getConstraints() {
    final double minH = param.containsKey(EnumSpWMLElementParam.minHeight)
        ? param[EnumSpWMLElementParam.minHeight]
        : 0.0;
    final double minW = param.containsKey(EnumSpWMLElementParam.minWidth)
        ? param[EnumSpWMLElementParam.minWidth]
        : 0.0;
    final double maxH = param.containsKey(EnumSpWMLElementParam.maxHeight)
        ? param[EnumSpWMLElementParam.maxHeight]
        : double.infinity;
    final double maxW = param.containsKey(EnumSpWMLElementParam.maxWidth)
        ? param[EnumSpWMLElementParam.maxWidth]
        : double.infinity;
    return BoxConstraints(
        minHeight: minH, minWidth: minW, maxHeight: maxH, maxWidth: maxW);
  }

  /// get this element widget.
  Widget getWidget(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    if (param.containsKey(EnumSpWMLElementParam.weight)) {
      return Expanded(
        flex: param[EnumSpWMLElementParam.weight]!,
        child: getWidget(context),
      );
    } else {
      return getWidget(context);
    }
  }
}
