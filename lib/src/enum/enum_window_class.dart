/// I created this enum with reference to:
/// https://m3.material.io/foundations/layout/applying-layout/window-size-classes
///
/// (en) Material 3 compliant window class definition.
/// Additional elements dialog and any are defined for convenience.
/// For convenience the additional elements dialog and any are also defined.
///
/// (ja) マテリアル３準拠のウィンドウクラスの定義。
/// 利便性のための追加の要素としてdialogとanyも定義されています。
enum EnumWindowClass { compact, medium, expanded, dialog, any }

/// EnumWindowClass extension.
extension EXTEnumWindowClass on EnumWindowClass {
  /// (en) Returns the appropriate window class for the screen width,
  /// excluding dialog and any.
  ///
  /// (ja) dialogとanyを除く、画面幅に対して適切なウィンドウクラスを返します。
  ///
  /// * [width] : The screen width.
  static EnumWindowClass getWindowClass(double width) {
    if (width < 600) {
      return EnumWindowClass.compact;
    } else if (width >= 600 && width < 840) {
      return EnumWindowClass.medium;
    } else {
      return EnumWindowClass.expanded;
    }
  }
}
