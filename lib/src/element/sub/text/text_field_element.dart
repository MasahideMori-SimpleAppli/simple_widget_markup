import 'package:flutter/material.dart';
import 'package:textfield_manager/textfield_manager.dart';
import '../../../element_params/spwml_info.dart';
import 'text_element.dart';
import '../../../element_params/sub/text/text_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../element_params/sub/text/textfield_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../enum/enum_textfield_params.dart';
import '../../../style/spwml_font_style.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-4-14 18:09:59
///
class TextFieldElement extends TextElement {
  final TextFieldParamsWrapper tfParams;

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
  /// * [tfParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  TextFieldElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      TextParamsWrapper textParams,
      this.tfParams)
      : super(serial, EnumSpWMLElementType.textField, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, textParams);

  /// initialize parameters
  @override
  TextFieldElement initParams() {
    super.initParams();
    tfParams.p.textAlign = params.containsKey(EnumSpWMLParams.textAlign)
        ? params[EnumSpWMLParams.textAlign]
        : TextAlign.left;
    tfParams.p.style = getStyle();
    tfParams.p.strutStyle = getStrutStyle();
    if (params.containsKey(EnumSpWMLParams.hint)) {
      tfParams.p.decoration = tfParams.p.decoration.copyWith(
          hintText: params[EnumSpWMLParams.hint],
          hintStyle: const TextStyle(color: Colors.grey));
    }
    if (params.containsKey(EnumSpWMLParams.type)) {
      if (params[EnumSpWMLParams.type] == EnumTextFieldType.rounded) {
        tfParams.p.changeRoundedDesign(
          fillColor: params.containsKey(EnumSpWMLParams.fillColor)
              ? params[EnumSpWMLParams.fillColor]
              : Colors.white70,
          radius: params.containsKey(EnumSpWMLParams.radius)
              ? params[EnumSpWMLParams.radius]
              : 10,
        );
      }
    }
    if (params.containsKey(EnumSpWMLParams.labelText)) {
      tfParams.p.decoration = tfParams.p.decoration
          .copyWith(labelText: params[EnumSpWMLParams.labelText]);
    }
    if (params.containsKey(EnumSpWMLParams.mode)) {
      if (params[EnumSpWMLParams.mode] == EnumTextFieldMode.password) {
        tfParams.p.changePasswordMode();
      } else if (params[EnumSpWMLParams.mode] == EnumTextFieldMode.search) {
        tfParams.p.changeSearchMode();
      }
    }
    if (params.containsKey(EnumSpWMLParams.iconNum)) {
      tfParams.p.prefixIconData = params[EnumSpWMLParams.iconNum];
    }
    if (params.containsKey(EnumSpWMLParams.iconSize)) {
      tfParams.p.prefixIconSize = params[EnumSpWMLParams.iconSize];
    }
    if (params.containsKey(EnumSpWMLParams.iconColor)) {
      tfParams.p.prefixIconColor = params[EnumSpWMLParams.iconColor];
    }
    if (params.containsKey(EnumSpWMLParams.suffixIconNum)) {
      tfParams.p.suffixIconData = params[EnumSpWMLParams.suffixIconNum];
    }
    if (params.containsKey(EnumSpWMLParams.suffixIconSplashRadius)) {
      tfParams.p.suffixIconSplashRadius = params[EnumSpWMLParams.splashRadius];
    }
    if (params.containsKey(EnumSpWMLParams.suffixIconSize)) {
      tfParams.p.suffixIconSize = params[EnumSpWMLParams.suffixIconSize];
    }
    if (params.containsKey(EnumSpWMLParams.suffixIconColor)) {
      tfParams.p.suffixIconColor = params[EnumSpWMLParams.suffixIconColor];
    }
    // Content padding
    double? cpL = params.containsKey(EnumSpWMLParams.cpL)
        ? params[EnumSpWMLParams.cpL]
        : null;
    double? cpT = params.containsKey(EnumSpWMLParams.cpT)
        ? params[EnumSpWMLParams.cpT]
        : null;
    double? cpR = params.containsKey(EnumSpWMLParams.cpR)
        ? params[EnumSpWMLParams.cpR]
        : null;
    double? cpB = params.containsKey(EnumSpWMLParams.cpB)
        ? params[EnumSpWMLParams.cpB]
        : null;
    tfParams.p.changeContentPadding(cpL: cpL, cpT: cpT, cpR: cpR, cpB: cpB);
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    return _TextFieldElementWidget(tfParams);
  }

  /// Set suffix icon button callback.
  /// * [suffixCallback] : The callback. The argument is passed the current user input.
  void setSuffixCallback(Function(String inputText)? suffixCallback) {
    tfParams.p.suffixCallback = suffixCallback;
  }

  /// Set onChanged callback.
  /// * [onChanged] : The callback. This will be called back when the user has entered some value.
  void setOnChanged(void Function(String)? onChanged) {
    tfParams.p.onChanged = onChanged;
  }

  /// Set onSubmitted callback.
  /// * [onSubmitted] : The callback. This will be called back when the user has completed input.
  void setOnSubmitted(void Function(String)? onSubmitted) {
    tfParams.p.onSubmitted = onSubmitted;
  }

  /// Set TextEditingController.
  /// * [controller] : The controller.
  void setController(TextEditingController? controller) {
    tfParams.p.controller = controller;
  }

  /// Set focusNode.
  /// * [focusNode] : The focusNode.
  void setFocusNode(FocusNode? focusNode) {
    tfParams.p.focusNode = focusNode;
  }

  /// Set enabled flag.
  /// * [isEnable] : If set false, This element to be not editable.
  void setEnabled(bool enabled) {
    tfParams.p.enabled = enabled;
  }

  /// Use TextFieldManager to apply setController and setFocusNode at the same time.
  /// * [manager] : TextFieldManager.
  /// * [name] : A unique name for the controller and focus.
  /// * [initialText] : Initial text for the controller in TextFieldManager.
  /// Applies only when first created.
  void setManager(TextFieldManager manager, String name,
      {String? initialText}) {
    setController(manager.getCtrl(name, initialText: initialText));
    setFocusNode(manager.getFocus(name));
  }
}

