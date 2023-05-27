import '../element_params/spwml_info.dart';
import '../spwml_exception.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-02-09 20:27:34
///
enum EnumImgType { network, asset, memory }

extension EXTEnumImgType on EnumImgType {
  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumImgType fromStr(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    try {
      return EnumImgType.values.byName(s);
    } catch (e) {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd, info);
    }
  }
}
