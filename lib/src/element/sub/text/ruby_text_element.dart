import 'package:flutter/material.dart';
import '../../../element_params/spwml_info.dart';
import 'text_element.dart';
import '../../../element_params/sub/text/ruby_text_params.dart';
import '../../../element_params/sub/text/text_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../style/spwml_font_style.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-08-01 20:51:32
///
class RubyTextElement extends TextElement {
  final RubyTextParamsWrapper rubyParams;

  ///
  /// * [serial] : Array Index.
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
  RubyTextElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      TextParamsWrapper textParams,
      this.rubyParams)
      : super(serial, EnumSpWMLElementType.ruby, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, textParams);

  /// Get this class name.
  @override
  String getClassName() {
    return "RubyTextElement";
  }

  /// Initialize the parameters.
  @override
  RubyTextElement initParams() {
    super.initParams();
    // ここからルビの設定
    rubyParams.p.text = params.containsKey(EnumSpWMLParams.rubyText)
        ? params[EnumSpWMLParams.rubyText]
        : RubyTextParams.defText;
    rubyParams.p.size = params.containsKey(EnumSpWMLParams.rubySize)
        ? params[EnumSpWMLParams.rubySize]
        : RubyTextParams.defSize;
    rubyParams.p.letterSpacing =
        params.containsKey(EnumSpWMLParams.rubyLetterSpacing)
            ? params[EnumSpWMLParams.rubyLetterSpacing]
            : getDefFontLetterSpacing();
    rubyParams.p.margin = params.containsKey(EnumSpWMLParams.rubyMargin)
        ? params[EnumSpWMLParams.rubyMargin]
        : RubyTextParams.defMargin;
    rubyParams.p.isSelectable =
        params.containsKey(EnumSpWMLParams.isRubySelectable)
            ? params[EnumSpWMLParams.isRubySelectable]
            : false;
    if (rubyParams.p.isSelectable) {
      rubyParams.p.selectableTextParams = SelectableTextParams();
    }
    return this;
  }

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    return Column(
      key: textParams.p.key,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        getRubyWidget(context),
        SizedBox(height: rubyParams.p.margin),
        getTextWidget(context)
      ],
    );
  }

  /// Get ruby text widget.
  Widget getRubyWidget(BuildContext context) {
    return rubyParams.p.isSelectable
        ? SelectableText(
            rubyParams.p.text,
            key: rubyParams.p.selectableTextParams!.key,
            focusNode: rubyParams.p.selectableTextParams!.focusNode,
            style: rubyParams.p.selectableTextParams!.style ?? getRubyStyle(),
            strutStyle: rubyParams.p.selectableTextParams!.strutStyle ??
                getRubyStrutStyle(),
            textAlign:
                rubyParams.p.selectableTextParams!.textAlign ?? getRubyAlign(),
            textDirection: rubyParams.p.selectableTextParams!.textDirection,
            textScaler: rubyParams.p.selectableTextParams!.textScaler ??
                MediaQuery.of(context).textScaler,
            showCursor: rubyParams.p.selectableTextParams!.showCursor,
            autofocus: rubyParams.p.selectableTextParams!.autofocus,
            minLines: rubyParams.p.selectableTextParams!.minLines,
            maxLines: rubyParams.p.selectableTextParams!.maxLines,
            cursorWidth: rubyParams.p.selectableTextParams!.cursorWidth,
            cursorHeight: rubyParams.p.selectableTextParams!.cursorHeight,
            cursorRadius: rubyParams.p.selectableTextParams!.cursorRadius,
            cursorColor: rubyParams.p.selectableTextParams!.cursorColor,
            selectionHeightStyle:
                rubyParams.p.selectableTextParams!.selectionHeightStyle,
            selectionWidthStyle:
                rubyParams.p.selectableTextParams!.selectionWidthStyle,
            dragStartBehavior:
                rubyParams.p.selectableTextParams!.dragStartBehavior,
            enableInteractiveSelection:
                rubyParams.p.selectableTextParams!.enableInteractiveSelection,
            selectionControls:
                rubyParams.p.selectableTextParams!.selectionControls,
            onTap: rubyParams.p.selectableTextParams!.onTap,
            scrollPhysics: rubyParams.p.selectableTextParams!.scrollPhysics,
            semanticsLabel: rubyParams.p.selectableTextParams!.semanticsLabel,
            textHeightBehavior:
                rubyParams.p.selectableTextParams!.textHeightBehavior,
            textWidthBasis: rubyParams.p.selectableTextParams!.textWidthBasis,
            onSelectionChanged:
                rubyParams.p.selectableTextParams!.onSelectionChanged,
            contextMenuBuilder:
                rubyParams.p.selectableTextParams!.contextMenuBuilder,
            magnifierConfiguration:
                rubyParams.p.selectableTextParams!.magnifierConfiguration,
          )
        : getRubyText(context);
  }

  /// Get ruby text alignment.
  TextAlign getRubyAlign() {
    return params.containsKey(EnumSpWMLParams.rubyAlign)
        ? params[EnumSpWMLParams.rubyAlign]
        : TextAlign.left;
  }

  /// get ruby font size.
  double _rubyFontSize() {
    return (params.containsKey(EnumSpWMLParams.fontSize)
            ? params[EnumSpWMLParams.fontSize]
            : getDefFontSize()) *
        rubyParams.p.size;
  }

  /// get ruby text strut style from parameters.
  StrutStyle getRubyStrutStyle() {
    return StrutStyle(
        fontSize: _rubyFontSize(),
        height: params.containsKey(EnumSpWMLParams.rubyHeight)
            ? params[EnumSpWMLParams.rubyHeight]
            : 1.0);
  }

  /// get ruby text strut style from parameters.
  TextStyle getRubyStyle() {
    return TextStyle(
      color: params.containsKey(EnumSpWMLParams.rubyColor)
          ? params[EnumSpWMLParams.rubyColor]
          : getDefTextColor(),
      backgroundColor: params.containsKey(EnumSpWMLParams.rubyBGColor)
          ? params[EnumSpWMLParams.rubyBGColor]
          : getDefTextBGColor(),
      fontSize: _rubyFontSize(),
      fontWeight: params.containsKey(EnumSpWMLParams.rubyFontWeight)
          ? params[EnumSpWMLParams.rubyFontWeight]
          : getDefFontWeight(),
      fontStyle: params.containsKey(EnumSpWMLParams.rubyFontStyle)
          ? params[EnumSpWMLParams.rubyFontStyle]
          : getDefFontStyle(),
      letterSpacing: rubyParams.p.letterSpacing,
      wordSpacing: params.containsKey(EnumSpWMLParams.rubyWordSpacing)
          ? params[EnumSpWMLParams.rubyWordSpacing]
          : getDefWordSpacing(),
      decoration: params.containsKey(EnumSpWMLParams.rubyDeco)
          ? params[EnumSpWMLParams.rubyDeco]
          : getDefTextDeco(),
      decorationStyle: params.containsKey(EnumSpWMLParams.rubyDecoStyle)
          ? params[EnumSpWMLParams.rubyDecoStyle]
          : getDefDecorationStyle(),
      decorationColor: params.containsKey(EnumSpWMLParams.rubyDecoColor)
          ? params[EnumSpWMLParams.rubyDecoColor]
          : getDefTextDecoColor(),
      decorationThickness: params.containsKey(EnumSpWMLParams.rubyDecoThickness)
          ? params[EnumSpWMLParams.rubyDecoThickness]
          : getDefTextDecoThickness(),
      fontFamily: params.containsKey(EnumSpWMLParams.rubyFontName)
          ? params[EnumSpWMLParams.rubyFontName]
          : getDefFontFamily(),
      height: getLineHeight(),
    );
  }

  /// Get ruby text widget
  Widget getRubyText(BuildContext context) {
    return Text(
      rubyParams.p.text,
      style: rubyParams.p.style ?? getRubyStyle(),
      strutStyle: rubyParams.p.strutStyle ?? getRubyStrutStyle(),
      textAlign: rubyParams.p.textAlign ?? getRubyAlign(),
      textDirection: rubyParams.p.textDirection,
      locale: rubyParams.p.locale,
      softWrap: rubyParams.p.softWrap,
      textScaler: rubyParams.p.textScaler ?? MediaQuery.of(context).textScaler,
      maxLines: rubyParams.p.maxLines,
      semanticsLabel: rubyParams.p.semanticsLabel,
      textWidthBasis: rubyParams.p.textWidthBasis,
      textHeightBehavior: rubyParams.p.textHeightBehavior,
    );
  }
}
