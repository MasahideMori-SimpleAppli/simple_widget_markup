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
  filledTonal
}

extension EXTEnumBtnType on EnumBtnType {
  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumBtnType fromStr(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    if (s == EnumBtnType.text.name) {
      return EnumBtnType.text;
    } else if (s == EnumBtnType.outlined.name) {
      return EnumBtnType.outlined;
    } else if (s == EnumBtnType.elevated.name) {
      return EnumBtnType.elevated;
    } else if (s == EnumBtnType.icon.name) {
      return EnumBtnType.icon;
    } else if (s == EnumBtnType.iconFilled.name) {
      return EnumBtnType.iconFilled;
    } else if (s == EnumBtnType.iconFilledTonal.name) {
      return EnumBtnType.iconFilledTonal;
    } else if (s == EnumBtnType.iconOutlined.name) {
      return EnumBtnType.iconOutlined;
    } else if (s == EnumBtnType.block.name) {
      return EnumBtnType.block;
    } else if (s == EnumBtnType.filled.name) {
      return EnumBtnType.filled;
    } else if (s == EnumBtnType.filledTonal.name) {
      return EnumBtnType.filledTonal;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd, info);
    }
  }
}
