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
  bool useMaterial3 = false;

  static final SpWMLFontStyleManager _instance =
      SpWMLFontStyleManager._internal();

  factory SpWMLFontStyleManager() {
    return _instance;
  }

  SpWMLFontStyleManager._internal() {
    style = SpWMLFontStyle();
  }

  /// (en) Change the default style.
  ///
  /// (ja) デフォルトで設定されるスタイルを変更します。
  ///
  /// * [style] : new default style.
  void changeStyle(SpWMLFontStyle style) {
    this.style = style;
  }

  /// (en) Additional settings for Material 3.
  /// Enabling Material 3 mode internally works around some issues that occur with Material 3.
  /// However, some parameters become invalid, so disable them in some cases.
  /// Disabled by default.
  ///
  /// (ja) マテリアル３のための追加設定です。マテリアル３モードを有効にすると、
  /// マテリアル３で発生する一部の問題が内部的に回避されます。
  /// ただし、一部のパラメータが無効になるので、場合によっては無効にしてください。
  /// デフォルトでは無効です。
  ///
  /// * [useMaterial3] : If true, run Material3 mode.
  void setUseMaterial3(bool useMaterial3) {
    this.useMaterial3 = useMaterial3;
  }
}
