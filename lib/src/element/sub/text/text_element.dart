import 'package:flutter/material.dart';
import '../../../element_params/sub/text/text_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../element_params/util_params.dart';
import '../../../style/spwml_font_style.dart';
import '../../super/spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-30 23:42:11
///
class TextElement extends SpWMLElement {
  final TextParamsWrapper textParams;

  ///
  /// * [serial] : Array Index.
  /// * [type] : Element type.
  /// * [param] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [textParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  TextElement(
      int serial,
      EnumSpWMLElementType type,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.textParams)
      : super(serial, type, params, spwmlParams, parentSerial, lineStart,
            lineEnd, style);

  @override
  TextElement initParams() {
    super.initParams();
    textParams.p.isSelectable = params.containsKey(EnumSpWMLParams.isSelectable)
        ? params[EnumSpWMLParams.isSelectable]
        : type == EnumSpWMLElementType.menu
            ? false
            : true;
    if (textParams.p.isSelectable) {
      textParams.p.selectableTextParams = SelectableTextParams();
    }
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    return getTextWidget(context);
  }

  /// Get Text or SelectableText.
  Widget getTextWidget(BuildContext context) {
    return textParams.p.isSelectable
        ? SelectableText(
            textParams.p.data ?? spwmlParams.p.text,
            key: textParams.p.selectableTextParams!.key,
            focusNode: textParams.p.selectableTextParams!.focusNode,
            style: textParams.p.selectableTextParams!.style ?? getStyle(),
            strutStyle: textParams.p.selectableTextParams!.strutStyle ??
                getStrutStyle(),
            textAlign:
                textParams.p.selectableTextParams!.textAlign ?? getTextAlign(),
            textDirection: textParams.p.selectableTextParams!.textDirection,
            textScaleFactor:
                textParams.p.selectableTextParams!.textScaleFactor ??
                    MediaQuery.of(context).textScaleFactor,
            showCursor: textParams.p.selectableTextParams!.showCursor,
            autofocus: textParams.p.selectableTextParams!.autofocus,
            toolbarOptions: textParams.p.selectableTextParams!.toolbarOptions,
            minLines: textParams.p.selectableTextParams!.minLines,
            maxLines: textParams.p.selectableTextParams!.maxLines,
            cursorWidth: textParams.p.selectableTextParams!.cursorWidth,
            cursorHeight: textParams.p.selectableTextParams!.cursorHeight,
            cursorRadius: textParams.p.selectableTextParams!.cursorRadius,
            cursorColor: textParams.p.selectableTextParams!.cursorColor,
            selectionHeightStyle:
                textParams.p.selectableTextParams!.selectionHeightStyle,
            selectionWidthStyle:
                textParams.p.selectableTextParams!.selectionWidthStyle,
            dragStartBehavior:
                textParams.p.selectableTextParams!.dragStartBehavior,
            enableInteractiveSelection:
                textParams.p.selectableTextParams!.enableInteractiveSelection,
            selectionControls:
                textParams.p.selectableTextParams!.selectionControls,
            onTap: textParams.p.selectableTextParams!.onTap,
            scrollPhysics: textParams.p.selectableTextParams!.scrollPhysics,
            semanticsLabel: textParams.p.selectableTextParams!.semanticsLabel,
            textHeightBehavior:
                textParams.p.selectableTextParams!.textHeightBehavior,
            textWidthBasis: textParams.p.selectableTextParams!.textWidthBasis,
            onSelectionChanged:
                textParams.p.selectableTextParams!.onSelectionChanged,
          )
        : getText(context);
  }

  /// Get Text alignment.
  TextAlign getTextAlign() {
    return params.containsKey(EnumSpWMLParams.textAlign)
        ? params[EnumSpWMLParams.textAlign]
        : TextAlign.left;
  }

  /// Get text widget
  Widget getText(BuildContext context) {
    return Text(
      spwmlParams.p.text,
      key: textParams.p.key,
      style: textParams.p.style ?? getStyle(),
      strutStyle: textParams.p.strutStyle ?? getStrutStyle(),
      textAlign: textParams.p.textAlign ?? getTextAlign(),
      textDirection: textParams.p.textDirection,
      locale: textParams.p.locale,
      softWrap: textParams.p.softWrap,
      textScaleFactor: textParams.p.textScaleFactor ??
          MediaQuery.of(context).textScaleFactor,
      maxLines: textParams.p.maxLines,
      semanticsLabel: textParams.p.semanticsLabel,
      textWidthBasis: textParams.p.textWidthBasis,
      textHeightBehavior: textParams.p.textHeightBehavior,
    );
  }

  /// (en)Set new text of this element.
  ///
  /// (ja)このエレメントの新しいテキストを設定します。
  /// * [newText] 新しいテキスト.
  void setText(String newText) {
    spwmlParams.p.text = newText;
  }

  /// get text strut style from parameters.
  StrutStyle getStrutStyle() {
    return StrutStyle(
        fontSize: params.containsKey(EnumSpWMLParams.fontSize)
            ? params[EnumSpWMLParams.fontSize]
            : getDefFontSize(),
        height: params.containsKey(EnumSpWMLParams.textHeight)
            ? params[EnumSpWMLParams.textHeight]
            : 1.0);
  }

  /// get text height from param. If null, return style value or 1.0.
  double getTextHeight() {
    if (type == EnumSpWMLElementType.text ||
        type == EnumSpWMLElementType.body1 ||
        type == EnumSpWMLElementType.body2) {
      return params.containsKey(EnumSpWMLParams.textHeight)
          ? params[EnumSpWMLParams.textHeight]
          : style.textHeight;
    } else if (type == EnumSpWMLElementType.h1 ||
        type == EnumSpWMLElementType.h2 ||
        type == EnumSpWMLElementType.h3 ||
        type == EnumSpWMLElementType.h4 ||
        type == EnumSpWMLElementType.h5 ||
        type == EnumSpWMLElementType.h6) {
      return params.containsKey(EnumSpWMLParams.textHeight)
          ? params[EnumSpWMLParams.textHeight]
          : style.hHeight;
    }
    return params.containsKey(EnumSpWMLParams.textHeight)
        ? params[EnumSpWMLParams.textHeight]
        : 1.0;
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
      return EnumSpWMLParams.fontWeight
          .parseValue(type, style.h1Weight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.h2) {
      return EnumSpWMLParams.fontWeight
          .parseValue(type, style.h2Weight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.h3) {
      return EnumSpWMLParams.fontWeight
          .parseValue(type, style.h3Weight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.h4) {
      return EnumSpWMLParams.fontWeight
          .parseValue(type, style.h4Weight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.h5) {
      return EnumSpWMLParams.fontWeight
          .parseValue(type, style.h5Weight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.h6) {
      return EnumSpWMLParams.fontWeight
          .parseValue(type, style.h6Weight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.href) {
      return EnumSpWMLParams.fontWeight
          .parseValue(type, style.hrefWeight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.subtitle1) {
      return EnumSpWMLParams.fontWeight
          .parseValue(type, style.subtitle1Weight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.subtitle2) {
      return EnumSpWMLParams.fontWeight
          .parseValue(type, style.subtitle2Weight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.body1) {
      return EnumSpWMLParams.fontWeight
          .parseValue(type, style.body1Weight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.body2) {
      return EnumSpWMLParams.fontWeight
          .parseValue(type, style.body2Weight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.caption) {
      return EnumSpWMLParams.fontWeight
          .parseValue(type, style.captionWeight, lineStart, lineEnd);
    } else if (type == EnumSpWMLElementType.overline) {
      return EnumSpWMLParams.fontWeight
          .parseValue(type, style.overlineWeight, lineStart, lineEnd);
    } else {
      return EnumSpWMLParams.fontWeight
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

  /// get text style from parameters.
  TextStyle getStyle() {
    return TextStyle(
      color: params.containsKey(EnumSpWMLParams.textColor)
          ? params[EnumSpWMLParams.textColor]
          : UtilParams.convertColor(style.textColor),
      backgroundColor: params.containsKey(EnumSpWMLParams.textBGColor)
          ? params[EnumSpWMLParams.textBGColor]
          : null,
      fontSize: params.containsKey(EnumSpWMLParams.fontSize)
          ? params[EnumSpWMLParams.fontSize]
          : getDefFontSize(),
      fontWeight: params.containsKey(EnumSpWMLParams.fontWeight)
          ? params[EnumSpWMLParams.fontWeight]
          : getDefFontWeight(),
      fontStyle: params.containsKey(EnumSpWMLParams.fontStyle)
          ? params[EnumSpWMLParams.fontStyle]
          : FontStyle.normal,
      letterSpacing: params.containsKey(EnumSpWMLParams.letterSpacing)
          ? params[EnumSpWMLParams.letterSpacing]
          : getDefFontLetterSpacing(),
      wordSpacing: params.containsKey(EnumSpWMLParams.wordSpacing)
          ? params[EnumSpWMLParams.wordSpacing]
          : null,
      decoration: params.containsKey(EnumSpWMLParams.textDeco)
          ? params[EnumSpWMLParams.textDeco]
          : TextDecoration.none,
      decorationStyle: params.containsKey(EnumSpWMLParams.textDecoStyle)
          ? params[EnumSpWMLParams.textDecoStyle]
          : TextDecorationStyle.solid,
      decorationColor: params.containsKey(EnumSpWMLParams.textDecoColor)
          ? params[EnumSpWMLParams.textDecoColor]
          : null,
      decorationThickness: params.containsKey(EnumSpWMLParams.textDecoThickness)
          ? params[EnumSpWMLParams.textDecoThickness]
          : null,
      fontFamily: params.containsKey(EnumSpWMLParams.fontName)
          ? params[EnumSpWMLParams.fontName]
          : null,
      height: getTextHeight(),
    );
  }
}
