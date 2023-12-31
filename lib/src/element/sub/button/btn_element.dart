import 'package:flutter/material.dart';

import '../../../element_params/element_child.dart';
import '../../../element_params/spwml_info.dart';
import '../../../element_params/sub/button/btn_params.dart';
import '../../../element_params/sub/text/text_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_btn_type.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../spwml_exception.dart';
import '../../../style/spwml_font_style.dart';
import '../../super/single_child_text_element.dart';

///
/// (en) The btn.
///
/// (ja) btnの実装。
///
class BtnElement extends SingleChildTextElement {
  final BtnParamsWrapper elParams;

  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [info] : SpWML info.
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
      SpWMLInfo? info,
      BlockElementChild child,
      TextParamsWrapper textParams,
      this.elParams)
      : super(serial, EnumSpWMLElementType.btn, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, child, textParams);

  /// Get this class name.
  @override
  String getClassName() {
    return "BtnElement";
  }

  /// Initialize the parameters.
  @override
  BtnElement initParams() {
    super.initParams();
    elParams.p.isEnabled = params.containsKey(EnumSpWMLParams.isEnabled)
        ? params[EnumSpWMLParams.isEnabled]
        : true;
    elParams.p.type = params.containsKey(EnumSpWMLParams.type)
        ? params[EnumSpWMLParams.type]!
        : EnumBtnType.text;
    elParams.p.isUseIcon = params.containsKey(EnumSpWMLParams.iconNum);
    if (elParams.p.type == EnumBtnType.icon ||
        elParams.p.type == EnumBtnType.iconFilled ||
        elParams.p.type == EnumBtnType.iconFilledTonal ||
        elParams.p.type == EnumBtnType.iconOutlined) {
      if (!elParams.p.isUseIcon) {
        throw SpWMLException(
            EnumSpWMLExceptionType.paramException, lineStart, lineEnd, info);
      } else {
        IconBtnParams p = IconBtnParams();
        p.icon = getIcon(true);
        p.iconSize = params.containsKey(EnumSpWMLParams.iconSize)
            ? params[EnumSpWMLParams.iconSize]!
            : 24;
        p.color = params.containsKey(EnumSpWMLParams.iconColor)
            ? params[EnumSpWMLParams.iconColor]
            : null;
        p.splashRadius = params.containsKey(EnumSpWMLParams.splashRadius)
            ? params[EnumSpWMLParams.splashRadius]
            : null;
        p.isSelected = params.containsKey(EnumSpWMLParams.isSelected)
            ? params[EnumSpWMLParams.isSelected]
            : false;
        p.selectedIcon = _getSelectedIcon(true);
        elParams.p.iconBtnParams = p;
      }
    } else if (elParams.p.type == EnumBtnType.block) {
      if (elParams.p.isUseIcon) {
        throw SpWMLException(
            EnumSpWMLExceptionType.paramException, lineStart, lineEnd, info);
      } else {
        InkWellParams p = InkWellParams();
        elParams.p.inkWellBtnParams = p;
      }
    } else if (elParams.p.type == EnumBtnType.faSmall ||
        elParams.p.type == EnumBtnType.faExtended ||
        elParams.p.type == EnumBtnType.fa ||
        elParams.p.type == EnumBtnType.faLarge) {
      FAButtonParams p = FAButtonParams();
      if (elParams.p.type == EnumBtnType.faExtended) {
        p.fabExtParams.icon = elParams.p.isUseIcon ? getIcon(false) : null;
        p.fabExtParams.extendedTextStyle = getStyle();
      } else {
        p.child = elParams.p.isUseIcon ? getIcon(false) : null;
      }
      p.foregroundColor = params.containsKey(EnumSpWMLParams.fgColor)
          ? params[EnumSpWMLParams.fgColor]
          : null;
      p.backgroundColor = _getBtnColor();
      p.shape = getShape();
      elParams.p.faButtonParams = p;
    } else {
      NormalBtnParams p = NormalBtnParams();
      p.icon = elParams.p.isUseIcon ? getIcon(false) : null;
      p.style = _getBtnStyle(elParams.p.type!);
      elParams.p.normalBtnParams = p;
    }
    // SIDが設定されていなければエラー。
    if (getSID() == null) {
      throw SpWMLException(EnumSpWMLExceptionType.sidDoesNotExistException,
          lineStart, lineEnd, info);
    }
    return this;
  }

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    return _getBtn(context);
  }

  /// get converted icon widget.
  /// if icon already set, return now icon widget.
  Widget getIcon(bool onlyIconData) {
    if (elParams.p.type != EnumBtnType.block) {
      if (elParams.p.type == EnumBtnType.icon ||
          elParams.p.type == EnumBtnType.iconFilled ||
          elParams.p.type == EnumBtnType.iconFilledTonal ||
          elParams.p.type == EnumBtnType.iconOutlined) {
        if (elParams.p.iconBtnParams?.icon != null) {
          return elParams.p.iconBtnParams!.icon!;
        }
      } else if (elParams.p.type == EnumBtnType.faSmall ||
          elParams.p.type == EnumBtnType.faExtended ||
          elParams.p.type == EnumBtnType.fa ||
          elParams.p.type == EnumBtnType.faLarge) {
        if (elParams.p.faButtonParams?.fabExtParams.icon != null) {
          return elParams.p.faButtonParams!.fabExtParams.icon!;
        }
      } else {
        if (elParams.p.normalBtnParams?.icon != null) {
          return elParams.p.normalBtnParams!.icon!;
        }
      }
    }
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

  /// get converted icon widget.
  Widget? _getSelectedIcon(bool onlyIconData) {
    if (!params.containsKey(EnumSpWMLParams.selectedIconNum)) {
      return null;
    }
    if (onlyIconData) {
      return Icon(params[EnumSpWMLParams.selectedIconNum]);
    } else {
      return Icon(
        params[EnumSpWMLParams.selectedIconNum]!,
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
            onPressed: elParams.p.isEnabled
                ? elParams.p.normalBtnParams!.onPressed
                : null,
            onLongPress: elParams.p.normalBtnParams!.onLongPress,
            onHover: elParams.p.normalBtnParams!.onHover,
            onFocusChange: elParams.p.normalBtnParams!.onFocusChange,
            focusNode: elParams.p.normalBtnParams!.focusNode,
            autofocus: elParams.p.normalBtnParams!.autofocus,
            clipBehavior: elParams.p.normalBtnParams!.clipBehavior,
            style: elParams.p.normalBtnParams!.style,
            statesController: elParams.p.normalBtnParams!.statesController,
            icon: elParams.p.normalBtnParams!.icon!,
            label: child.child == null
                ? (elParams.p.normalBtnParams!.label ?? getText(context))
                : child.child!);
      } else {
        return TextButton(
            key: elParams.p.normalBtnParams!.key,
            onPressed: elParams.p.isEnabled
                ? elParams.p.normalBtnParams!.onPressed
                : null,
            onLongPress: elParams.p.normalBtnParams!.onLongPress,
            onHover: elParams.p.normalBtnParams!.onHover,
            onFocusChange: elParams.p.normalBtnParams!.onFocusChange,
            style: elParams.p.normalBtnParams!.style,
            focusNode: elParams.p.normalBtnParams!.focusNode,
            autofocus: elParams.p.normalBtnParams!.autofocus ?? false,
            clipBehavior: elParams.p.normalBtnParams!.clipBehavior ?? Clip.none,
            statesController: elParams.p.normalBtnParams!.statesController,
            child: child.child == null
                ? (elParams.p.normalBtnParams!.label ?? getText(context))
                : child.child!);
      }
    } else if (elParams.p.type == EnumBtnType.outlined) {
      if (elParams.p.isUseIcon) {
        return OutlinedButton.icon(
            key: elParams.p.normalBtnParams!.key,
            onPressed: elParams.p.isEnabled
                ? elParams.p.normalBtnParams!.onPressed
                : null,
            onLongPress: elParams.p.normalBtnParams!.onLongPress,
            style: elParams.p.normalBtnParams!.style,
            focusNode: elParams.p.normalBtnParams!.focusNode,
            autofocus: elParams.p.normalBtnParams!.autofocus,
            clipBehavior: elParams.p.normalBtnParams!.clipBehavior,
            statesController: elParams.p.normalBtnParams!.statesController,
            icon: elParams.p.normalBtnParams!.icon!,
            label: child.child == null
                ? (elParams.p.normalBtnParams!.label ?? getText(context))
                : child.child!);
      } else {
        return OutlinedButton(
            key: elParams.p.normalBtnParams!.key,
            onPressed: elParams.p.isEnabled
                ? elParams.p.normalBtnParams!.onPressed
                : null,
            onLongPress: elParams.p.normalBtnParams!.onLongPress,
            style: elParams.p.normalBtnParams!.style,
            focusNode: elParams.p.normalBtnParams!.focusNode,
            autofocus: elParams.p.normalBtnParams!.autofocus ?? false,
            clipBehavior: elParams.p.normalBtnParams!.clipBehavior ?? Clip.none,
            statesController: elParams.p.normalBtnParams!.statesController,
            child: child.child == null
                ? (elParams.p.normalBtnParams!.label ?? getText(context))
                : child.child!);
      }
    } else if (elParams.p.type == EnumBtnType.elevated) {
      if (elParams.p.isUseIcon) {
        return ElevatedButton.icon(
            key: elParams.p.normalBtnParams!.key,
            onPressed: elParams.p.isEnabled
                ? elParams.p.normalBtnParams!.onPressed
                : null,
            onLongPress: elParams.p.normalBtnParams!.onLongPress,
            onHover: elParams.p.normalBtnParams!.onHover,
            onFocusChange: elParams.p.normalBtnParams!.onFocusChange,
            style: elParams.p.normalBtnParams!.style,
            focusNode: elParams.p.normalBtnParams!.focusNode,
            autofocus: elParams.p.normalBtnParams!.autofocus,
            clipBehavior: elParams.p.normalBtnParams!.clipBehavior,
            statesController: elParams.p.normalBtnParams!.statesController,
            icon: elParams.p.normalBtnParams!.icon!,
            label: child.child == null
                ? (elParams.p.normalBtnParams!.label ?? getText(context))
                : child.child!);
      } else {
        return ElevatedButton(
            key: elParams.p.normalBtnParams!.key,
            onPressed: elParams.p.isEnabled
                ? elParams.p.normalBtnParams!.onPressed
                : null,
            onLongPress: elParams.p.normalBtnParams!.onLongPress,
            onHover: elParams.p.normalBtnParams!.onHover,
            onFocusChange: elParams.p.normalBtnParams!.onFocusChange,
            style: elParams.p.normalBtnParams!.style,
            focusNode: elParams.p.normalBtnParams!.focusNode,
            autofocus: elParams.p.normalBtnParams!.autofocus ?? false,
            clipBehavior: elParams.p.normalBtnParams!.clipBehavior ?? Clip.none,
            statesController: elParams.p.normalBtnParams!.statesController,
            child: child.child == null
                ? (elParams.p.normalBtnParams!.label ?? getText(context))
                : child.child!);
      }
    } else if (elParams.p.type == EnumBtnType.filled) {
      if (elParams.p.isUseIcon) {
        return FilledButton.icon(
            key: elParams.p.normalBtnParams!.key,
            onPressed: elParams.p.isEnabled
                ? elParams.p.normalBtnParams!.onPressed
                : null,
            onLongPress: elParams.p.normalBtnParams!.onLongPress,
            onHover: elParams.p.normalBtnParams!.onHover,
            onFocusChange: elParams.p.normalBtnParams!.onFocusChange,
            style: elParams.p.normalBtnParams!.style,
            focusNode: elParams.p.normalBtnParams!.focusNode,
            autofocus: elParams.p.normalBtnParams!.autofocus,
            clipBehavior: elParams.p.normalBtnParams!.clipBehavior,
            statesController: elParams.p.normalBtnParams!.statesController,
            icon: elParams.p.normalBtnParams!.icon!,
            label: child.child == null
                ? (elParams.p.normalBtnParams!.label ?? getText(context))
                : child.child!);
      } else {
        return FilledButton(
            key: elParams.p.normalBtnParams!.key,
            onPressed: elParams.p.isEnabled
                ? elParams.p.normalBtnParams!.onPressed
                : null,
            onLongPress: elParams.p.normalBtnParams!.onLongPress,
            onHover: elParams.p.normalBtnParams!.onHover,
            onFocusChange: elParams.p.normalBtnParams!.onFocusChange,
            style: elParams.p.normalBtnParams!.style,
            focusNode: elParams.p.normalBtnParams!.focusNode,
            autofocus: elParams.p.normalBtnParams!.autofocus ?? false,
            clipBehavior: elParams.p.normalBtnParams!.clipBehavior ?? Clip.none,
            statesController: elParams.p.normalBtnParams!.statesController,
            child: child.child == null
                ? (elParams.p.normalBtnParams!.label ?? getText(context))
                : child.child!);
      }
    } else if (elParams.p.type == EnumBtnType.filledTonal) {
      if (elParams.p.isUseIcon) {
        return FilledButton.tonalIcon(
            key: elParams.p.normalBtnParams!.key,
            onPressed: elParams.p.isEnabled
                ? elParams.p.normalBtnParams!.onPressed
                : null,
            onLongPress: elParams.p.normalBtnParams!.onLongPress,
            onHover: elParams.p.normalBtnParams!.onHover,
            onFocusChange: elParams.p.normalBtnParams!.onFocusChange,
            style: elParams.p.normalBtnParams!.style,
            focusNode: elParams.p.normalBtnParams!.focusNode,
            autofocus: elParams.p.normalBtnParams!.autofocus,
            clipBehavior: elParams.p.normalBtnParams!.clipBehavior,
            statesController: elParams.p.normalBtnParams!.statesController,
            icon: elParams.p.normalBtnParams!.icon!,
            label: child.child == null
                ? (elParams.p.normalBtnParams!.label ?? getText(context))
                : child.child!);
      } else {
        return FilledButton.tonal(
            key: elParams.p.normalBtnParams!.key,
            onPressed: elParams.p.isEnabled
                ? elParams.p.normalBtnParams!.onPressed
                : null,
            onLongPress: elParams.p.normalBtnParams!.onLongPress,
            onHover: elParams.p.normalBtnParams!.onHover,
            onFocusChange: elParams.p.normalBtnParams!.onFocusChange,
            style: elParams.p.normalBtnParams!.style,
            focusNode: elParams.p.normalBtnParams!.focusNode,
            autofocus: elParams.p.normalBtnParams!.autofocus ?? false,
            clipBehavior: elParams.p.normalBtnParams!.clipBehavior ?? Clip.none,
            statesController: elParams.p.normalBtnParams!.statesController,
            child: child.child == null
                ? (elParams.p.normalBtnParams!.label ?? getText(context))
                : child.child!);
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
        onPressed:
            elParams.p.isEnabled ? elParams.p.iconBtnParams!.onPressed : null,
        mouseCursor: elParams.p.iconBtnParams!.mouseCursor,
        focusNode: elParams.p.iconBtnParams!.focusNode,
        autofocus: elParams.p.iconBtnParams!.autofocus,
        tooltip: elParams.p.iconBtnParams!.tooltip,
        enableFeedback: elParams.p.iconBtnParams!.enableFeedback,
        constraints: elParams.p.iconBtnParams!.constraints,
        style: elParams.p.iconBtnParams!.style,
        isSelected: elParams.p.iconBtnParams!.isSelected,
        selectedIcon: elParams.p.iconBtnParams!.selectedIcon,
        icon: elParams.p.iconBtnParams!.icon!,
      );
    } else if (elParams.p.type == EnumBtnType.iconFilled) {
      return IconButton.filled(
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
        onPressed:
            elParams.p.isEnabled ? elParams.p.iconBtnParams!.onPressed : null,
        mouseCursor: elParams.p.iconBtnParams!.mouseCursor,
        focusNode: elParams.p.iconBtnParams!.focusNode,
        autofocus: elParams.p.iconBtnParams!.autofocus,
        tooltip: elParams.p.iconBtnParams!.tooltip,
        enableFeedback: elParams.p.iconBtnParams!.enableFeedback,
        constraints: elParams.p.iconBtnParams!.constraints,
        style: elParams.p.iconBtnParams!.style,
        isSelected: elParams.p.iconBtnParams!.isSelected,
        selectedIcon: elParams.p.iconBtnParams!.selectedIcon,
        icon: elParams.p.iconBtnParams!.icon!,
      );
    } else if (elParams.p.type == EnumBtnType.iconFilledTonal) {
      return IconButton.filledTonal(
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
        onPressed:
            elParams.p.isEnabled ? elParams.p.iconBtnParams!.onPressed : null,
        mouseCursor: elParams.p.iconBtnParams!.mouseCursor,
        focusNode: elParams.p.iconBtnParams!.focusNode,
        autofocus: elParams.p.iconBtnParams!.autofocus,
        tooltip: elParams.p.iconBtnParams!.tooltip,
        enableFeedback: elParams.p.iconBtnParams!.enableFeedback,
        constraints: elParams.p.iconBtnParams!.constraints,
        style: elParams.p.iconBtnParams!.style,
        isSelected: elParams.p.iconBtnParams!.isSelected,
        selectedIcon: elParams.p.iconBtnParams!.selectedIcon,
        icon: elParams.p.iconBtnParams!.icon!,
      );
    } else if (elParams.p.type == EnumBtnType.iconOutlined) {
      return IconButton.outlined(
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
        onPressed:
            elParams.p.isEnabled ? elParams.p.iconBtnParams!.onPressed : null,
        mouseCursor: elParams.p.iconBtnParams!.mouseCursor,
        focusNode: elParams.p.iconBtnParams!.focusNode,
        autofocus: elParams.p.iconBtnParams!.autofocus,
        tooltip: elParams.p.iconBtnParams!.tooltip,
        enableFeedback: elParams.p.iconBtnParams!.enableFeedback,
        constraints: elParams.p.iconBtnParams!.constraints,
        style: elParams.p.iconBtnParams!.style,
        isSelected: elParams.p.iconBtnParams!.isSelected,
        selectedIcon: elParams.p.iconBtnParams!.selectedIcon,
        icon: elParams.p.iconBtnParams!.icon!,
      );
    } else if (elParams.p.type == EnumBtnType.faSmall) {
      return FloatingActionButton.small(
        key: elParams.p.faButtonParams!.key,
        tooltip: elParams.p.faButtonParams!.tooltip,
        foregroundColor: elParams.p.faButtonParams!.foregroundColor,
        backgroundColor: elParams.p.faButtonParams!.backgroundColor,
        focusColor: elParams.p.faButtonParams!.focusColor,
        hoverColor: elParams.p.faButtonParams!.hoverColor,
        splashColor: elParams.p.faButtonParams!.splashColor,
        heroTag: elParams.p.faButtonParams!.heroTag,
        elevation: elParams.p.faButtonParams!.elevation,
        focusElevation: elParams.p.faButtonParams!.focusElevation,
        hoverElevation: elParams.p.faButtonParams!.hoverElevation,
        highlightElevation: elParams.p.faButtonParams!.highlightElevation,
        disabledElevation: elParams.p.faButtonParams!.disabledElevation,
        onPressed:
            elParams.p.isEnabled ? elParams.p.faButtonParams!.onPressed : null,
        mouseCursor: elParams.p.faButtonParams!.mouseCursor,
        shape: elParams.p.faButtonParams!.shape,
        clipBehavior: elParams.p.faButtonParams!.clipBehavior,
        focusNode: elParams.p.faButtonParams!.focusNode,
        autofocus: elParams.p.faButtonParams!.autofocus,
        materialTapTargetSize: elParams.p.faButtonParams!.materialTapTargetSize,
        enableFeedback: elParams.p.faButtonParams!.enableFeedback,
        child: elParams.p.faButtonParams!.child,
      );
    } else if (elParams.p.type == EnumBtnType.faExtended) {
      return FloatingActionButton.extended(
          key: elParams.p.faButtonParams!.key,
          tooltip: elParams.p.faButtonParams!.tooltip,
          foregroundColor: elParams.p.faButtonParams!.foregroundColor,
          backgroundColor: elParams.p.faButtonParams!.backgroundColor,
          focusColor: elParams.p.faButtonParams!.focusColor,
          hoverColor: elParams.p.faButtonParams!.hoverColor,
          splashColor: elParams.p.faButtonParams!.splashColor,
          heroTag: elParams.p.faButtonParams!.heroTag,
          elevation: elParams.p.faButtonParams!.elevation,
          focusElevation: elParams.p.faButtonParams!.focusElevation,
          hoverElevation: elParams.p.faButtonParams!.hoverElevation,
          highlightElevation: elParams.p.faButtonParams!.highlightElevation,
          disabledElevation: elParams.p.faButtonParams!.disabledElevation,
          onPressed: elParams.p.isEnabled
              ? elParams.p.faButtonParams!.onPressed
              : null,
          mouseCursor: elParams.p.faButtonParams!.mouseCursor,
          shape: elParams.p.faButtonParams!.shape,
          clipBehavior: elParams.p.faButtonParams!.clipBehavior,
          focusNode: elParams.p.faButtonParams!.focusNode,
          autofocus: elParams.p.faButtonParams!.autofocus,
          materialTapTargetSize:
              elParams.p.faButtonParams!.materialTapTargetSize,
          enableFeedback: elParams.p.faButtonParams!.enableFeedback,
          isExtended: true,
          extendedIconLabelSpacing:
              elParams.p.faButtonParams!.fabExtParams.extendedIconLabelSpacing,
          extendedPadding:
              elParams.p.faButtonParams!.fabExtParams.extendedPadding,
          extendedTextStyle:
              elParams.p.faButtonParams!.fabExtParams.extendedTextStyle,
          icon: elParams.p.faButtonParams!.fabExtParams.icon,
          label: child.child == null
              ? (elParams.p.faButtonParams!.child ?? getText(context))
              : child.child!);
    } else if (elParams.p.type == EnumBtnType.fa) {
      return FloatingActionButton(
        key: elParams.p.faButtonParams!.key,
        tooltip: elParams.p.faButtonParams!.tooltip,
        foregroundColor: elParams.p.faButtonParams!.foregroundColor,
        backgroundColor: elParams.p.faButtonParams!.backgroundColor,
        focusColor: elParams.p.faButtonParams!.focusColor,
        hoverColor: elParams.p.faButtonParams!.hoverColor,
        splashColor: elParams.p.faButtonParams!.splashColor,
        heroTag: elParams.p.faButtonParams!.heroTag,
        elevation: elParams.p.faButtonParams!.elevation,
        focusElevation: elParams.p.faButtonParams!.focusElevation,
        hoverElevation: elParams.p.faButtonParams!.hoverElevation,
        highlightElevation: elParams.p.faButtonParams!.highlightElevation,
        disabledElevation: elParams.p.faButtonParams!.disabledElevation,
        onPressed:
            elParams.p.isEnabled ? elParams.p.faButtonParams!.onPressed : null,
        mouseCursor: elParams.p.faButtonParams!.mouseCursor,
        mini: false,
        shape: elParams.p.faButtonParams!.shape,
        clipBehavior: elParams.p.faButtonParams!.clipBehavior,
        focusNode: elParams.p.faButtonParams!.focusNode,
        autofocus: elParams.p.faButtonParams!.autofocus,
        materialTapTargetSize: elParams.p.faButtonParams!.materialTapTargetSize,
        enableFeedback: elParams.p.faButtonParams!.enableFeedback,
        isExtended: false,
        child: elParams.p.faButtonParams!.child,
      );
    } else if (elParams.p.type == EnumBtnType.faLarge) {
      return FloatingActionButton.large(
        key: elParams.p.faButtonParams!.key,
        tooltip: elParams.p.faButtonParams!.tooltip,
        foregroundColor: elParams.p.faButtonParams!.foregroundColor,
        backgroundColor: elParams.p.faButtonParams!.backgroundColor,
        focusColor: elParams.p.faButtonParams!.focusColor,
        hoverColor: elParams.p.faButtonParams!.hoverColor,
        splashColor: elParams.p.faButtonParams!.splashColor,
        heroTag: elParams.p.faButtonParams!.heroTag,
        elevation: elParams.p.faButtonParams!.elevation,
        focusElevation: elParams.p.faButtonParams!.focusElevation,
        hoverElevation: elParams.p.faButtonParams!.hoverElevation,
        highlightElevation: elParams.p.faButtonParams!.highlightElevation,
        disabledElevation: elParams.p.faButtonParams!.disabledElevation,
        onPressed:
            elParams.p.isEnabled ? elParams.p.faButtonParams!.onPressed : null,
        mouseCursor: elParams.p.faButtonParams!.mouseCursor,
        shape: elParams.p.faButtonParams!.shape,
        clipBehavior: elParams.p.faButtonParams!.clipBehavior,
        focusNode: elParams.p.faButtonParams!.focusNode,
        autofocus: elParams.p.faButtonParams!.autofocus,
        materialTapTargetSize: elParams.p.faButtonParams!.materialTapTargetSize,
        enableFeedback: elParams.p.faButtonParams!.enableFeedback,
        child: elParams.p.faButtonParams!.child,
      );
    } else {
      // block type
      return InkWell(
        key: elParams.p.inkWellBtnParams!.key,
        onTap: elParams.p.isEnabled ? elParams.p.inkWellBtnParams!.onTap : null,
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
        statesController: elParams.p.inkWellBtnParams!.statesController,
        child: child.child,
      );
    }
  }

  /// (en)Set this button callback.
  ///
  /// (ja)このボタンのクリック時動作を設定します。
  /// * [callback] : Button callback.
  void setCallback(void Function()? callback) {
    if (elParams.p.type == EnumBtnType.icon ||
        elParams.p.type == EnumBtnType.iconFilled ||
        elParams.p.type == EnumBtnType.iconFilledTonal ||
        elParams.p.type == EnumBtnType.iconOutlined) {
      elParams.p.iconBtnParams!.onPressed = callback;
    } else if (elParams.p.type == EnumBtnType.block) {
      elParams.p.inkWellBtnParams!.onTap = callback;
    } else if (elParams.p.type == EnumBtnType.faSmall ||
        elParams.p.type == EnumBtnType.faExtended ||
        elParams.p.type == EnumBtnType.fa ||
        elParams.p.type == EnumBtnType.faLarge) {
      elParams.p.faButtonParams!.onPressed = callback;
    } else {
      elParams.p.normalBtnParams!.onPressed = callback;
    }
  }

  /// (en) Enable/disable this button.
  /// Note that the block button does not change its appearance.
  ///
  /// (ja)このボタンの有効・無効を切り替えます。
  /// ブロックボタンは見た目が変化しないため注意してください。
  ///
  /// * [isEnabled] : If true, the button is enabled.
  void setEnabled(bool isEnabled) {
    elParams.p.isEnabled = isEnabled;
  }

  /// (en) Sets the color of this button.
  /// block type buttons have no effect.
  ///
  /// (ja)このボタンの色を設定します。
  /// block系のボタンには効果がありません。
  void setBtnColor(Color color) {
    if (elParams.p.type == EnumBtnType.block) {
      return;
    } else if (elParams.p.type == EnumBtnType.faSmall ||
        elParams.p.type == EnumBtnType.faExtended ||
        elParams.p.type == EnumBtnType.fa ||
        elParams.p.type == EnumBtnType.faLarge) {
      elParams.p.faButtonParams?.backgroundColor = color;
    } else if (elParams.p.type == EnumBtnType.icon ||
        elParams.p.type == EnumBtnType.iconOutlined ||
        elParams.p.type == EnumBtnType.iconFilled ||
        elParams.p.type == EnumBtnType.iconFilledTonal) {
      elParams.p.iconBtnParams?.color = color;
    } else {
      params[EnumSpWMLParams.btnBGColor] = color;
      elParams.p.normalBtnParams?.style = _getBtnStyle(elParams.p.type!);
    }
  }

  Color? _getBtnColor() {
    Color? c1 = params.containsKey(EnumSpWMLParams.color)
        ? params[EnumSpWMLParams.color]
        : null;
    Color? c2 = params.containsKey(EnumSpWMLParams.btnBGColor)
        ? params[EnumSpWMLParams.btnBGColor]
        : null;
    return c1 ?? c2;
  }

  /// Get button style from parameters.
  ButtonStyle? _getBtnStyle(EnumBtnType bType) {
    if (bType == EnumBtnType.text) {
      return TextButton.styleFrom(
          foregroundColor: params.containsKey(EnumSpWMLParams.fgColor)
              ? params[EnumSpWMLParams.fgColor]
              : null,
          backgroundColor: _getBtnColor(),
          shape: getShape());
    } else if (bType == EnumBtnType.outlined) {
      return OutlinedButton.styleFrom(
          foregroundColor: params.containsKey(EnumSpWMLParams.fgColor)
              ? params[EnumSpWMLParams.fgColor]
              : null,
          backgroundColor: _getBtnColor(),
          side: getBorderSide(),
          shape: getShape());
    } else if (bType == EnumBtnType.elevated) {
      return ElevatedButton.styleFrom(
          foregroundColor: params.containsKey(EnumSpWMLParams.fgColor)
              ? params[EnumSpWMLParams.fgColor]
              : null,
          backgroundColor: _getBtnColor(),
          shape: getShape());
    } else if (bType == EnumBtnType.filled ||
        bType == EnumBtnType.filledTonal) {
      return FilledButton.styleFrom(
          foregroundColor: params.containsKey(EnumSpWMLParams.fgColor)
              ? params[EnumSpWMLParams.fgColor]
              : null,
          backgroundColor: _getBtnColor(),
          shape: getShape());
    } else {
      return null;
    }
  }
}
