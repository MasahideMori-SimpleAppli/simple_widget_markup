/// (en) I created this enum with reference to:
/// https://m3.material.io/foundations/layout/applying-layout/window-size-classes
///
/// Material 3-compliant window class definition.
/// This is a version that adds large and extraLarge to the existing
/// EnumWindowClass,
/// in line with the Material Design revisions expected around 2025.
/// For convenience the additional elements dialog and any are also defined.
///
/// (ja) マテリアル３準拠のウィンドウクラスの定義。
/// これは、2025年ごろのマテリアルデザインの改定に合わせ、
/// 従来のEnumWindowClassにlargeとextraLargeが追加されたバージョンです。
/// 利便性のための追加の要素としてdialogとanyも定義されている。
enum EnumWindowClassAdaptive {
  compact,
  medium,
  expanded,
  large,
  extraLarge,
  dialog,
  any
}

/// EnumWindowClassAdaptive extension.
extension EXTEnumWindowClassAdaptive on EnumWindowClassAdaptive {
  /// (en) Returns the appropriate window class for the screen width,
  /// excluding dialog and any.
  ///
  /// (ja) dialogとanyを除く、画面幅に対して適切なウィンドウクラスを返します。
  ///
  /// * [width] : The screen width.
  static EnumWindowClassAdaptive getWindowClass(double width) {
    if (width < 600) {
      return EnumWindowClassAdaptive.compact;
    } else if (width >= 600 && width < 840) {
      return EnumWindowClassAdaptive.medium;
    } else if (width >= 840 && width < 1200) {
      return EnumWindowClassAdaptive.expanded;
    } else if (width >= 1200 && width < 1600) {
      return EnumWindowClassAdaptive.large;
    } else {
      return EnumWindowClassAdaptive.extraLarge;
    }
  }
}
