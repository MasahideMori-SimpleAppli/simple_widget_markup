import '../element_params/spwml_info.dart';
import '../spwml_exception.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2023-02-06 19:55:21
///
enum EnumIndicatorType { circular, linear }

extension EXTEnumIndicatorType on EnumIndicatorType {
  /// Convert string name.
  String toStr() {
    return toString().split('.').last;
  }

  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumIndicatorType fromStr(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    if (s == EnumIndicatorType.circular.toStr()) {
      return EnumIndicatorType.circular;
    } else if (s == EnumIndicatorType.linear.toStr()) {
      return EnumIndicatorType.linear;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd, info);
    }
  }
}
