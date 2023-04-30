import 'package:flutter/material.dart';
import '../../../../simple_widget_markup.dart';

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
  /// * [info] : SpWML info.
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
      SpWMLInfo? info,
      this.textParams)
      : super(serial, type, params, spwmlParams, parentSerial, lineStart,
            lineEnd, style, info);

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
      textParams.p.selectableTextParams!.maxLines =
          params.containsKey(EnumSpWMLParams.maxLines)
              ? params[EnumSpWMLParams.maxLines]
              : null;
    } else {
      textParams.p.overflow = params.containsKey(EnumSpWMLParams.overflow)
          ? params[EnumSpWMLParams.overflow]
          : null;
      textParams.p.maxLines = params.containsKey(EnumSpWMLParams.maxLines)
          ? params[EnumSpWMLParams.maxLines]
          : null;
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
            contextMenuBuilder:
                textParams.p.selectableTextParams!.contextMenuBuilder,
            magnifierConfiguration:
                textParams.p.selectableTextParams!.magnifierConfiguration,
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
      overflow: textParams.p.overflow,
      textScaleFactor: textParams.p.textScaleFactor ??
          MediaQuery.of(context).textScaleFactor,
      maxLines: textParams.p.maxLines,
      semanticsLabel: textParams.p.semanticsLabel,
      textWidthBasis: textParams.p.textWidthBasis,
      textHeightBehavior: textParams.p.textHeightBehavior,
      selectionColor: textParams.p.selectionColor,
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
        height: params.containsKey(EnumSpWMLParams.lineHeight)
            ? params[EnumSpWMLParams.lineHeight]
            : null);
  }

  /// get text height from param.
  double? getTextHeight() {
    if (style.styleMap.containsKey(type)) {
      return style.styleMap[type]!.lineHeight;
    } else {
      return null;
    }
  }

  /// get default text color
  Color? getDefTextColor() {
    if (style.styleMap.containsKey(type)) {
      if (style.styleMap[type]!.textColor != null) {
        return UtilParams.convertColor(
            style.styleMap[type]!.textColor!, lineStart, lineEnd, info);
      }
    }
    return null;
  }

  /// get default text backgound color
  Color? getDefTextBGColor() {
    if (style.styleMap.containsKey(type)) {
      if (style.styleMap[type]!.textBGColor != null) {
        return UtilParams.convertColor(
            style.styleMap[type]!.textBGColor!, lineStart, lineEnd, info);
      }
    }
    return null;
  }

  /// get default font size.
  double? getDefFontSize() {
    if (style.styleMap.containsKey(type)) {
      return style.styleMap[type]!.fontSize;
    }
    return null;
  }

  /// get default font weight.
  FontWeight? getDefFontWeight() {
    if (style.styleMap.containsKey(type)) {
      if (style.styleMap[type]!.fontWeight == null) {
        return null;
      } else {
        return style.styleMap[type]!.fontWeight!
            .toObj(lineStart, lineEnd, info);
      }
    }
    return null;
  }

  /// get default font style.
  FontStyle? getDefFontStyle() {
    if (style.styleMap.containsKey(type)) {
      if (style.styleMap[type]!.fontStyle == null) {
        return null;
      } else {
        return style.styleMap[type]!.fontStyle!.toObj(lineStart, lineEnd, info);
      }
    }
    return null;
  }

  /// get default text letter spacing.
  double? getDefFontLetterSpacing() {
    if (style.styleMap.containsKey(type)) {
      return style.styleMap[type]!.letterSpacing;
    }
    return null;
  }

  /// get default word spacing.
  double? getDefWordSpacing() {
    if (style.styleMap.containsKey(type)) {
      return style.styleMap[type]!.wordSpacing;
    }
    return null;
  }

  /// get default text decoration.
  TextDecoration? getDefTextDeco() {
    if (style.styleMap.containsKey(type)) {
      if (style.styleMap[type]!.textDeco == null) {
        return null;
      } else {
        return style.styleMap[type]!.textDeco!.toObj(lineStart, lineEnd, info);
      }
    }
    return null;
  }

  /// get default decoration style.
  TextDecorationStyle? getDefDecorationStyle() {
    if (style.styleMap.containsKey(type)) {
      if (style.styleMap[type]!.textDecoStyle == null) {
        return null;
      } else {
        return style.styleMap[type]!.textDecoStyle!
            .toObj(lineStart, lineEnd, info);
      }
    }
    return null;
  }

  /// get default decoration color.
  Color? getDefTextDecoColor() {
    if (style.styleMap.containsKey(type)) {
      if (style.styleMap[type]!.textDecoColor == null) {
        return null;
      } else {
        return UtilParams.convertColor(
            style.styleMap[type]!.textDecoColor!, lineStart, lineEnd, info);
      }
    }
    return null;
  }

  /// get default decoration thickness.
  double? getDefTextDecoThickness() {
    if (style.styleMap.containsKey(type)) {
      return style.styleMap[type]!.textDecoThickness;
    }
    return null;
  }

  /// get default font family.
  String? getDefFontFamily() {
    if (style.styleMap.containsKey(type)) {
      return style.styleMap[type]!.fontFamily;
    }
    return null;
  }

  /// get text style from parameters.
  TextStyle getStyle() {
    return TextStyle(
      color: params.containsKey(EnumSpWMLParams.textColor)
          ? params[EnumSpWMLParams.textColor]
          : getDefTextColor(),
      backgroundColor: params.containsKey(EnumSpWMLParams.textBGColor)
          ? params[EnumSpWMLParams.textBGColor]
          : getDefTextBGColor(),
      fontSize: params.containsKey(EnumSpWMLParams.fontSize)
          ? params[EnumSpWMLParams.fontSize]
          : getDefFontSize(),
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
      height: getTextHeight(),
    );
  }
}
