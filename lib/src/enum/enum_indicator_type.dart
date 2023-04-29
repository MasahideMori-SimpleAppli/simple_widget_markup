import '../element_params/spwml_info.dart';
import '../spwml_exception.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-02-09 20:27:34
///
enum EnumIndicatorType { circular, linear }

extension EXTEnumIndicatorType on EnumIndicatorType {
  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumIndicatorType fromStr(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    if (s == EnumIndicatorType.circular.name) {
      return EnumIndicatorType.circular;
    } else if (s == EnumIndicatorType.linear.name) {
      return EnumIndicatorType.linear;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd, info);
    }
  }
}