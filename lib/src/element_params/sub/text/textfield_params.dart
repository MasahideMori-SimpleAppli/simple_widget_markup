import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../enum/enum_textfield_params.dart';

class TextFieldParamsWrapper {
  TextFieldParams p;

  /// * [p] : The parameter set.
  TextFieldParamsWrapper(this.p);
}

class TextFieldParams {
  Key? key;
  TextEditingController? controller;
  FocusNode? focusNode;
  InputDecoration decoration = const InputDecoration();
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  TextCapitalization textCapitalization = TextCapitalization.none;
  TextStyle? style;
  StrutStyle? strutStyle;
  TextAlign textAlign = TextAlign.start;
  TextAlignVertical? textAlignVertical;
  TextDirection? textDirection;
  bool readOnly = false;
  bool? showCursor;
  bool autofocus = false;
  String obscuringCharacter = '•';
  bool obscureText = false;
  bool autocorrect = true;
  SmartDashesType? smartDashesType;
  SmartQuotesType? smartQuotesType;
  bool enableSuggestions = true;
  int? maxLines = 1;
  int? minLines;
  bool expands = false;
  int? maxLength;
  MaxLengthEnforcement? maxLengthEnforcement;
  void Function(String)? onChanged;
  void Function()? onEditingComplete;
  void Function(String)? onSubmitted;
  void Function(String, Map)? onAppPrivateCommand;
  List<TextInputFormatter>? inputFormatters;
  bool? enabled;
  double cursorWidth = 2.0;
  double? cursorHeight;
  Radius? cursorRadius;
  Color? cursorColor;
  BoxHeightStyle selectionHeightStyle = BoxHeightStyle.tight;
  BoxWidthStyle selectionWidthStyle = BoxWidthStyle.tight;
  Brightness? keyboardAppearance;
  EdgeInsets scrollPadding = const EdgeInsets.all(20.0);
  DragStartBehavior dragStartBehavior = DragStartBehavior.start;
  bool enableInteractiveSelection = true;
  TextSelectionControls? selectionControls;
  void Function()? onTap;
  void Function(PointerDownEvent)? onTapOutside;
  MouseCursor? mouseCursor;
  Widget? Function(BuildContext,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength})? buildCounter;
  ScrollController? scrollController;
  ScrollPhysics? scrollPhysics;
  Iterable<String>? autofillHints = const [];
  Clip clipBehavior = Clip.hardEdge;
  String? restorationId;
  bool scribbleEnabled = true;
  bool enableIMEPersonalizedLearning = true;
  Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;
  SpellCheckConfiguration? spellCheckConfiguration;
  TextMagnifierConfiguration? magnifierConfiguration;

  // others
  EnumTextFieldType _design = EnumTextFieldType.material;

  EnumTextFieldType get design => _design;

  /// Change textField design.
  void changeMaterialDesign() {
    decoration =
        decoration.copyWith(border: null, filled: false, fillColor: null);
    _design = EnumTextFieldType.material;
  }

  /// Change textField design.
  void changeRoundedDesign(
      {double radius = 10, Color fillColor = Colors.white70}) {
    decoration = decoration.copyWith(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        filled: true,
        fillColor: fillColor);
    _design = EnumTextFieldType.rounded;
  }

  IconData? prefixIconData;
  double? prefixIconSize;
  Color? prefixIconColor;

  EnumTextFieldMode _mode = EnumTextFieldMode.normal;

  EnumTextFieldMode get mode => _mode;
  double suffixIconSplashRadius = 20.0;
  IconData? suffixIconData;
  double? suffixIconSize;
  Color? suffixIconColor;
  Function(String inputText)? suffixCallback;

  /// Change textField mode.
  void changeNormalMode() {
    _mode = EnumTextFieldMode.normal;
    obscureText = false;
    enableSuggestions = true;
    autocorrect = true;
  }

  /// Change textField design.
  void changePasswordMode() {
    _mode = EnumTextFieldMode.password;
    obscureText = true;
    enableSuggestions = false;
    autocorrect = false;
  }

  /// Change textField mode.
  void changeSearchMode() {
    _mode = EnumTextFieldMode.search;
    obscureText = false;
    enableSuggestions = true;
    autocorrect = true;
  }

  /// Change textField content padding.
  /// If not all null, isDense will be set true.
  void changeContentPadding(
      {double? cpL, double? cpT, double? cpR, double? cpB}) {
    if (cpL == null && cpT == null && cpR == null && cpB == null) {
      return;
    } else {
      decoration = decoration.copyWith(
          contentPadding:
              EdgeInsets.fromLTRB(cpL ?? 0, cpT ?? 12, cpR ?? 0, cpB ?? 12),
          isDense: true);
      _design = EnumTextFieldType.rounded;
    }
  }
}
