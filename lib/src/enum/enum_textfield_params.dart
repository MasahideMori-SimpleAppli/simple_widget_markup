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
    if (s == EnumTextFieldType.material.name) {
      return EnumTextFieldType.material;
    } else if (s == EnumTextFieldType.rounded.name) {
      return EnumTextFieldType.rounded;
    } else {
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
    if (s == EnumTextFieldMode.normal.name) {
      return EnumTextFieldMode.normal;
    } else if (s == EnumTextFieldMode.password.name) {
      return EnumTextFieldMode.password;
    } else if (s == EnumTextFieldMode.passwordPrefix.name) {
      return EnumTextFieldMode.passwordPrefix;
    } else if (s == EnumTextFieldMode.search.name) {
      return EnumTextFieldMode.search;
    } else if (s == EnumTextFieldMode.searchPrefix.name) {
      return EnumTextFieldMode.searchPrefix;
    } else if (s == EnumTextFieldMode.searchAndClear.name) {
      return EnumTextFieldMode.searchAndClear;
    } else if (s == EnumTextFieldMode.manual.name) {
      return EnumTextFieldMode.manual;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd, info);
    }
  }
}
