import 'package:simple_widget_markup/simple_widget_markup.dart';

/// (en) Font settings assigned to individual elements for SpWML font style version 3.
/// (ja) SpWMLのフォントスタイルバージョン３に関して、個別の要素に割り当てられるフォントの設定です。
///
/// Author Masahide Mori
///
/// First edition creation date 2023-04-15 18:18:13
///
class SpWMLFontStyle {
  static const String className = 'SpWMLFontStyle';
  static const String version = '3';
  late Map<EnumSpWMLElementType, SpWMLFontStyleParams> styleMap;
  bool useV2MaterialStyle;
  bool isBtnColorModeV3;

  /// Constructor
  /// * [overrideMap] : (en) A map for overriding parameters.
  /// You can override the default parameters for keys set in the system.
  /// (ja) パラメータを上書きするためのマップです。
  /// システムに設定されたキーに対するデフォルトのパラメータを上書きできます。
  /// * [useV2MaterialStyle] : If true, load SpWMLFontStyle of material version2 style and material version3 style.
  /// If false, load default SpWMLFontStyle and material version3 style.
  /// * [isBtnColorModeV3] : If true, set button color null.
  SpWMLFontStyle({
    Map<EnumSpWMLElementType, SpWMLFontStyleParams>? overrideMap,
    this.useV2MaterialStyle = false,
    this.isBtnColorModeV3 = false,
  }) {
    styleMap = _loadDefaultMap();
    if (overrideMap != null) {
      for (EnumSpWMLElementType i in overrideMap.keys) {
        styleMap[i] = overrideMap[i]!;
      }
    }
  }

  /// (en) Constructor for use internal of deepCopy.
  /// Set the argument directly to the class.
  /// (ja) deepCopy の内部で使用するコンストラクター。
  ///引数を直接クラスに設定します。
  /// * [styleMap] : The font style map.
  /// * [useV2MaterialStyle] : If true, load SpWMLFontStyle of material version2 style and material version3 style.
  /// If false, load default SpWMLFontStyle and material version3 style.
  /// * [isBtnColorModeV3] : If true, set button color null.
  SpWMLFontStyle.copy(
    this.styleMap, {
    this.useV2MaterialStyle = false,
    this.isBtnColorModeV3 = false,
  });

  /// Loads the default styleMap.
  Map<EnumSpWMLElementType, SpWMLFontStyleParams> _loadDefaultMap() {
    Map<EnumSpWMLElementType, SpWMLFontStyleParams> r = {};
    // style v2
    if (useV2MaterialStyle) {
      UtilSpWMLFontStyleV2.setMaterialV2(r, isBtnColorModeV3);
    } else {
      // SpWML default style.
      UtilSpWMLFontStyleV2.setDefaultV2(r, isBtnColorModeV3);
    }
    // v3
    // The definition conforms to Google's Material Design 3.
    // https://m3.material.io/styles/typography/type-scale-tokens
    r[EnumSpWMLElementType.displayL] = SpWMLFontStyleParams(
      lineHeight: 64 / 57,
      fontSize: 57,
      letterSpacing: -0.25,
    );
    r[EnumSpWMLElementType.displayM] = SpWMLFontStyleParams(
      lineHeight: 52 / 45,
      fontSize: 45,
      letterSpacing: 0,
    );
    r[EnumSpWMLElementType.displayS] = SpWMLFontStyleParams(
      lineHeight: 44 / 36,
      fontSize: 36,
      letterSpacing: 0,
    );
    r[EnumSpWMLElementType.headlineL] = SpWMLFontStyleParams(
      lineHeight: 40 / 32,
      fontSize: 32,
      letterSpacing: 0,
    );
    r[EnumSpWMLElementType.headlineM] = SpWMLFontStyleParams(
      lineHeight: 36 / 28,
      fontSize: 28,
      letterSpacing: 0,
    );
    r[EnumSpWMLElementType.headlineS] = SpWMLFontStyleParams(
      lineHeight: 32 / 24,
      fontSize: 24,
      letterSpacing: 0,
    );
    r[EnumSpWMLElementType.titleL] = SpWMLFontStyleParams(
      lineHeight: 28 / 22,
      fontSize: 22,
      letterSpacing: 0,
    );
    r[EnumSpWMLElementType.titleM] = SpWMLFontStyleParams(
      lineHeight: 24 / 16,
      fontSize: 16,
      letterSpacing: 0.15,
      fontWeight: EnumFontWeight.w500,
    );
    r[EnumSpWMLElementType.titleS] = SpWMLFontStyleParams(
      lineHeight: 20 / 14,
      fontSize: 14,
      letterSpacing: 0.1,
      fontWeight: EnumFontWeight.w500,
    );
    r[EnumSpWMLElementType.labelL] = SpWMLFontStyleParams(
      lineHeight: 20 / 14,
      fontSize: 14,
      letterSpacing: 0.1,
      fontWeight: EnumFontWeight.w500,
    );
    r[EnumSpWMLElementType.labelM] = SpWMLFontStyleParams(
      lineHeight: 16 / 12,
      fontSize: 12,
      letterSpacing: 0.5,
      fontWeight: EnumFontWeight.w500,
    );
    r[EnumSpWMLElementType.labelS] = SpWMLFontStyleParams(
      lineHeight: 16 / 11,
      fontSize: 11,
      letterSpacing: 0.5,
      fontWeight: EnumFontWeight.w500,
    );
    r[EnumSpWMLElementType.bodyL] = SpWMLFontStyleParams(
      lineHeight: 24 / 16,
      fontSize: 16,
      letterSpacing: 0.5,
    );
    r[EnumSpWMLElementType.bodyM] = SpWMLFontStyleParams(
      lineHeight: 20 / 14,
      fontSize: 14,
      letterSpacing: 0.25,
    );
    r[EnumSpWMLElementType.bodyS] = SpWMLFontStyleParams(
      lineHeight: 16 / 12,
      fontSize: 12,
      letterSpacing: 0.4,
    );
    return r;
  }

  /// Get a deepCopy of this object.
  SpWMLFontStyle deepCopy() {
    Map<EnumSpWMLElementType, SpWMLFontStyleParams> copyMap = {};
    for (EnumSpWMLElementType i in styleMap.keys) {
      copyMap[i] = styleMap[i]!.deepCopy();
    }
    return SpWMLFontStyle.copy(copyMap);
  }

  /// Convert this object to a map.
  Map<String, dynamic> toDict() {
    Map<String, dynamic> d = {};
    d['class_name'] = className;
    d['version'] = version;
    Map<String, dynamic> convertedMap = {};
    for (EnumSpWMLElementType i in styleMap.keys) {
      convertedMap[i.name] = styleMap[i]!.toDict();
    }
    d['styleMap'] = convertedMap;
    return d;
  }

  /// Resume this object from map.
  static SpWMLFontStyle fromDict(Map<String, dynamic> src) {
    if (!src.containsKey('version')) {
      // 互換モードで読込
      return SpWMLFontStyle(
        overrideMap: UtilSpWMLFontStyleV2.convertFromV2(src),
      );
    } else {
      Map<EnumSpWMLElementType, SpWMLFontStyleParams> resumeMap = {};
      for (String i in src['styleMap'].keys) {
        resumeMap[EnumSpWMLElementType.values.byName(i)] =
            SpWMLFontStyleParams.fromDict(src['styleMap'][i]);
      }
      return SpWMLFontStyle.copy(resumeMap);
    }
  }
}
