import 'package:flutter/material.dart';
import '../element_params/textfield_params.dart';
import '../util_parser.dart';
import '../element_params/element_params.dart';
import 'enum_spwml_element_param.dart';
import 'enum_spwml_element_type.dart';
import 'spwml_font_style.dart';
import 'spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-4-14 18:09:59
///
class TextFieldElement extends SpWMLElement {
  final TextFieldParamsWrapper tfParams;

  TextFieldElement(
      int serial,
      List<String> param,
      ElementParams text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.tfParams)
      : super(serial, EnumSpWMLElementType.textField, param, text, parentSerial,
            lineStart, lineEnd, style);

  const TextFieldElement.convert(
      int serial,
      Map<EnumSpWMLElementParam, dynamic> param,
      ElementParams text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.tfParams)
      : super.convert(serial, EnumSpWMLElementType.textField, param, text,
            parentSerial, lineStart, lineEnd, style);

  // initialize parameters
  TextFieldElement initParams() {
    tfParams.params.textAlign =
        param.containsKey(EnumSpWMLElementParam.textAlign)
            ? param[EnumSpWMLElementParam.textAlign]
            : TextAlign.left;
    tfParams.params.style = getStyle();
    tfParams.params.strutStyle = getStrutStyle();
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    return Container(
        width: param.containsKey(EnumSpWMLElementParam.width)
            ? param[EnumSpWMLElementParam.width]!
            : null,
        height: param.containsKey(EnumSpWMLElementParam.height)
            ? param[EnumSpWMLElementParam.height]!
            : null,
        margin: getMargin(),
        padding: getPadding(),
        child: TextField(
          key: key,
          controller: tfParams.params.controller,
          focusNode: tfParams.params.focusNode,
          decoration: tfParams.params.decoration,
          keyboardType: tfParams.params.keyboardType,
          textInputAction: tfParams.params.textInputAction,
          textCapitalization: tfParams.params.textCapitalization,
          style: tfParams.params.style,
          strutStyle: tfParams.params.strutStyle,
          textAlign: tfParams.params.textAlign,
          textAlignVertical: tfParams.params.textAlignVertical,
          textDirection: tfParams.params.textDirection,
          readOnly: tfParams.params.readOnly,
          toolbarOptions: tfParams.params.toolbarOptions,
          showCursor: tfParams.params.showCursor,
          autofocus: tfParams.params.autofocus,
          obscuringCharacter: tfParams.params.obscuringCharacter,
          obscureText: tfParams.params.obscureText,
          autocorrect: tfParams.params.autocorrect,
          smartDashesType: tfParams.params.smartDashesType,
          smartQuotesType: tfParams.params.smartQuotesType,
          enableSuggestions: tfParams.params.enableSuggestions,
          maxLines: tfParams.params.maxLines,
          minLines: tfParams.params.minLines,
          expands: tfParams.params.expands,
          maxLength: tfParams.params.maxLength,
          maxLengthEnforcement: tfParams.params.maxLengthEnforcement,
          onChanged: tfParams.params.onChanged,
          onEditingComplete: tfParams.params.onEditingComplete,
          onSubmitted: tfParams.params.onSubmitted,
          onAppPrivateCommand: tfParams.params.onAppPrivateCommand,
          inputFormatters: tfParams.params.inputFormatters,
          enabled: tfParams.params.enabled,
          cursorWidth: tfParams.params.cursorWidth,
          cursorHeight: tfParams.params.cursorHeight,
          cursorRadius: tfParams.params.cursorRadius,
          cursorColor: tfParams.params.cursorColor,
          selectionHeightStyle: tfParams.params.selectionHeightStyle,
          selectionWidthStyle: tfParams.params.selectionWidthStyle,
          keyboardAppearance: tfParams.params.keyboardAppearance,
          scrollPadding: tfParams.params.scrollPadding,
          dragStartBehavior: tfParams.params.dragStartBehavior,
          enableInteractiveSelection:
              tfParams.params.enableInteractiveSelection,
          selectionControls: tfParams.params.selectionControls,
          onTap: tfParams.params.onTap,
          mouseCursor: tfParams.params.mouseCursor,
          buildCounter: tfParams.params.buildCounter,
          scrollController: tfParams.params.scrollController,
          scrollPhysics: tfParams.params.scrollPhysics,
          autofillHints: tfParams.params.autofillHints,
          clipBehavior: tfParams.params.clipBehavior,
          restorationId: tfParams.params.restorationId,
          enableIMEPersonalizedLearning:
              tfParams.params.enableIMEPersonalizedLearning,
        ));
  }

  /// (en)Get shallow copy of this element parameter.
  ///
  /// (ja)このエレメントに現在設定されているパラメーターを取得します。
  TextFieldParams getTextFieldParams() {
    return tfParams.params;
  }

  /// (en)Set new parameter of this element.
  ///
  /// (ja)このエレメントのパラメーターを上書きします。
  /// * [params] : Parameters.
  void setTextFieldParams(TextFieldParams params) {
    tfParams.params = params;
  }

  /// get text strut style from parameters.
  StrutStyle getStrutStyle() {
    return StrutStyle(
        fontSize: param.containsKey(EnumSpWMLElementParam.fontSize)
            ? param[EnumSpWMLElementParam.fontSize]
            : getDefFontSize(),
        height: param.containsKey(EnumSpWMLElementParam.textHeight)
            ? param[EnumSpWMLElementParam.textHeight]
            : 1.0);
  }

  /// get text style from parameters.
  TextStyle getStyle() {
    return TextStyle(
      color: param.containsKey(EnumSpWMLElementParam.textColor)
          ? param[EnumSpWMLElementParam.textColor]
          : UtilParser.convertColor(style.textColor),
      backgroundColor: param.containsKey(EnumSpWMLElementParam.bgColor)
          ? param[EnumSpWMLElementParam.bgColor]
          : null,
      fontSize: param.containsKey(EnumSpWMLElementParam.fontSize)
          ? param[EnumSpWMLElementParam.fontSize]
          : getDefFontSize(),
      fontWeight: param.containsKey(EnumSpWMLElementParam.fontWeight)
          ? param[EnumSpWMLElementParam.fontWeight]
          : getDefFontWeight(),
      fontStyle: param.containsKey(EnumSpWMLElementParam.fontStyle)
          ? param[EnumSpWMLElementParam.fontStyle]
          : FontStyle.normal,
      letterSpacing: param.containsKey(EnumSpWMLElementParam.letterSpacing)
          ? param[EnumSpWMLElementParam.letterSpacing]
          : getDefFontLetterSpacing(),
      wordSpacing: param.containsKey(EnumSpWMLElementParam.wordSpacing)
          ? param[EnumSpWMLElementParam.wordSpacing]
          : null,
      decoration: param.containsKey(EnumSpWMLElementParam.textDeco)
          ? param[EnumSpWMLElementParam.textDeco]
          : TextDecoration.none,
      decorationStyle: param.containsKey(EnumSpWMLElementParam.textDecoStyle)
          ? param[EnumSpWMLElementParam.textDecoStyle]
          : TextDecorationStyle.solid,
      decorationColor: param.containsKey(EnumSpWMLElementParam.textDecoColor)
          ? param[EnumSpWMLElementParam.textDecoColor]
          : null,
      decorationThickness:
          param.containsKey(EnumSpWMLElementParam.textDecoThickness)
              ? param[EnumSpWMLElementParam.textDecoThickness]
              : null,
      fontFamily: param.containsKey(EnumSpWMLElementParam.fontName)
          ? param[EnumSpWMLElementParam.fontName]
          : null,
      height: getTextHeight(),
    );
  }
}
