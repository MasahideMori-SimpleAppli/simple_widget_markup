import '../element_params/spwml_info.dart';
import '../spwml_exception.dart';

///
/// (en) Definition of indicator type.
///
/// (ja) インジケーターの種類の定義です。
///
enum EnumIndicatorType { circular, linear }

/// EnumIndicatorType extension.
extension EXTEnumIndicatorType on EnumIndicatorType {
  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumIndicatorType fromStr(
    String s,
    int lineStart,
    int lineEnd,
    SpWMLInfo? info,
  ) {
    try {
      return EnumIndicatorType.values.byName(s);
    } catch (e) {
      throw SpWMLException(
        EnumSpWMLExceptionType.typeException,
        lineStart,
        lineEnd,
        info,
      );
    }
  }
}
