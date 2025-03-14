import 'package:flutter/material.dart';
import '../../../../simple_widget_markup.dart';

///
/// (en) The text.
///
/// (ja) textの実装。
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
      super.serial,
      super.type,
      super.params,
      super.spwmlParams,
      super.parentSerial,
      super.lineStart,
      super.lineEnd,
      super.style,
      super.info,
      this.textParams,
      {super.key});

  /// Get this class name.
  @override
  String getClassName() {
    return "TextElement";
  }

  /// Initialize the parameters.
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
    textParams.p.useTextScaler =
        params.containsKey(EnumSpWMLParams.useTextScaler)
            ? params[EnumSpWMLParams.useTextScaler]
            : false;
    return this;
  }

  /// Assemble and return the widget.
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
            style:
                textParams.p.selectableTextParams!.style ?? getStyle(context),
            strutStyle: textParams.p.selectableTextParams!.strutStyle ??
                getStrutStyle(context),
            textAlign:
                textParams.p.selectableTextParams!.textAlign ?? getTextAlign(),
            textDirection: textParams.p.selectableTextParams!.textDirection,
            textScaler: textParams.p.selectableTextParams!.textScaler ??
                MediaQuery.of(context).textScaler,
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
        : getNonSelectableTextWidget(context);
  }

  /// Get Text alignment.
  TextAlign getTextAlign() {
    return params.containsKey(EnumSpWMLParams.textAlign)
        ? params[EnumSpWMLParams.textAlign]
        : TextAlign.left;
  }

  /// Get text widget
  Widget getNonSelectableTextWidget(BuildContext context) {
    return Text(
      spwmlParams.p.text,
      key: textParams.p.key,
      style: textParams.p.style ?? getStyle(context),
      strutStyle: textParams.p.strutStyle ?? getStrutStyle(context),
      textAlign: textParams.p.textAlign ?? getTextAlign(),
      textDirection: textParams.p.textDirection,
      locale: textParams.p.locale,
      softWrap: textParams.p.softWrap,
      overflow: textParams.p.overflow,
      textScaler: textParams.p.textScaler ?? MediaQuery.of(context).textScaler,
      maxLines: textParams.p.maxLines,
      semanticsLabel: textParams.p.semanticsLabel,
      textWidthBasis: textParams.p.textWidthBasis,
      textHeightBehavior: textParams.p.textHeightBehavior,
      selectionColor: textParams.p.selectionColor,
    );
  }

  /// (en) A dedicated function to be called in a span block.
  /// Using SelectableText in a span will break the range, but you can avoid it.
  ///
  /// (ja) spanブロックの中で呼び出す専用の関数です。
  /// span中でSelectableTextを用いると範囲が壊れますが、それを回避できます。
  Widget getInSpan(BuildContext context) {
    if (spwmlParams.p.isGone) {
      return const SizedBox();
    } else {
      return expand(transform(material(
          constraints(container(getNonSelectableTextWidget(context))))));
    }
  }

  /// (en) Gets the content text set on this element.
  ///
  /// (ja) このエレメントに設定されているコンテンツテキストを取得します。
  String getContentText() {
    return spwmlParams.p.text;
  }

  /// (en) Sets the content text for this element.
  ///
  /// (ja) このエレメントにコンテンツテキストを設定します。
  ///
  /// * [text] : The content text.
  void setContentText(String text) {
    spwmlParams.p.text = text;
  }

  /// (en) Overrides the font size for this element.
  /// However, if you set TextStyle or StrutStyle,
  /// note that the set TextStyle or StrutStyle will take precedence.
  ///
  /// (ja) このエレメントのフォントサイズを上書きします。
  /// ただし、TextStyleやStrutStyleを上書きしている場合は
  /// 上書きしたTextStyleやStrutStyleが優先されることに注意してください。
  ///
  /// * [fontSize] : The font size of px.
  /// This value is before any device scaling is applied.
  void setFontSize(double fontSize) {
    params[EnumSpWMLParams.fontSize] = fontSize;
  }

  /// get text strut style from parameters.
  StrutStyle? getStrutStyle(BuildContext context) {
    final double fontSize = params.containsKey(EnumSpWMLParams.fontSize)
        ? params[EnumSpWMLParams.fontSize]
        : getDefFontSize();
    final TextScaler tScaler = textParams.p.useTextScaler
        ? MediaQuery.of(context).textScaler
        : TextScaler.noScaling;
    if (type == EnumSpWMLElementType.textField) {
      if (SpWMLFontStyleManager().useMaterial3) {
        return null;
      } else {
        return StrutStyle(
          fontFamily: params.containsKey(EnumSpWMLParams.fontFamily)
              ? params[EnumSpWMLParams.fontFamily]
              : getDefFontFamily(),
          fontSize: tScaler.scale(fontSize),
          height: getLineHeight(),
          leading: params.containsKey(EnumSpWMLParams.leading)
              ? params[EnumSpWMLParams.leading]
              : null,
          leadingDistribution:
              params.containsKey(EnumSpWMLParams.leadingDistribution)
                  ? params[EnumSpWMLParams.leadingDistribution]
                  : null,
          fontWeight: params.containsKey(EnumSpWMLParams.fontWeight)
              ? params[EnumSpWMLParams.fontWeight]
              : getDefFontWeight(),
          fontStyle: params.containsKey(EnumSpWMLParams.fontStyle)
              ? params[EnumSpWMLParams.fontStyle]
              : getDefFontStyle(),
          forceStrutHeight: params.containsKey(EnumSpWMLParams.forceStrutHeight)
              ? params[EnumSpWMLParams.forceStrutHeight]
              : null,
        );
      }
    } else {
      return StrutStyle(
        fontFamily: params.containsKey(EnumSpWMLParams.fontFamily)
            ? params[EnumSpWMLParams.fontFamily]
            : getDefFontFamily(),
        fontSize: tScaler.scale(fontSize),
        height: getLineHeight(),
        leading: params.containsKey(EnumSpWMLParams.leading)
            ? params[EnumSpWMLParams.leading]
            : null,
        fontWeight: params.containsKey(EnumSpWMLParams.fontWeight)
            ? params[EnumSpWMLParams.fontWeight]
            : getDefFontWeight(),
        fontStyle: params.containsKey(EnumSpWMLParams.fontStyle)
            ? params[EnumSpWMLParams.fontStyle]
            : getDefFontStyle(),
      );
    }
  }

  /// get text height from param.
  double? getLineHeight() {
    if (style.styleMap.containsKey(type)) {
      return params.containsKey(EnumSpWMLParams.lineHeight)
          ? params[EnumSpWMLParams.lineHeight]
          : style.styleMap[type]!.lineHeight;
    } else {
      return params.containsKey(EnumSpWMLParams.lineHeight)
          ? params[EnumSpWMLParams.lineHeight]
          : null;
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

  /// get default text background color
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
  double getDefFontSize() {
    if (style.styleMap.containsKey(type)) {
      return style.styleMap[type]!.fontSize ?? 14;
    }
    return 14;
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

  /// get font size.
  double? getFontSize(BuildContext context) {
    final double fontSize = params.containsKey(EnumSpWMLParams.fontSize)
        ? params[EnumSpWMLParams.fontSize]
        : getDefFontSize();
    final TextScaler tScaler = textParams.p.useTextScaler
        ? MediaQuery.of(context).textScaler
        : TextScaler.noScaling;
    return tScaler.scale(fontSize);
  }

  /// get text style from parameters.
  TextStyle getStyle(BuildContext context) {
    return TextStyle(
      color: params.containsKey(EnumSpWMLParams.textColor)
          ? params[EnumSpWMLParams.textColor]
          : getDefTextColor(),
      backgroundColor: params.containsKey(EnumSpWMLParams.textBGColor)
          ? params[EnumSpWMLParams.textBGColor]
          : getDefTextBGColor(),
      fontSize: getFontSize(context),
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
}