class _TextFieldElementWidget extends StatefulWidget {
  final TextFieldParamsWrapper tfParams;

  const _TextFieldElementWidget(this.tfParams, {Key? key}) : super(key: key);

  @override
  State<_TextFieldElementWidget> createState() =>
      _TextFieldElementWidgetState();
}

class _TextFieldElementWidgetState extends State<_TextFieldElementWidget> {
  Widget? _getPrefixIcon() {
    if (widget.tfParams.p.prefixIconData == null) {
      return null;
    } else {
      return Icon(
        widget.tfParams.p.prefixIconData,
        size: widget.tfParams.p.prefixIconSize,
      );
    }
  }

  Widget? _getSuffixIcon() {
    if (widget.tfParams.p.suffixIconData == null) {
      return null;
    } else {
      return Icon(
        widget.tfParams.p.suffixIconData,
        size: widget.tfParams.p.suffixIconSize,
      );
    }
  }

  Widget _getPassWordIcon() {
    return IconButton(
      icon: Icon(widget.tfParams.p.obscureText
          ? Icons.visibility_off
          : Icons.visibility),
      iconSize: widget.tfParams.p.suffixIconSize,
      onPressed: () {
        setState(() {
          widget.tfParams.p.obscureText = !widget.tfParams.p.obscureText;
        });
      },
      splashRadius: widget.tfParams.p.suffixIconSplashRadius,
    );
  }

  Widget _getSearchIcon() {
    return IconButton(
      icon: const Icon(Icons.search),
      iconSize: widget.tfParams.p.suffixIconSize,
      onPressed: () {
        if (widget.tfParams.p.suffixCallback != null) {
          widget.tfParams.p
              .suffixCallback!(widget.tfParams.p.controller?.text ?? "");
        }
      },
      splashRadius: widget.tfParams.p.suffixIconSplashRadius,
    );
  }

