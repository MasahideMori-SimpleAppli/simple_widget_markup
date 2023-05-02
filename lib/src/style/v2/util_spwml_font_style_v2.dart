import '../../../simple_widget_markup.dart';

/// (en) A utility for compatibility with SpWML font style version 2.
/// (ja) SpWMLのフォントスタイルバージョン２との互換性のためのユーティリティです。
///
/// Author Masahide Mori
///
/// First edition creation date 2023-04-29 00:57:09
///
class UtilSpWMLFontStyleV2 {
  /// set material V2 params to map.
  /// * [r] : override map.
  /// * [isBtnColorModeV3] : If true, set button color null.
  static void setMaterialV2(Map<EnumSpWMLElementType, SpWMLFontStyleParams> r,
      bool isBtnColorModeV3) {
    // common
    r[EnumSpWMLElementType.href] = SpWMLFontStyleParams(
        mT: 0,
        lineHeight: 1.6,
        fontSize: 16,
        letterSpacing: 0.5,
        fontWeight: EnumFontWeight.regular,
        textColor: "#FF2196F3",
        textDeco: EnumTextDecoration.underline,
        textDecoStyle: EnumTextDecorationStyle.solid,
        textDecoThickness: 1.0,
        textDecoColor: "#FF2196F3");
    r[EnumSpWMLElementType.text] = SpWMLFontStyleParams(
        mT: 12,
        lineHeight: 1.6,
        fontSize: 16,
        letterSpacing: 0.5,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.menu] = SpWMLFontStyleParams(
        mT: 0,
        lineHeight: 1.0,
        fontSize: 16,
        letterSpacing: 0.5,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.ruby] = SpWMLFontStyleParams(
        mT: 0,
        lineHeight: 1.0,
        fontSize: 16,
        letterSpacing: 0.5,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    // material v2
    r[EnumSpWMLElementType.btn] = SpWMLFontStyleParams(
        mT: 0,
        lineHeight: 1.0,
        fontSize: 16,
        letterSpacing: 0.5,
        fontWeight: EnumFontWeight.medium,
        textColor: isBtnColorModeV3 ? null : "#DD000000");
    r[EnumSpWMLElementType.h1] = SpWMLFontStyleParams(
        mT: 16,
        lineHeight: 1.0,
        fontSize: 96,
        letterSpacing: -1.5,
        fontWeight: EnumFontWeight.light,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.h2] = SpWMLFontStyleParams(
        mT: 16,
        lineHeight: 1.0,
        fontSize: 60,
        letterSpacing: -0.5,
        fontWeight: EnumFontWeight.light,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.h3] = SpWMLFontStyleParams(
        mT: 16,
        lineHeight: 1.0,
        fontSize: 48,
        letterSpacing: 0,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.h4] = SpWMLFontStyleParams(
        mT: 16,
        lineHeight: 1.0,
        fontSize: 34,
        letterSpacing: 0.25,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.h5] = SpWMLFontStyleParams(
        mT: 16,
        lineHeight: 1.0,
        fontSize: 24,
        letterSpacing: 0,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.h6] = SpWMLFontStyleParams(
        mT: 16,
        lineHeight: 1.0,
        fontSize: 20,
        letterSpacing: 0.15,
        fontWeight: EnumFontWeight.medium,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.subtitle1] = SpWMLFontStyleParams(
        mT: 0,
        lineHeight: 1.0,
        fontSize: 16,
        letterSpacing: 0.15,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.subtitle2] = SpWMLFontStyleParams(
        mT: 0,
        lineHeight: 1.0,
        fontSize: 14,
        letterSpacing: 0.1,
        fontWeight: EnumFontWeight.medium,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.body1] = SpWMLFontStyleParams(
        mT: 12,
        lineHeight: 1.6,
        fontSize: 16,
        letterSpacing: 0.5,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.body2] = SpWMLFontStyleParams(
        mT: 12,
        lineHeight: 1.6,
        fontSize: 14,
        letterSpacing: 0.25,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.caption] = SpWMLFontStyleParams(
        mT: 0,
        lineHeight: 1.0,
        fontSize: 12,
        letterSpacing: 0.4,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.overline] = SpWMLFontStyleParams(
        mT: 0,
        lineHeight: 1.0,
        fontSize: 10,
        letterSpacing: 1.5,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
  }

  /// set default V2 params to map.
  /// * [r] : override map.
  /// * [isBtnColorModeV3] : If true, set button color null.
  static void setDefaultV2(Map<EnumSpWMLElementType, SpWMLFontStyleParams> r,
      bool isBtnColorModeV3) {
    // common
    r[EnumSpWMLElementType.href] = SpWMLFontStyleParams(
        mT: 0,
        lineHeight: 1.6,
        fontSize: 18,
        letterSpacing: 0.5,
        fontWeight: EnumFontWeight.medium,
        textColor: "#FF2196F3",
        textDeco: EnumTextDecoration.underline,
        textDecoStyle: EnumTextDecorationStyle.solid,
        textDecoThickness: 1.0,
        textDecoColor: "#FF2196F3");
    r[EnumSpWMLElementType.text] = SpWMLFontStyleParams(
        mT: 12,
        lineHeight: 1.6,
        fontSize: 18,
        letterSpacing: 0.5,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.menu] = SpWMLFontStyleParams(
        mT: 0,
        lineHeight: 1.0,
        fontSize: 18,
        letterSpacing: 0.5,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.ruby] = SpWMLFontStyleParams(
        mT: 0,
        lineHeight: 1.0,
        fontSize: 18,
        letterSpacing: 0.5,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    // material v2
    r[EnumSpWMLElementType.btn] = SpWMLFontStyleParams(
        mT: 0,
        lineHeight: 1.0,
        fontSize: 18,
        letterSpacing: 0.5,
        fontWeight: EnumFontWeight.medium,
        textColor: isBtnColorModeV3 ? null : "#DD000000");
    r[EnumSpWMLElementType.h1] = SpWMLFontStyleParams(
        mT: 16,
        lineHeight: 1.0,
        fontSize: 72,
        letterSpacing: -1.5,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.h2] = SpWMLFontStyleParams(
        mT: 16,
        lineHeight: 1.0,
        fontSize: 48,
        letterSpacing: -0.5,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.h3] = SpWMLFontStyleParams(
        mT: 16,
        lineHeight: 1.0,
        fontSize: 38,
        letterSpacing: 0,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.h4] = SpWMLFontStyleParams(
        mT: 16,
        lineHeight: 1.0,
        fontSize: 32,
        letterSpacing: 0.25,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.h5] = SpWMLFontStyleParams(
        mT: 16,
        lineHeight: 1.0,
        fontSize: 24,
        letterSpacing: 0,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.h6] = SpWMLFontStyleParams(
        mT: 16,
        lineHeight: 1.0,
        fontSize: 20,
        letterSpacing: 0.15,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.subtitle1] = SpWMLFontStyleParams(
        mT: 0,
        lineHeight: 1.0,
        fontSize: 14,
        letterSpacing: 0.15,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.subtitle2] = SpWMLFontStyleParams(
        mT: 0,
        lineHeight: 1.0,
        fontSize: 12,
        letterSpacing: 0.1,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.body1] = SpWMLFontStyleParams(
        mT: 12,
        lineHeight: 1.6,
        fontSize: 18,
        letterSpacing: 0.5,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.body2] = SpWMLFontStyleParams(
        mT: 12,
        lineHeight: 1.6,
        fontSize: 16,
        letterSpacing: 0.25,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.caption] = SpWMLFontStyleParams(
        mT: 0,
        lineHeight: 1.0,
        fontSize: 14,
        letterSpacing: 0.4,
        fontWeight: EnumFontWeight.regular,
        textColor: "#DD000000");
    r[EnumSpWMLElementType.overline] = SpWMLFontStyleParams(
        mT: 0,
        lineHeight: 1.0,
        fontSize: 12,
        letterSpacing: 1.5,
        fontWeight: EnumFontWeight.medium,
        textColor: "#DD000000");
  }

  /// (en) Generate OverrideMap for version 3 from SpWML font style version 2 saved data.
  ///
  /// (ja) SpWMLのフォントスタイルバージョン２の保存データからバージョン３用のOverrideMapを生成します。
  ///
  /// * [src] : The data of v2.
  static Map<EnumSpWMLElementType, SpWMLFontStyleParams> convertFromV2(
      Map<String, dynamic> src) {
    Map<EnumSpWMLElementType, SpWMLFontStyleParams> r = {};
    String textFontName = src['textFontName'];
    String textColor = src['textColor'];
    double lineHeight = src['textHeight'];
    double textMTop = src['textMTop'];
    double hHeight = src['hHeight'];
    double hMTop = double.parse(src['hMTop'].toString());
    // common
    r[EnumSpWMLElementType.href] = SpWMLFontStyleParams(
        fontFamily: src['hrefFontName'],
        mT: textMTop,
        lineHeight: lineHeight,
        fontSize: src['body1Size'],
        letterSpacing: src['body1LetterSpacing'],
        fontWeight: EnumFontWeight.values.byName(src['hrefWeight']),
        textColor: src['hrefColor'],
        textDeco: EnumTextDecoration.values.byName(src['hrefDeco']),
        textDecoStyle:
            EnumTextDecorationStyle.values.byName(src['hrefDecoStyle']),
        textDecoThickness: src['hrefDecoThickness'],
        textDecoColor: src['hrefColor']);
    r[EnumSpWMLElementType.text] = SpWMLFontStyleParams(
        fontFamily: textFontName,
        mT: textMTop,
        lineHeight: lineHeight,
        fontSize: src['body1Size'],
        letterSpacing: src['body1LetterSpacing'],
        fontWeight: EnumFontWeight.values.byName(src['body1Weight']),
        textColor: textColor);
    r[EnumSpWMLElementType.menu] = SpWMLFontStyleParams(
        fontFamily: textFontName,
        mT: 0,
        lineHeight: lineHeight,
        fontSize: src['body1Size'],
        letterSpacing: src['body1LetterSpacing'],
        fontWeight: EnumFontWeight.values.byName(src['body1Weight']),
        textColor: textColor);
    r[EnumSpWMLElementType.ruby] = SpWMLFontStyleParams(
        fontFamily: textFontName,
        mT: 0,
        lineHeight: lineHeight,
        fontSize: src['body1Size'],
        letterSpacing: src['body1LetterSpacing'],
        fontWeight: EnumFontWeight.values.byName(src['body1Weight']),
        textColor: textColor);
    r[EnumSpWMLElementType.btn] = SpWMLFontStyleParams(
        fontFamily: textFontName,
        mT: 0,
        lineHeight: 1.0,
        fontSize: src['buttonSize'],
        letterSpacing: src['buttonLetterSpacing'],
        fontWeight: EnumFontWeight.values.byName(src['buttonWeight']),
        textColor: textColor);
    // material v2
    r[EnumSpWMLElementType.h1] = SpWMLFontStyleParams(
        fontFamily: textFontName,
        mT: hMTop,
        lineHeight: hHeight,
        fontSize: src['h1Size'],
        letterSpacing: src['h1LetterSpacing'],
        fontWeight: EnumFontWeight.values.byName(src['h1Weight']),
        textColor: textColor);
    r[EnumSpWMLElementType.h2] = SpWMLFontStyleParams(
        fontFamily: textFontName,
        mT: hMTop,
        lineHeight: hHeight,
        fontSize: src['h2Size'],
        letterSpacing: src['h2LetterSpacing'],
        fontWeight: EnumFontWeight.values.byName(src['h2Weight']),
        textColor: textColor);
    r[EnumSpWMLElementType.h3] = SpWMLFontStyleParams(
        fontFamily: textFontName,
        mT: hMTop,
        lineHeight: hHeight,
        fontSize: src['h3Size'],
        letterSpacing: src['h3LetterSpacing'],
        fontWeight: EnumFontWeight.values.byName(src['h3Weight']),
        textColor: textColor);
    r[EnumSpWMLElementType.h4] = SpWMLFontStyleParams(
        fontFamily: textFontName,
        mT: hMTop,
        lineHeight: hHeight,
        fontSize: src['h4Size'],
        letterSpacing: src['h4LetterSpacing'],
        fontWeight: EnumFontWeight.values.byName(src['h4Weight']),
        textColor: textColor);
    r[EnumSpWMLElementType.h5] = SpWMLFontStyleParams(
        fontFamily: textFontName,
        mT: hMTop,
        lineHeight: hHeight,
        fontSize: src['h5Size'],
        letterSpacing: src['h5LetterSpacing'],
        fontWeight: EnumFontWeight.values.byName(src['h5Weight']),
        textColor: textColor);
    r[EnumSpWMLElementType.h6] = SpWMLFontStyleParams(
        fontFamily: textFontName,
        mT: hMTop,
        lineHeight: hHeight,
        fontSize: src['h6Size'],
        letterSpacing: src['h6LetterSpacing'],
        fontWeight: EnumFontWeight.values.byName(src['h6Weight']),
        textColor: textColor);
    r[EnumSpWMLElementType.subtitle1] = SpWMLFontStyleParams(
        fontFamily: textFontName,
        mT: 0,
        lineHeight: 1.0,
        fontSize: src['subtitle1Size'],
        letterSpacing: src['subtitle1LetterSpacing'],
        fontWeight: EnumFontWeight.values.byName(src['subtitle1Weight']),
        textColor: textColor);
    r[EnumSpWMLElementType.subtitle2] = SpWMLFontStyleParams(
        fontFamily: textFontName,
        mT: 0,
        lineHeight: 1.0,
        fontSize: src['subtitle2Size'],
        letterSpacing: src['subtitle2LetterSpacing'],
        fontWeight: EnumFontWeight.values.byName(src['subtitle2Weight']),
        textColor: textColor);
    r[EnumSpWMLElementType.body1] = SpWMLFontStyleParams(
        fontFamily: textFontName,
        mT: textMTop,
        lineHeight: lineHeight,
        fontSize: src['body1Size'],
        letterSpacing: src['body1LetterSpacing'],
        fontWeight: EnumFontWeight.values.byName(src['body1Weight']),
        textColor: textColor);
    r[EnumSpWMLElementType.body2] = SpWMLFontStyleParams(
        fontFamily: textFontName,
        mT: textMTop,
        lineHeight: lineHeight,
        fontSize: src['body2Size'],
        letterSpacing: src['body2LetterSpacing'],
        fontWeight: EnumFontWeight.values.byName(src['body2Weight']),
        textColor: textColor);
    r[EnumSpWMLElementType.caption] = SpWMLFontStyleParams(
        fontFamily: textFontName,
        mT: 0,
        lineHeight: 1.0,
        fontSize: src['captionSize'],
        letterSpacing: src['captionLetterSpacing'],
        fontWeight: EnumFontWeight.values.byName(src['captionWeight']),
        textColor: textColor);
    r[EnumSpWMLElementType.overline] = SpWMLFontStyleParams(
        fontFamily: textFontName,
        mT: 0,
        lineHeight: 1.0,
        fontSize: src['overlineSize'],
        letterSpacing: src['overlineLetterSpacing'],
        fontWeight: EnumFontWeight.values.byName(src['overlineWeight']),
        textColor: textColor);
    return r;
  }
}
