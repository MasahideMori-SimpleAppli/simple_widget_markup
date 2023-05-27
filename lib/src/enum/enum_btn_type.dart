import '../element_params/spwml_info.dart';
import '../spwml_exception.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-02-09 20:27:34
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
