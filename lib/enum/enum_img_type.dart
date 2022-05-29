import '../spwml_exception.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-02-09 20:27:34
///
enum EnumImgType { network, asset }

extension EXTEnumImgType on EnumImgType {
  String toStr() {
    return toString().split('.').last;
  }

  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumImgType fromStr(String s, int lineStart, int lineEnd) {
    if (s == EnumImgType.network.toStr()) {
      return EnumImgType.network;
    } else if (s == EnumImgType.asset.toStr()) {
      return EnumImgType.asset;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd);
    }
  }
}
