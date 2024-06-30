import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';
import '../../../../simple_widget_markup.dart';

///
/// (en) The textfield.
///
/// (ja) textfieldの実装。
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
      this.tfParams,
      {super.key})
      : super(serial, EnumSpWMLElementType.textField, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, textParams);

  /// Get this class name.
  @override
  String getClassName() {
    return "TextFieldElement";
  }

  /// initialize parameters
  @override
  TextFieldElement initParams() {
    super.initParams();
    tfParams.p.textAlign = params.containsKey(EnumSpWMLParams.textAlign)
        ? params[EnumSpWMLParams.textAlign]
        : TextAlign.left;
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
              : null,
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
    // max setting（textと共通では無いので注意）
    tfParams.p.maxLines = params.containsKey(EnumSpWMLParams.maxLines)
        ? params[EnumSpWMLParams.maxLines]
        : null;
    tfParams.p.maxLength = params.containsKey(EnumSpWMLParams.maxLength)
        ? params[EnumSpWMLParams.maxLength]
        : null;
    // モードチェンジは最後に行う必要がある。
    if (params.containsKey(EnumSpWMLParams.mode)) {
      if (params[EnumSpWMLParams.mode] == EnumTextFieldMode.password) {
        tfParams.p.changePasswordMode(false);
      } else if (params[EnumSpWMLParams.mode] ==
          EnumTextFieldMode.passwordPrefix) {
        tfParams.p.changePasswordMode(true);
      } else if (params[EnumSpWMLParams.mode] == EnumTextFieldMode.search) {
        tfParams.p.changeSearchMode(false);
      } else if (params[EnumSpWMLParams.mode] ==
          EnumTextFieldMode.searchPrefix) {
        tfParams.p.changeSearchMode(true);
      } else if (params[EnumSpWMLParams.mode] ==
          EnumTextFieldMode.searchAndClear) {
        tfParams.p.changeSearchAndClearMode();
      }
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
    return _TextFieldElementWidget(this, tfParams);
  }

  /// Set search mode search icon button callback.
  /// * [btnCallback] : The callback. The argument is passed the current user input.
  void setSearchCallback(Function(String inputText)? btnCallback) {
    tfParams.p.searchCallback = btnCallback;
  }

  /// Set searchAndClear mode clear icon button callback.
  /// * [btnCallback] : The callback.
  void setClearCallback(Function()? btnCallback) {
    tfParams.p.clearCallback = btnCallback;
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
  /// * [isAlwaysInitialize] : If true, always set initialText.
  /// If true and initialText is null, initialize by empty string
  void setManager(TextFieldManager manager, String name,
      {String? initialText, bool isAlwaysInitialize = false}) {
    setController(manager.getCtrl(name,
        initialText: initialText, isAlwaysInitialize: isAlwaysInitialize));
    setFocusNode(manager.getFocus(name));
  }

  /// Set the new text to this widget.
  /// Disabled if controller or manager is not set.
  void setText(String text) {
    if (tfParams.p.controller != null) {
      tfParams.p.controller!.text = text;
    }
  }

  /// Gets the text set to this widget.
  /// If the controller or manager is not set, null is returned.
  String? getText() {
    if (tfParams.p.controller != null) {
      return tfParams.p.controller!.text;
    } else {
      return null;
    }
  }
}

class _TextFieldElementWidget extends StatefulWidget {
  final TextFieldElement parent;
  final TextFieldParamsWrapper tfParams;

  const _TextFieldElementWidget(this.parent, this.tfParams);

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

  Widget _getPassWordIcon(bool isPrefix) {
    return IconButton(
      icon: Icon(widget.tfParams.p.obscureText
          ? Icons.visibility_off
          : Icons.visibility),
      iconSize: isPrefix
          ? widget.tfParams.p.prefixIconSize
          : widget.tfParams.p.suffixIconSize,
      onPressed: () {
        if (mounted) {
          setState(() {
            widget.tfParams.p.obscureText = !widget.tfParams.p.obscureText;
          });
        }
      },
      splashRadius: widget.tfParams.p.suffixIconSplashRadius,
    );
  }

  Widget _getSearchIcon(bool isPrefix) {
    return IconButton(
      icon: const Icon(Icons.search),
      iconSize: isPrefix
          ? widget.tfParams.p.prefixIconSize
          : widget.tfParams.p.suffixIconSize,
      onPressed: () {
        if (widget.tfParams.p.searchCallback != null) {
          widget.tfParams.p
              .searchCallback!(widget.tfParams.p.controller?.text ?? "");
        }
      },
      splashRadius: widget.tfParams.p.suffixIconSplashRadius,
    );
  }

  Widget _getClearIcon(bool isPrefix) {
    return IconButton(
      icon: const Icon(Icons.clear),
      iconSize: isPrefix
          ? widget.tfParams.p.prefixIconSize
          : widget.tfParams.p.suffixIconSize,
      onPressed: () {
        if (mounted) {
          setState(() {
            widget.tfParams.p.controller?.clear();
            if (widget.tfParams.p.clearCallback != null) {
              widget.tfParams.p.clearCallback!();
            }
          });
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
          suffixIcon: _getPassWordIcon(false),
          suffixIconColor: widget.tfParams.p.suffixIconColor);
    } else if (widget.tfParams.p.mode == EnumTextFieldMode.passwordPrefix) {
      return widget.tfParams.p.decoration.copyWith(
          prefixIcon: _getPassWordIcon(true),
          prefixIconColor: widget.tfParams.p.prefixIconColor,
          suffixIcon: _getSuffixIcon(),
          suffixIconColor: widget.tfParams.p.suffixIconColor);
    } else if (widget.tfParams.p.mode == EnumTextFieldMode.search) {
      return widget.tfParams.p.decoration.copyWith(
          prefixIcon: _getPrefixIcon(),
          prefixIconColor: widget.tfParams.p.prefixIconColor,
          suffixIcon: _getSearchIcon(false),
          suffixIconColor: widget.tfParams.p.suffixIconColor);
    } else if (widget.tfParams.p.mode == EnumTextFieldMode.searchPrefix) {
      return widget.tfParams.p.decoration.copyWith(
          prefixIcon: _getSearchIcon(true),
          prefixIconColor: widget.tfParams.p.prefixIconColor,
          suffixIcon: _getSuffixIcon(),
          suffixIconColor: widget.tfParams.p.suffixIconColor);
    } else if (widget.tfParams.p.mode == EnumTextFieldMode.searchAndClear) {
      return widget.tfParams.p.decoration.copyWith(
          prefixIcon: _getSearchIcon(true),
          prefixIconColor: widget.tfParams.p.prefixIconColor,
          suffixIcon: _getClearIcon(false),
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
      style: widget.tfParams.p.style ?? widget.parent.getStyle(context),
      strutStyle:
          widget.tfParams.p.strutStyle ?? widget.parent.getStrutStyle(context),
      textAlign: widget.tfParams.p.textAlign,
      textAlignVertical: widget.tfParams.p.textAlignVertical,
      textDirection: widget.tfParams.p.textDirection,
      readOnly: widget.tfParams.p.readOnly,
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
      onTapOutside: widget.tfParams.p.onTapOutside,
      mouseCursor: widget.tfParams.p.mouseCursor,
      buildCounter: widget.tfParams.p.buildCounter,
      scrollController: widget.tfParams.p.scrollController,
      scrollPhysics: widget.tfParams.p.scrollPhysics,
      autofillHints: widget.tfParams.p.autofillHints,
      clipBehavior: widget.tfParams.p.clipBehavior,
      restorationId: widget.tfParams.p.restorationId,
      scribbleEnabled: widget.tfParams.p.scribbleEnabled,
      enableIMEPersonalizedLearning:
          widget.tfParams.p.enableIMEPersonalizedLearning,
      contextMenuBuilder: widget.tfParams.p.contextMenuBuilder,
      spellCheckConfiguration: widget.tfParams.p.spellCheckConfiguration,
      magnifierConfiguration: widget.tfParams.p.magnifierConfiguration,
    );
  }
}
