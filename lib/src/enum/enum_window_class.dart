/// (en) I created this enum with reference to:
/// https://m3.material.io/foundations/layout/applying-layout/window-size-classes
/// The any class was added for convenience when writing layout files.
/// For convenience the additional elements dialog and any are also defined.
///
/// (ja) マテリアル３準拠のウィンドウクラスの定義。
/// 利便性のための追加の要素としてdialogとanyも定義されている。
enum EnumWindowClass { compact, medium, expanded, dialog, any }

/// EnumWindowClass extension.
extension EXTEnumWindowClass on EnumWindowClass {
  /// (en) Returns the appropriate window class based on the specified screen size.
  /// However, "EnumWindowClass.any" is not considered here.
  /// The return value is selected from other classes.
  ///
  /// (ja) EnumWindowClass.anyを除く、画面幅に対して適切なウィンドウクラスを返します。
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
