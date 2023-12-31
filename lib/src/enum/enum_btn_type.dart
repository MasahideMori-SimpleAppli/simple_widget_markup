import '../element_params/spwml_info.dart';
import '../spwml_exception.dart';

///
/// (en) Definitions of button types that can be used in SpWML.
///
/// (ja) SpWMLで利用できるボタンの種類の定義です。
///
enum EnumBtnType {
  text,
  outlined,
  elevated,
  icon,
  iconFilled,
  iconFilledTonal,
  iconOutlined,
  block,
  filled,
  filledTonal,
  faSmall,
  faExtended,
  fa,
  faLarge
}

/// EnumBtnType extension.
extension EXTEnumBtnType on EnumBtnType {
  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumBtnType fromStr(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    try {
      return EnumBtnType.values.byName(s);
    } catch (e) {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd, info);
    }
  }
}
