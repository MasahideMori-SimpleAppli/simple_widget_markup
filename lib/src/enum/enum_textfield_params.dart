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
