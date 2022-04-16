import 'package:flutter/material.dart';
import '../util_parser.dart';
import 'element_child.dart';
import '../element_params/element_params.dart';
import 'enum_btn_element_type.dart';
import 'enum_spwml_element_param.dart';
import 'enum_spwml_element_type.dart';
import 'spwml_font_style.dart';
import 'spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-02-09 20:12:30
///
class BtnElement extends SpWMLElement {
  final BlockElementChild child;
  final BtnElementParams btnParam;

  BtnElement(
      int serial,
      List<String> param,
      ElementParams text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.child,
      this.btnParam)
      : super(serial, EnumSpWMLElementType.btn, param, text, parentSerial,
            lineStart, lineEnd, style);

  const BtnElement.convert(
      int serial,
      Map<EnumSpWMLElementParam, dynamic> param,
      ElementParams text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.child,
      this.btnParam)
      : super.convert(serial, EnumSpWMLElementType.btn, param, text,
            parentSerial, lineStart, lineEnd, style);

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
        child: _getBtn(context));
  }

  /// get button of selected type.
  Widget _getBtn(BuildContext context) {
    final bool isContainBtnType = param.containsKey(EnumSpWMLElementParam.type);
    final bool isContainIcon = param.containsKey(EnumSpWMLElementParam.iconNum);
    if (isContainBtnType) {
      final EnumBtnElementType bType = param[EnumSpWMLElementParam.type]!;
      if (bType == EnumBtnElementType.text) {
        if (isContainIcon) {
          return TextButton.icon(
              onPressed: btnParam.f,
              icon: Icon(
                (param[EnumSpWMLElementParam.iconNum]! as Icon).icon,
                size: param.containsKey(EnumSpWMLElementParam.iconSize)
                    ? param[EnumSpWMLElementParam.iconSize]
                    : null,
                color: param.containsKey(EnumSpWMLElementParam.iconColor)
                    ? param[EnumSpWMLElementParam.iconColor]
                    : null,
              ),
              label: _getText(context),
              style: getBtnStyle(bType));
        } else {
          return TextButton(
              onPressed: btnParam.f,
              child: _getText(context),
              style: getBtnStyle(bType));
        }
      } else if (bType == EnumBtnElementType.outlined) {
        if (isContainIcon) {
          return OutlinedButton.icon(
              onPressed: btnParam.f,
              icon: Icon(
                (param[EnumSpWMLElementParam.iconNum]! as Icon).icon,
                size: param.containsKey(EnumSpWMLElementParam.iconSize)
                    ? param[EnumSpWMLElementParam.iconSize]
                    : null,
                color: param.containsKey(EnumSpWMLElementParam.iconColor)
                    ? param[EnumSpWMLElementParam.iconColor]
                    : null,
              ),
              label: _getText(context),
              style: getBtnStyle(bType));
        } else {
          return OutlinedButton(
              onPressed: btnParam.f,
              child: _getText(context),
              style: getBtnStyle(bType));
        }
      } else if (bType == EnumBtnElementType.elevated) {
        if (isContainIcon) {
          return ElevatedButton.icon(
              onPressed: btnParam.f,
              icon: Icon(
                (param[EnumSpWMLElementParam.iconNum]! as Icon).icon,
                size: param.containsKey(EnumSpWMLElementParam.iconSize)
                    ? param[EnumSpWMLElementParam.iconSize]
                    : null,
                color: param.containsKey(EnumSpWMLElementParam.iconColor)
                    ? param[EnumSpWMLElementParam.iconColor]
                    : null,
              ),
              label: _getText(context),
              style: getBtnStyle(bType));
        } else {
          return ElevatedButton(
              onPressed: btnParam.f,
              child: _getText(context),
              style: getBtnStyle(bType));
        }
      } else if (bType == EnumBtnElementType.icon) {
        if (isContainIcon) {
          return IconButton(
            icon: param[EnumSpWMLElementParam.iconNum]!,
            onPressed: btnParam.f,
            iconSize: param.containsKey(EnumSpWMLElementParam.iconSize)
                ? param[EnumSpWMLElementParam.iconSize]!
                : 24,
            color: param.containsKey(EnumSpWMLElementParam.iconColor)
                ? param[EnumSpWMLElementParam.iconColor]
                : null,
            splashRadius: param.containsKey(EnumSpWMLElementParam.splashRadius)
                ? param[EnumSpWMLElementParam.splashRadius]
                : null,
          );
        } else {
          return TextButton(
              onPressed: btnParam.f,
              child: const Text("iconNum parameter not found"),
              style: getBtnStyle(EnumBtnElementType.text));
        }
      } else {
        // block type
        return InkWell(
          onTap: btnParam.f,
          child: child.child,
        );
      }
    } else {
      // If type is null, return text button.
      return TextButton(
          onPressed: btnParam.f,
          child: _getText(context),
          style: getBtnStyle(EnumBtnElementType.text));
    }
  }

  /// Get text widget
  Widget _getText(BuildContext context) {
    return Text(
      text.s,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      style: getStyle(),
      strutStyle: getStrutStyle(),
      textAlign: param.containsKey(EnumSpWMLElementParam.textAlign)
          ? param[EnumSpWMLElementParam.textAlign]
          : TextAlign.left,
      maxLines: null,
    );
  }

  /// (en)Set new text of this element.
  ///
  /// (ja)このエレメントの新しいテキストを設定します。
  /// * [newText] : 新しいテキスト.
  void setText(String newText) {
    text.s = newText;
  }

  /// (en)Set this button callback.
  ///
  /// (ja)このボタンのクリック時動作を設定します。
  /// * [callback] : Button callback.
  void setBtnCallback(void Function()? callback) {
    btnParam.f = callback;
  }

  /// (en)Set this button style.
  ///
  /// (ja)このボタンのスタイルを設定します。
  /// * [style] : Button callback.
  void setBtnStyle(ButtonStyle style) {
    btnParam.btnStyle = style;
  }

  /// Get button style from parameters.
  ButtonStyle? getBtnStyle(EnumBtnElementType bType) {
    if (btnParam.btnStyle != null) {
      return btnParam.btnStyle;
    } else {
      if (bType == EnumBtnElementType.text) {
        return TextButton.styleFrom(
            primary: param.containsKey(EnumSpWMLElementParam.color)
                ? param[EnumSpWMLElementParam.color]
                : null,
            backgroundColor: param.containsKey(EnumSpWMLElementParam.bgColor)
                ? param[EnumSpWMLElementParam.bgColor]
                : null,
            shape: _getShape());
      } else if (bType == EnumBtnElementType.outlined) {
        return OutlinedButton.styleFrom(
            primary: param.containsKey(EnumSpWMLElementParam.color)
                ? param[EnumSpWMLElementParam.color]
                : null,
            backgroundColor: param.containsKey(EnumSpWMLElementParam.bgColor)
                ? param[EnumSpWMLElementParam.bgColor]
                : null,
            side: param.containsKey(EnumSpWMLElementParam.outlineColor)
                ? BorderSide(
                    width: _getBorderWidth(),
                    color: param[EnumSpWMLElementParam.outlineColor],
                    style: BorderStyle.solid)
                : null,
            shape: _getShape());
      } else if (bType == EnumBtnElementType.elevated) {
        return ElevatedButton.styleFrom(
            primary: param.containsKey(EnumSpWMLElementParam.color)
                ? param[EnumSpWMLElementParam.color]
                : null,
            shape: _getShape());
      } else {
        return null;
      }
    }
  }

  /// Get button shape
  OutlinedBorder? _getShape() {
    if (param.containsKey(EnumSpWMLElementParam.shape)) {
      if (param.containsKey(EnumSpWMLElementParam.borderRadius)) {
        if (param[EnumSpWMLElementParam.shape] is RoundedRectangleBorder) {
          return (param[EnumSpWMLElementParam.shape] as RoundedRectangleBorder)
              .copyWith(
                  borderRadius: BorderRadius.circular(
                      param[EnumSpWMLElementParam.borderRadius]));
        } else if (param[EnumSpWMLElementParam.shape]
            is BeveledRectangleBorder) {
          return (param[EnumSpWMLElementParam.shape] as BeveledRectangleBorder)
              .copyWith(
                  borderRadius: BorderRadius.circular(
                      param[EnumSpWMLElementParam.borderRadius]));
        } else {
          return param[EnumSpWMLElementParam.shape];
        }
      } else {
        return param[EnumSpWMLElementParam.shape];
      }
    } else {
      return null;
    }
  }

  /// Get button border width
  double _getBorderWidth() {
    if (param.containsKey(EnumSpWMLElementParam.borderWidth)) {
      return param[EnumSpWMLElementParam.borderWidth];
    } else {
      return 1.0;
    }
  }

  /// Get text strut style from parameters.
  StrutStyle getStrutStyle() {
    return StrutStyle(
        fontSize: param.containsKey(EnumSpWMLElementParam.fontSize)
            ? param[EnumSpWMLElementParam.fontSize]
            : getDefFontSize(),
        height: param.containsKey(EnumSpWMLElementParam.textHeight)
            ? param[EnumSpWMLElementParam.textHeight]
            : 1.0);
  }

  /// Get text style from parameters.
  /// * [context] : BuildContext.
  TextStyle getStyle() {
    return TextStyle(
      color: param.containsKey(EnumSpWMLElementParam.textColor)
          ? param[EnumSpWMLElementParam.textColor]
          : UtilParser.convertColor(style.textColor),
      // Must not use this in btn.
      // backgroundColor: param.containsKey(EnumSpWMLElementParam.bgColor)
      //     ? param[EnumSpWMLElementParam.bgColor]
      //     : null,
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
