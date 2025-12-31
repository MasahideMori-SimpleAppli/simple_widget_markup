import 'package:simple_widget_markup/simple_widget_markup.dart';

///
/// (en) Definition of the type of image data acquisition source.
///
/// (ja) 画像データ取得元の種類の定義です。
///
enum EnumImgType { network, asset, memory }

/// EnumImgType extension.
extension EXTEnumImgType on EnumImgType {
  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumImgType fromStr(
    String s,
    int lineStart,
    int lineEnd,
    SpWMLInfo? info,
  ) {
    try {
      return EnumImgType.values.byName(s);
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
