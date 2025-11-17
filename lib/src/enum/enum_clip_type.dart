import '../element_params/spwml_info.dart';
import '../spwml_exception.dart';

///
/// (en) Definition of Clipping type.
///
/// (ja) Clippingの種類の定義です。
///
enum EnumClipType { none, oval, rRect }

/// EnumClipType extension.
extension EXTEnumClipType on EnumClipType {
  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumClipType fromStr(
    String s,
    int lineStart,
    int lineEnd,
    SpWMLInfo? info,
  ) {
    try {
      return EnumClipType.values.byName(s);
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
