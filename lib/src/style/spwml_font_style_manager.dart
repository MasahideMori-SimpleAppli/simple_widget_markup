import '../../simple_widget_markup.dart';

///
/// (en) A manager class for setting default values for font styles that works as a singleton.
///
/// (ja) シングルトンで動作する、フォントスタイルのデフォルト値を設定するためのマネージャクラスです。
///
/// Author Masahide Mori
///
/// First edition creation date 2023-04-22 14:46:59
///

class SpWMLFontStyleManager {
  late SpWMLFontStyle style;

  static final SpWMLFontStyleManager _instance =
      SpWMLFontStyleManager._internal();

  factory SpWMLFontStyleManager() {
    return _instance;
  }

  SpWMLFontStyleManager._internal() {
    style = SpWMLFontStyle();
  }

  void changeStyle(SpWMLFontStyle style) {
    this.style = style;
  }
}
