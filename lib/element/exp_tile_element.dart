import 'package:flutter/material.dart';
import 'element_child.dart';
import '../element_params/element_params.dart';
import 'enum_spwml_element_param.dart';
import 'enum_spwml_element_type.dart';
import 'spwml_font_style.dart';
import 'spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-31 17:58:41
///
class ExpTileElement extends SpWMLElement {
  final StructureElementChildren children;
  final BoolCallbackParams callback;
  final WidgetParams subtitle;

  ExpTileElement(
      int serial,
      List<String> param,
      ElementParams text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children,
      this.callback,
      this.subtitle)
      : super(serial, EnumSpWMLElementType.expTile, param, text, parentSerial,
            lineStart, lineEnd, style);

  const ExpTileElement.convert(
      int serial,
      Map<EnumSpWMLElementParam, dynamic> param,
      ElementParams text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children,
      this.callback,
      this.subtitle)
      : super.convert(serial, EnumSpWMLElementType.expTile, param, text,
            parentSerial, lineStart, lineEnd, style);

  @override
  Widget getWidget(BuildContext context) {
    final bool isContainIcon = param.containsKey(EnumSpWMLElementParam.iconNum);
    return ConstrainedBox(
        constraints: getConstraints(),
        child: Container(
          width: param.containsKey(EnumSpWMLElementParam.width)
              ? param[EnumSpWMLElementParam.width]!
              : null,
          height: param.containsKey(EnumSpWMLElementParam.height)
              ? param[EnumSpWMLElementParam.height]!
              : null,
          margin: getMargin(),
          padding: getPadding(),
          color: param.containsKey(EnumSpWMLElementParam.bgColor)
              ? param[EnumSpWMLElementParam.bgColor]
              : null,
          child: ExpansionTile(
            onExpansionChanged: callback.f,
            leading: isContainIcon
                ? Icon(
                    (param[EnumSpWMLElementParam.iconNum]! as Icon).icon,
                    size: param.containsKey(EnumSpWMLElementParam.iconSize)
                        ? param[EnumSpWMLElementParam.iconSize]
                        : null,
                    color: param.containsKey(EnumSpWMLElementParam.iconColor)
                        ? param[EnumSpWMLElementParam.iconColor]
                        : null,
                  )
                : null,
            title: Text(
              text.s,
              textScaleFactor: MediaQuery.of(context).textScaleFactor,
              style: getStyle(context),
              strutStyle: getStrutStyle(),
              textAlign: param.containsKey(EnumSpWMLElementParam.textAlign)
                  ? param[EnumSpWMLElementParam.textAlign]
                  : TextAlign.left,
              maxLines: null,
            ),
            subtitle: subtitle.w,
            children: children.getChildren(),
          ),
        ));
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

  /// (en)Set new text of this element.
  ///
  /// (ja)このエレメントの新しいテキストを設定します。
  /// * [newText] 新しいテキスト.
  void setText(String newText) {
    text.s = newText;
  }

  /// (en)Set subtitle of this element.
  ///
  /// (ja)このエレメントにサブタイトルを設定します。
  /// * [w] サブタイトル.
  void setSubtitle(Widget? w) {
    subtitle.w = w;
  }

  /// get text style from parameters.
  TextStyle getStyle(BuildContext context) {
    return TextStyle(
      color: param.containsKey(EnumSpWMLElementParam.textColor)
          ? param[EnumSpWMLElementParam.textColor]
          : null,
      backgroundColor: param.containsKey(EnumSpWMLElementParam.bgColor)
          ? param[EnumSpWMLElementParam.bgColor]
          : null,
      fontSize: param.containsKey(EnumSpWMLElementParam.fontSize)
          ? param[EnumSpWMLElementParam.fontSize]
          : null,
      fontWeight: param.containsKey(EnumSpWMLElementParam.fontWeight)
          ? param[EnumSpWMLElementParam.fontWeight]
          : null,
      fontStyle: param.containsKey(EnumSpWMLElementParam.fontStyle)
          ? param[EnumSpWMLElementParam.fontStyle]
          : null,
      letterSpacing: param.containsKey(EnumSpWMLElementParam.letterSpacing)
          ? param[EnumSpWMLElementParam.letterSpacing]
          : null,
      wordSpacing: param.containsKey(EnumSpWMLElementParam.wordSpacing)
          ? param[EnumSpWMLElementParam.wordSpacing]
          : null,
      decoration: param.containsKey(EnumSpWMLElementParam.textDeco)
          ? param[EnumSpWMLElementParam.textDeco]
          : null,
      decorationStyle: param.containsKey(EnumSpWMLElementParam.textDecoStyle)
          ? param[EnumSpWMLElementParam.textDecoStyle]
          : null,
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
