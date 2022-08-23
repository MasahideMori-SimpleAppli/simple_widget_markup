import 'package:flutter/material.dart';

import '../../../element_params/element_child.dart';
import '../../../element_params/sub/button/btn_params.dart';
import '../../../element_params/sub/text/text_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_btn_type.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../spwml_exception.dart';
import '../../../style/spwml_font_style.dart';
import '../text/text_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-02-09 20:12:30
///
class BtnElement extends TextElement {
  final BlockElementChild child;
  final BtnParamsWrapper elParams;

  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [child] : This element child.
  /// * [textParams] : Parent class parameters.
  /// * [elParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  BtnElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.child,
      TextParamsWrapper textParams,
      this.elParams)
      : super(serial, EnumSpWMLElementType.btn, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, textParams);

  @override
  BtnElement initParams() {
    super.initParams();
    elParams.p.type = params.containsKey(EnumSpWMLParams.type)
        ? params[EnumSpWMLParams.type]!
        : EnumBtnType.text;
    elParams.p.isUseIcon = params.containsKey(EnumSpWMLParams.iconNum);
    if (elParams.p.type == EnumBtnType.icon) {
      if (!elParams.p.isUseIcon) {
        throw SpWMLException(
            EnumSpWMLExceptionType.paramException, lineStart, lineEnd);
      } else {
        IconBtnParams p = IconBtnParams();
        p.icon = _getIcon(true);
        p.iconSize = params.containsKey(EnumSpWMLParams.iconSize)
            ? params[EnumSpWMLParams.iconSize]!
            : 24;
        p.color = params.containsKey(EnumSpWMLParams.iconColor)
            ? params[EnumSpWMLParams.iconColor]
            : null;
        p.splashRadius = params.containsKey(EnumSpWMLParams.splashRadius)
            ? params[EnumSpWMLParams.splashRadius]
            : null;
        elParams.p.iconBtnParams = p;
      }
    } else if (elParams.p.type == EnumBtnType.block) {
      if (elParams.p.isUseIcon) {
        throw SpWMLException(
            EnumSpWMLExceptionType.paramException, lineStart, lineEnd);
      } else {
        InkWellParams p = InkWellParams();
        elParams.p.inkWellBtnParams = p;
      }
    } else {
      NormalBtnParams p = NormalBtnParams();
      p.icon = elParams.p.isUseIcon ? _getIcon(false) : null;
      p.style = _getBtnStyle(elParams.p.type!);
      elParams.p.normalBtnParams = p;
    }
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    return _getBtn(context);
  }

  /// get converted icon widget.
  Widget _getIcon(bool onlyIconData) {
    if (onlyIconData) {
      return Icon(params[EnumSpWMLParams.iconNum]);
    } else {
      return Icon(
        params[EnumSpWMLParams.iconNum]!,
        size: params.containsKey(EnumSpWMLParams.iconSize)
            ? params[EnumSpWMLParams.iconSize]
            : null,
        color: params.containsKey(EnumSpWMLParams.iconColor)
            ? params[EnumSpWMLParams.iconColor]
            : null,
      );
    }
  }

  /// get button of selected type.
  Widget _getBtn(BuildContext context) {
    if (elParams.p.type == EnumBtnType.text) {
      if (elParams.p.isUseIcon) {
        return TextButton.icon(
            key: elParams.p.normalBtnParams!.key,
            onPressed: elParams.p.normalBtnParams!.onPressed,
            onLongPress: elParams.p.normalBtnParams!.onLongPress,
            onHover: elParams.p.normalBtnParams!.onHover,
            onFocusChange: elParams.p.normalBtnParams!.onFocusChange,
            focusNode: elParams.p.normalBtnParams!.focusNode,
            autofocus: elParams.p.normalBtnParams!.autofocus,
            clipBehavior: elParams.p.normalBtnParams!.clipBehavior,
            style: elParams.p.normalBtnParams!.style,
            icon: elParams.p.normalBtnParams!.icon!,
            label: elParams.p.normalBtnParams!.label ?? getText(context));
      } else {
        return TextButton(
            key: elParams.p.normalBtnParams!.key,
            onPressed: elParams.p.normalBtnParams!.onPressed,
            onLongPress: elParams.p.normalBtnParams!.onLongPress,
            onHover: elParams.p.normalBtnParams!.onHover,
            onFocusChange: elParams.p.normalBtnParams!.onFocusChange,
            style: elParams.p.normalBtnParams!.style,
            focusNode: elParams.p.normalBtnParams!.focusNode,
            autofocus: elParams.p.normalBtnParams!.autofocus ?? false,
            clipBehavior: elParams.p.normalBtnParams!.clipBehavior ?? Clip.none,
            child: elParams.p.normalBtnParams!.label ?? getText(context));
      }
    } else if (elParams.p.type == EnumBtnType.outlined) {
      if (elParams.p.isUseIcon) {
        return OutlinedButton.icon(
            key: elParams.p.normalBtnParams!.key,
            onPressed: elParams.p.normalBtnParams!.onPressed,
            onLongPress: elParams.p.normalBtnParams!.onLongPress,
            style: elParams.p.normalBtnParams!.style,
            focusNode: elParams.p.normalBtnParams!.focusNode,
            autofocus: elParams.p.normalBtnParams!.autofocus,
            clipBehavior: elParams.p.normalBtnParams!.clipBehavior,
            icon: elParams.p.normalBtnParams!.icon!,
            label: elParams.p.normalBtnParams!.label ?? getText(context));
      } else {
        return OutlinedButton(
            key: elParams.p.normalBtnParams!.key,
            onPressed: elParams.p.normalBtnParams!.onPressed,
            onLongPress: elParams.p.normalBtnParams!.onLongPress,
            style: elParams.p.normalBtnParams!.style,
            focusNode: elParams.p.normalBtnParams!.focusNode,
            autofocus: elParams.p.normalBtnParams!.autofocus ?? false,
            clipBehavior: elParams.p.normalBtnParams!.clipBehavior ?? Clip.none,
            child: elParams.p.normalBtnParams!.label ?? getText(context));
      }
    } else if (elParams.p.type == EnumBtnType.elevated) {
      if (elParams.p.isUseIcon) {
        return ElevatedButton.icon(
            key: elParams.p.normalBtnParams!.key,
            onPressed: elParams.p.normalBtnParams!.onPressed,
            onLongPress: elParams.p.normalBtnParams!.onLongPress,
            onHover: elParams.p.normalBtnParams!.onHover,
            onFocusChange: elParams.p.normalBtnParams!.onFocusChange,
            focusNode: elParams.p.normalBtnParams!.focusNode,
            autofocus: elParams.p.normalBtnParams!.autofocus,
            clipBehavior: elParams.p.normalBtnParams!.clipBehavior,
            style: elParams.p.normalBtnParams!.style,
            icon: elParams.p.normalBtnParams!.icon!,
            label: elParams.p.normalBtnParams!.label ?? getText(context));
      } else {
        return ElevatedButton(
            key: elParams.p.normalBtnParams!.key,
            onPressed: elParams.p.normalBtnParams!.onPressed,
            onLongPress: elParams.p.normalBtnParams!.onLongPress,
            onHover: elParams.p.normalBtnParams!.onHover,
            onFocusChange: elParams.p.normalBtnParams!.onFocusChange,
            style: elParams.p.normalBtnParams!.style,
            focusNode: elParams.p.normalBtnParams!.focusNode,
            autofocus: elParams.p.normalBtnParams!.autofocus ?? false,
            clipBehavior: elParams.p.normalBtnParams!.clipBehavior ?? Clip.none,
            child: elParams.p.normalBtnParams!.label ?? getText(context));
      }
    } else if (elParams.p.type == EnumBtnType.icon) {
      return IconButton(
        key: elParams.p.iconBtnParams!.key,
        iconSize: elParams.p.iconBtnParams!.iconSize,
        visualDensity: elParams.p.iconBtnParams!.visualDensity,
        padding: elParams.p.iconBtnParams!.padding,
        alignment: elParams.p.iconBtnParams!.alignment,
        splashRadius: elParams.p.iconBtnParams!.splashRadius,
        color: elParams.p.iconBtnParams!.color,
        focusColor: elParams.p.iconBtnParams!.focusColor,
        hoverColor: elParams.p.iconBtnParams!.hoverColor,
        highlightColor: elParams.p.iconBtnParams!.highlightColor,
        splashColor: elParams.p.iconBtnParams!.splashColor,
        disabledColor: elParams.p.iconBtnParams!.disabledColor,
        onPressed: elParams.p.iconBtnParams!.onPressed,
        mouseCursor: elParams.p.iconBtnParams!.mouseCursor,
        focusNode: elParams.p.iconBtnParams!.focusNode,
        autofocus: elParams.p.iconBtnParams!.autofocus,
        tooltip: elParams.p.iconBtnParams!.tooltip,
        enableFeedback: elParams.p.iconBtnParams!.enableFeedback,
        constraints: elParams.p.iconBtnParams!.constraints,
        icon: elParams.p.iconBtnParams!.icon!,
      );
    } else {
      // block type
      return InkWell(
        key: elParams.p.inkWellBtnParams!.key,
        child: child.child,
        onTap: elParams.p.inkWellBtnParams!.onTap,
        onDoubleTap: elParams.p.inkWellBtnParams!.onDoubleTap,
        onLongPress: elParams.p.inkWellBtnParams!.onLongPress,
        onTapDown: elParams.p.inkWellBtnParams!.onTapDown,
        onTapUp: elParams.p.inkWellBtnParams!.onTapUp,
        onTapCancel: elParams.p.inkWellBtnParams!.onTapCancel,
        onHighlightChanged: elParams.p.inkWellBtnParams!.onHighlightChanged,
        onHover: elParams.p.inkWellBtnParams!.onHover,
        mouseCursor: elParams.p.inkWellBtnParams!.mouseCursor,
        focusColor: elParams.p.inkWellBtnParams!.focusColor,
        hoverColor: elParams.p.inkWellBtnParams!.hoverColor,
        highlightColor: elParams.p.inkWellBtnParams!.highlightColor,
        overlayColor: elParams.p.inkWellBtnParams!.overlayColor,
        splashColor: elParams.p.inkWellBtnParams!.splashColor,
        splashFactory: elParams.p.inkWellBtnParams!.splashFactory,
        radius: elParams.p.inkWellBtnParams!.radius,
        borderRadius: elParams.p.inkWellBtnParams!.borderRadius,
        customBorder: elParams.p.inkWellBtnParams!.customBorder ?? getShape(),
        enableFeedback: elParams.p.inkWellBtnParams!.enableFeedback,
        excludeFromSemantics: elParams.p.inkWellBtnParams!.excludeFromSemantics,
        focusNode: elParams.p.inkWellBtnParams!.focusNode,
        canRequestFocus: elParams.p.inkWellBtnParams!.canRequestFocus,
        onFocusChange: elParams.p.inkWellBtnParams!.onFocusChange,
        autofocus: elParams.p.inkWellBtnParams!.autofocus,
      );
    }
  }

  /// (en)Set this button callback.
  ///
  /// (ja)このボタンのクリック時動作を設定します。
  /// * [callback] : Button callback.
  void setBtnCallback(void Function()? callback) {
    if (elParams.p.type == EnumBtnType.icon) {
      elParams.p.iconBtnParams!.onPressed = callback;
    } else if (elParams.p.type == EnumBtnType.block) {
      elParams.p.inkWellBtnParams!.onTap = callback;
    } else {
      elParams.p.normalBtnParams!.onPressed = callback;
    }
  }

  /// Get button style from parameters.
  ButtonStyle? _getBtnStyle(EnumBtnType bType) {
    if (bType == EnumBtnType.text) {
      return TextButton.styleFrom(
          primary: params.containsKey(EnumSpWMLParams.color)
              ? params[EnumSpWMLParams.color]
              : null,
          backgroundColor: params.containsKey(EnumSpWMLParams.btnBGColor)
              ? params[EnumSpWMLParams.btnBGColor]
              : null,
          shape: getShape());
    } else if (bType == EnumBtnType.outlined) {
      return OutlinedButton.styleFrom(
          primary: params.containsKey(EnumSpWMLParams.color)
              ? params[EnumSpWMLParams.color]
              : null,
          backgroundColor: params.containsKey(EnumSpWMLParams.btnBGColor)
              ? params[EnumSpWMLParams.btnBGColor]
              : null,
          side: getBorderSide(),
          shape: getShape());
    } else if (bType == EnumBtnType.elevated) {
      return ElevatedButton.styleFrom(
          primary: params.containsKey(EnumSpWMLParams.color)
              ? params[EnumSpWMLParams.color]
              : null,
          shape: getShape());
    } else {
      return null;
    }
  }
}
