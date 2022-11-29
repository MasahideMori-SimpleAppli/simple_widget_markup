import '../element_params/spwml_info.dart';
import '../spwml_exception.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-05-29 14:39:46
///
enum EnumTextFieldType { material, rounded }

extension EXTEnumTextFieldType on EnumTextFieldType {
  /// Convert string name.
  String toStr() {
    return toString().split('.').last;
  }

  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumTextFieldType fromStr(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    if (s == EnumTextFieldType.material.toStr()) {
      return EnumTextFieldType.material;
    } else if (s == EnumTextFieldType.rounded.toStr()) {
      return EnumTextFieldType.rounded;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd, info);
    }
  }
}

enum EnumTextFieldMode { normal, password, search, manual }

extension EXTEnumTextFieldMode on EnumTextFieldMode {
  /// Convert string name.
  String toStr() {
    return toString().split('.').last;
  }

  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumTextFieldMode fromStr(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    if (s == EnumTextFieldMode.normal.toStr()) {
      return EnumTextFieldMode.normal;
    } else if (s == EnumTextFieldMode.password.toStr()) {
      return EnumTextFieldMode.password;
    } else if (s == EnumTextFieldMode.search.toStr()) {
      return EnumTextFieldMode.search;
    } else if (s == EnumTextFieldMode.manual.toStr()) {
      return EnumTextFieldMode.manual;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd, info);
    }
  }
}
