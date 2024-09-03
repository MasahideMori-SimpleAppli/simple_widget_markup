import 'package:flutter/services.dart';
import 'package:simple_widget_markup/src/element/sub/text/input_formatters/money_input_formatter.dart';

import '../element_params/spwml_info.dart';
import '../spwml_exception.dart';

///
/// (en) This file defines the types of text fields available in SpWML.
///
/// (ja) このファイルではSpWMLで利用可能なテキストフィールドの種類を定義しています。
///
enum EnumTextFieldType { material, rounded }

/// EnumTextFieldType extension.
extension EXTEnumTextFieldType on EnumTextFieldType {
  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumTextFieldType fromStr(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    try {
      return EnumTextFieldType.values.byName(s);
    } catch (e) {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd, info);
    }
  }
}

///
/// (en) This file defines the modes of text fields available in SpWML.
///
/// (ja) このファイルではSpWMLで利用可能なテキストフィールドのモードを定義しています。
///
enum EnumTextFieldMode {
  normal,
  password,
  passwordPrefix,
  search,
  searchPrefix,
  searchAndClear,
  manual
}

/// EnumTextFieldMode extension.
extension EXTEnumTextFieldMode on EnumTextFieldMode {
  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumTextFieldMode fromStr(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    try {
      return EnumTextFieldMode.values.byName(s);
    } catch (e) {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd, info);
    }
  }
}

///
/// (en) This file defines the input type of text fields available in SpWML.
///
/// (ja) このファイルではSpWMLで利用可能なテキストフィールドの入力タイプを定義しています。
///
enum EnumTextFieldInputType {
  normal,
  intOnly,
  numOnly,
  money,
  moneyWithDecimal
}

/// EnumTextFieldInputType extension.
extension EXTEnumTextFieldInputType on EnumTextFieldInputType {
  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumTextFieldInputType fromStr(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    try {
      return EnumTextFieldInputType.values.byName(s);
    } catch (e) {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd, info);
    }
  }

  /// Convert TextInputFormatter.
  List<TextInputFormatter>? toTextInputFormatter() {
    switch (this) {
      case EnumTextFieldInputType.normal:
        return null;
      case EnumTextFieldInputType.intOnly:
        return [FilteringTextInputFormatter.digitsOnly];
      case EnumTextFieldInputType.numOnly:
        return [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))];
      case EnumTextFieldInputType.money:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[\d,]')),
          MoneyInputFormatter()
        ];
      case EnumTextFieldInputType.moneyWithDecimal:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*([,]\d*)*(\.\d*)?$')),
          MoneyInputFormatter()
        ];
    }
  }
}

///
/// (en) This file defines the Keyboard type of text fields available in SpWML.
///
/// (ja) このファイルではSpWMLで利用可能なテキストフィールドのキーボードタイプを定義しています。
///
enum EnumTextFieldKeyboardType {
  text,
  multiline,
  number,
  phone,
  datetime,
  emailAddress,
  url,
  visiblePassword,
  name,
  streetAddress,
  none,
}

/// EnumTextFieldKeyboardType extension.
extension EXTEnumTextFieldKeyboardType on EnumTextFieldKeyboardType {
  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumTextFieldKeyboardType fromStr(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    try {
      return EnumTextFieldKeyboardType.values.byName(s);
    } catch (e) {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd, info);
    }
  }

  /// Convert to TextInputType.
  TextInputType toTextInputType() {
    try {
      return TextInputType
          .values[EnumTextFieldKeyboardType.values.indexOf(this)];
    } catch (e) {
      return TextInputType.text;
    }
  }
}
