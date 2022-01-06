import 'spwml_font_style.dart';

///
/// (en)The Material font style for SpWML.
/// (ja)SpWMLのMaterialフォントスタイルです。
///
/// Author Masahide Mori
///
/// First edition creation date 2022-01-04 02:13:22
///
class SpWMLFontStyleMaterial extends SpWMLFontStyle {
  /// Constructor
  /// * [textFontName] : default font name.
  /// * [textColor] : default font color.
  /// * [textHeight] : default body1, body2, height.
  /// * [textMTop] : default body1, body2, href margin top.
  /// * [hHeight] : default h1-h6 height.
  /// * [hMTop] : default h1-h6 margin top.
  /// * [hrefFontName] : href font name.
  /// * [hrefColor] : href font color.
  /// * [hrefWeight] : href font weight.
  /// * [hrefDeco] : href decoration.
  /// * [hrefDecoStyle] : href decoration style.
  /// * [hrefDecoThickness] : href decoration thickness.
  SpWMLFontStyleMaterial(
      {String? textFontName,
      String textColor = "#DD000000",
      double textHeight = 1.6,
      double textMTop = 12.0,
      double hHeight = 1.0,
      double hMTop = 16.0,
      String? hrefFontName,
      String hrefColor = "#FF2196F3",
      String hrefWeight = "regular",
      String hrefDeco = "underline",
      String hrefDecoStyle = "solid",
      double hrefDecoThickness = 1.0,
      String h1Weight = "light",
      double h1Size = 96,
      double h1LetterSpacing = -1.5,
      String h2Weight = "light",
      double h2Size = 60,
      double h2LetterSpacing = -0.5,
      String h3Weight = "regular",
      double h3Size = 48,
      double h3LetterSpacing = 0,
      String h4Weight = "regular",
      double h4Size = 34,
      double h4LetterSpacing = 0.25,
      String h5Weight = "regular",
      double h5Size = 24,
      double h5LetterSpacing = 0.0,
      String h6Weight = "medium",
      double h6Size = 20,
      double h6LetterSpacing = 0.15,
      String subtitle1Weight = "regular",
      double subtitle1Size = 16,
      double subtitle1LetterSpacing = 0.15,
      String subtitle2Weight = "medium",
      double subtitle2Size = 14,
      double subtitle2LetterSpacing = 0.1,
      String body1Weight = "regular",
      double body1Size = 16,
      double body1LetterSpacing = 0.5,
      String body2Weight = "regular",
      double body2Size = 14,
      double body2LetterSpacing = 0.25,
      String captionWeight = "regular",
      double captionSize = 12,
      double captionLetterSpacing = 0.4,
      String overlineWeight = "regular",
      double overlineSize = 10,
      double overlineLetterSpacing = 1.5})
      : super(
            textFontName: textFontName,
            textColor: textColor,
            textHeight: textHeight,
            textMTop: textMTop,
            hHeight: hHeight,
            hMTop: hMTop,
            hrefFontName: hrefFontName,
            hrefColor: hrefColor,
            hrefWeight: hrefWeight,
            hrefDeco: hrefDeco,
            hrefDecoStyle: hrefDecoStyle,
            hrefDecoThickness: hrefDecoThickness,
            h1Weight: h1Weight,
            h1Size: h1Size,
            h1LetterSpacing: h1LetterSpacing,
            h2Weight: h2Weight,
            h2Size: h2Size,
            h2LetterSpacing: h2LetterSpacing,
            h3Weight: h3Weight,
            h3Size: h3Size,
            h3LetterSpacing: h3LetterSpacing,
            h4Weight: h4Weight,
            h4Size: h4Size,
            h4LetterSpacing: h4LetterSpacing,
            h5Weight: h5Weight,
            h5Size: h5Size,
            h5LetterSpacing: h5LetterSpacing,
            h6Weight: h6Weight,
            h6Size: h6Size,
            h6LetterSpacing: h6LetterSpacing,
            subtitle1Weight: subtitle1Weight,
            subtitle1Size: subtitle1Size,
            subtitle1LetterSpacing: subtitle1LetterSpacing,
            subtitle2Weight: subtitle2Weight,
            subtitle2Size: subtitle2Size,
            subtitle2LetterSpacing: subtitle2LetterSpacing,
            body1Weight: body1Weight,
            body1Size: body1Size,
            body1LetterSpacing: body1LetterSpacing,
            body2Weight: body2Weight,
            body2Size: body2Size,
            body2LetterSpacing: body2LetterSpacing,
            captionWeight: captionWeight,
            captionSize: captionSize,
            captionLetterSpacing: captionLetterSpacing,
            overlineWeight: overlineWeight,
            overlineSize: overlineSize,
            overlineLetterSpacing: overlineLetterSpacing);

