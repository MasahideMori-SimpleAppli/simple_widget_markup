import '../element_params/spwml_info.dart';
import '../spwml_exception.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-05-29 14:39:46
///
enum EnumTextFieldType { material, rounded }

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

enum EnumTextFieldMode {
  normal,
  password,
  passwordPrefix,
  search,
  searchPrefix,
  searchAndClear,
  manual
}

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
