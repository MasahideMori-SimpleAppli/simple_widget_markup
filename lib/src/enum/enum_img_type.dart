import '../element_params/spwml_info.dart';
import '../spwml_exception.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-02-09 20:27:34
///
enum EnumImgType { network, asset, memory }

extension EXTEnumImgType on EnumImgType {
  /// Convert string name.
  String toStr() {
    return toString().split('.').last;
  }

  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumImgType fromStr(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    if (s == EnumImgType.network.toStr()) {
      return EnumImgType.network;
    } else if (s == EnumImgType.asset.toStr()) {
      return EnumImgType.asset;
    } else if (s == EnumImgType.memory.toStr()) {
      return EnumImgType.memory;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd, info);
    }
  }
}