  InputDecoration? _getDecoration() {
    if (widget.tfParams.p.mode == EnumTextFieldMode.normal) {
      return widget.tfParams.p.decoration.copyWith(
          prefixIcon: _getPrefixIcon(),
          prefixIconColor: widget.tfParams.p.prefixIconColor,
          suffixIcon: _getSuffixIcon(),
          suffixIconColor: widget.tfParams.p.suffixIconColor);
    } else if (widget.tfParams.p.mode == EnumTextFieldMode.password) {
      return widget.tfParams.p.decoration.copyWith(
          prefixIcon: _getPrefixIcon(),
          prefixIconColor: widget.tfParams.p.prefixIconColor,
          suffixIcon: _getPassWordIcon(),
          suffixIconColor: widget.tfParams.p.suffixIconColor);
    } else if (widget.tfParams.p.mode == EnumTextFieldMode.search) {
      // search
      return widget.tfParams.p.decoration.copyWith(
          prefixIcon: _getPrefixIcon(),
          prefixIconColor: widget.tfParams.p.prefixIconColor,
          suffixIcon: _getSearchIcon(),
          suffixIconColor: widget.tfParams.p.suffixIconColor);
    } else {
      // manual
      return widget.tfParams.p.decoration;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: widget.tfParams.p.key,
      controller: widget.tfParams.p.controller,
      focusNode: widget.tfParams.p.focusNode,
      decoration: _getDecoration(),
      keyboardType: widget.tfParams.p.keyboardType,
      textInputAction: widget.tfParams.p.textInputAction,
      textCapitalization: widget.tfParams.p.textCapitalization,
      style: widget.tfParams.p.style,
      strutStyle: widget.tfParams.p.strutStyle,
      textAlign: widget.tfParams.p.textAlign,
      textAlignVertical: widget.tfParams.p.textAlignVertical,
      textDirection: widget.tfParams.p.textDirection,
      readOnly: widget.tfParams.p.readOnly,
      toolbarOptions: widget.tfParams.p.toolbarOptions,
      showCursor: widget.tfParams.p.showCursor,
      autofocus: widget.tfParams.p.autofocus,
      obscuringCharacter: widget.tfParams.p.obscuringCharacter,
      obscureText: widget.tfParams.p.obscureText,
      autocorrect: widget.tfParams.p.autocorrect,
      smartDashesType: widget.tfParams.p.smartDashesType,
      smartQuotesType: widget.tfParams.p.smartQuotesType,
      enableSuggestions: widget.tfParams.p.enableSuggestions,
      maxLines: widget.tfParams.p.maxLines,
      minLines: widget.tfParams.p.minLines,
      expands: widget.tfParams.p.expands,
      maxLength: widget.tfParams.p.maxLength,
      maxLengthEnforcement: widget.tfParams.p.maxLengthEnforcement,
      onChanged: widget.tfParams.p.onChanged,
      onEditingComplete: widget.tfParams.p.onEditingComplete,
      onSubmitted: widget.tfParams.p.onSubmitted,
      onAppPrivateCommand: widget.tfParams.p.onAppPrivateCommand,
      inputFormatters: widget.tfParams.p.inputFormatters,
      enabled: widget.tfParams.p.enabled,
      cursorWidth: widget.tfParams.p.cursorWidth,
      cursorHeight: widget.tfParams.p.cursorHeight,
      cursorRadius: widget.tfParams.p.cursorRadius,
      cursorColor: widget.tfParams.p.cursorColor,
      selectionHeightStyle: widget.tfParams.p.selectionHeightStyle,
      selectionWidthStyle: widget.tfParams.p.selectionWidthStyle,
      keyboardAppearance: widget.tfParams.p.keyboardAppearance,
      scrollPadding: widget.tfParams.p.scrollPadding,
      dragStartBehavior: widget.tfParams.p.dragStartBehavior,
      enableInteractiveSelection: widget.tfParams.p.enableInteractiveSelection,
      selectionControls: widget.tfParams.p.selectionControls,
      onTap: widget.tfParams.p.onTap,
      mouseCursor: widget.tfParams.p.mouseCursor,
      buildCounter: widget.tfParams.p.buildCounter,
      scrollController: widget.tfParams.p.scrollController,
      scrollPhysics: widget.tfParams.p.scrollPhysics,
      autofillHints: widget.tfParams.p.autofillHints,
      clipBehavior: widget.tfParams.p.clipBehavior,
      restorationId: widget.tfParams.p.restorationId,
      enableIMEPersonalizedLearning:
          widget.tfParams.p.enableIMEPersonalizedLearning,
    );
  }
}