  @override
  SpWMLFontStyleMaterial deepCopy() {
    return SpWMLFontStyleMaterial(
        textFontName: textFontName,
        textColor: textColor,
        textHeight: textHeight,
        textMTop: textMTop,
        hHeight: hHeight,
        hMTop: hMTop,
        hrefFontName: hrefFontName,
        hrefColor: hrefColor,
        hrefWeight: hrefWeight,
        hrefDeco: hrefDeco,
        hrefDecoStyle: hrefDecoStyle,
        hrefDecoThickness: hrefDecoThickness,
        h1Weight: h1Weight,
        h1Size: h1Size,
        h1LetterSpacing: h1LetterSpacing,
        h2Weight: h2Weight,
        h2Size: h2Size,
        h2LetterSpacing: h2LetterSpacing,
        h3Weight: h3Weight,
        h3Size: h3Size,
        h3LetterSpacing: h3LetterSpacing,
        h4Weight: h4Weight,
        h4Size: h4Size,
        h4LetterSpacing: h4LetterSpacing,
        h5Weight: h5Weight,
        h5Size: h5Size,
        h5LetterSpacing: h5LetterSpacing,
        h6Weight: h6Weight,
        h6Size: h6Size,
        h6LetterSpacing: h6LetterSpacing,
        subtitle1Weight: subtitle1Weight,
        subtitle1Size: subtitle1Size,
        subtitle1LetterSpacing: subtitle1LetterSpacing,
        subtitle2Weight: subtitle2Weight,
        subtitle2Size: subtitle2Size,
        subtitle2LetterSpacing: subtitle2LetterSpacing,
        body1Weight: body1Weight,
        body1Size: body1Size,
        body1LetterSpacing: body1LetterSpacing,
        body2Weight: body2Weight,
        body2Size: body2Size,
        body2LetterSpacing: body2LetterSpacing,
        captionWeight: captionWeight,
        captionSize: captionSize,
        captionLetterSpacing: captionLetterSpacing,
        overlineWeight: overlineWeight,
        overlineSize: overlineSize,
        overlineLetterSpacing: overlineLetterSpacing);
  }

  /// create this class from map.
  static SpWMLFontStyleMaterial fromDict(Map<String, dynamic> src) {
    return SpWMLFontStyleMaterial(
        textFontName: src['textFontName'],
        textColor: src['textColor'],
        textHeight: src['textHeight'],
        textMTop: src['textMTop'],
        hHeight: src['hHeight'],
        hMTop: src['hMTop'],
        hrefFontName: src['hrefFontName'],
        hrefColor: src['hrefColor'],
        hrefWeight: src['hrefWeight'],
        hrefDeco: src['hrefDeco'],
        hrefDecoStyle: src['hrefDecoStyle'],
        hrefDecoThickness: src['hrefDecoThickness'],
        h1Weight: src['h1Weight'],
        h1Size: src['h1Size'],
        h1LetterSpacing: src['h1LetterSpacing'],
        h2Weight: src['h2Weight'],
        h2Size: src['h2Size'],
        h2LetterSpacing: src['h2LetterSpacing'],
        h3Weight: src['h3Weight'],
        h3Size: src['h3Size'],
        h3LetterSpacing: src['h3LetterSpacing'],
        h4Weight: src['h4Weight'],
        h4Size: src['h4Size'],
        h4LetterSpacing: src['h4LetterSpacing'],
        h5Weight: src['h5Weight'],
        h5Size: src['h5Size'],
        h5LetterSpacing: src['h5LetterSpacing'],
        h6Weight: src['h6Weight'],
        h6Size: src['h6Size'],
        h6LetterSpacing: src['h6LetterSpacing'],
        subtitle1Weight: src['subtitle1Weight'],
        subtitle1Size: src['subtitle1Size'],
        subtitle1LetterSpacing: src['subtitle1LetterSpacing'],
        subtitle2Weight: src['subtitle2Weight'],
        subtitle2Size: src['subtitle2Size'],
        subtitle2LetterSpacing: src['subtitle2LetterSpacing'],
        body1Weight: src['body1Weight'],
        body1Size: src['body1Size'],
        body1LetterSpacing: src['body1LetterSpacing'],
        body2Weight: src['body2Weight'],
        body2Size: src['body2Size'],
        body2LetterSpacing: src['body2LetterSpacing'],
        captionWeight: src['captionWeight'],
        captionSize: src['captionSize'],
        captionLetterSpacing: src['captionLetterSpacing'],
        overlineWeight: src['overlineWeight'],
        overlineSize: src['overlineSize'],
        overlineLetterSpacing: src['overlineLetterSpacing']);
  }
}
