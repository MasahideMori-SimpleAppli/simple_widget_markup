///
/// (en)The default font style for SpWML.
/// (ja)SpWMLのデフォルトのフォントスタイルです。
///
/// Author Masahide Mori
///
/// First edition creation date 2022-01-04 01:42:54
///
class SpWMLFontStyle {
  final String className = 'SpWMLFontStyle';
  String? textFontName;
  String textColor;
  double textHeight;
  double textMTop;
  double hHeight;
  double hMTop;
  String? hrefFontName;
  String hrefColor;
  String hrefWeight;
  String hrefDeco;
  String hrefDecoStyle;
  double hrefDecoThickness;
  String h1Weight;
  double h1Size;
  double h1LetterSpacing;
  String h2Weight;
  double h2Size;
  double h2LetterSpacing;
  String h3Weight;
  double h3Size;
  double h3LetterSpacing;
  String h4Weight;
  double h4Size;
  double h4LetterSpacing;
  String h5Weight;
  double h5Size;
  double h5LetterSpacing;
  String h6Weight;
  double h6Size;
  double h6LetterSpacing;
  String subtitle1Weight;
  double subtitle1Size;
  double subtitle1LetterSpacing;
  String subtitle2Weight;
  double subtitle2Size;
  double subtitle2LetterSpacing;
  String body1Weight;
  double body1Size;
  double body1LetterSpacing;
  String body2Weight;
  double body2Size;
  double body2LetterSpacing;
  String buttonWeight;
  double buttonSize;
  double buttonLetterSpacing;
  String captionWeight;
  double captionSize;
  double captionLetterSpacing;
  String overlineWeight;
  double overlineSize;
  double overlineLetterSpacing;

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
  SpWMLFontStyle(
      {this.textFontName,
      this.textColor = "#DD000000",
      this.textHeight = 1.6,
      this.textMTop = 12.0,
      this.hHeight = 1.0,
      this.hMTop = 16.0,
      this.hrefFontName,
      this.hrefColor = "#FF2196F3",
      this.hrefWeight = "medium",
      this.hrefDeco = "underline",
      this.hrefDecoStyle = "solid",
      this.hrefDecoThickness = 1.0,
      this.h1Weight = "regular",
      this.h1Size = 72,
      this.h1LetterSpacing = -1.5,
      this.h2Weight = "regular",
      this.h2Size = 48,
      this.h2LetterSpacing = -0.5,
      this.h3Weight = "regular",
      this.h3Size = 38,
      this.h3LetterSpacing = 0,
      this.h4Weight = "regular",
      this.h4Size = 32,
      this.h4LetterSpacing = 0.25,
      this.h5Weight = "regular",
      this.h5Size = 24,
      this.h5LetterSpacing = 0.0,
      this.h6Weight = "regular",
      this.h6Size = 20,
      this.h6LetterSpacing = 0.15,
      this.subtitle1Weight = "regular",
      this.subtitle1Size = 14,
      this.subtitle1LetterSpacing = 0.15,
      this.subtitle2Weight = "regular",
      this.subtitle2Size = 12,
      this.subtitle2LetterSpacing = 0.1,
      this.body1Weight = "regular",
      this.body1Size = 18,
      this.body1LetterSpacing = 0.5,
      this.body2Weight = "regular",
      this.body2Size = 16,
      this.body2LetterSpacing = 0.25,
      this.buttonWeight = "medium",
      this.buttonSize = 16,
      this.buttonLetterSpacing = 1.25,
      this.captionWeight = "regular",
      this.captionSize = 14,
      this.captionLetterSpacing = 0.4,
      this.overlineWeight = "medium",
      this.overlineSize = 12,
      this.overlineLetterSpacing = 1.5});

  /// return deep copy.
  SpWMLFontStyle deepCopy() {
    return SpWMLFontStyle(
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
        buttonWeight: buttonWeight,
        buttonSize: buttonSize,
        buttonLetterSpacing: buttonLetterSpacing,
        captionWeight: captionWeight,
        captionSize: captionSize,
        captionLetterSpacing: captionLetterSpacing,
        overlineWeight: overlineWeight,
        overlineSize: overlineSize,
        overlineLetterSpacing: overlineLetterSpacing);
  }

  /// convert to map from this class.
  Map<String, dynamic> toDict() {
    Map<String, dynamic> d = {};
    d['class_name'] = className;
    d['textFontName'] = textFontName;
    d['textColor'] = textColor;
    d['textHeight'] = textHeight;
    d['textMTop'] = textMTop;
    d['hHeight'] = hHeight;
    d['hMTop'] = hMTop;
    d['hrefFontName'] = hrefFontName;
    d['hrefColor'] = hrefColor;
    d['hrefWeight'] = hrefWeight;
    d['hrefDeco'] = hrefDeco;
    d['hrefDecoStyle'] = hrefDecoStyle;
    d['hrefDecoThickness'] = hrefDecoThickness;
    d['h1Weight'] = h1Weight;
    d['h1Size'] = h1Size;
    d['h1LetterSpacing'] = h1LetterSpacing;
    d['h2Weight'] = h2Weight;
    d['h2Size'] = h2Size;
    d['h2LetterSpacing'] = h2LetterSpacing;
    d['h3Weight'] = h3Weight;
    d['h3Size'] = h3Size;
    d['h3LetterSpacing'] = h3LetterSpacing;
    d['h4Weight'] = h4Weight;
    d['h4Size'] = h4Size;
    d['h4LetterSpacing'] = h4LetterSpacing;
    d['h5Weight'] = h5Weight;
    d['h5Size'] = h5Size;
    d['h5LetterSpacing'] = h5LetterSpacing;
    d['h6Weight'] = h6Weight;
    d['h6Size'] = h6Size;
    d['h6LetterSpacing'] = h6LetterSpacing;
    d['subtitle1Weight'] = subtitle1Weight;
    d['subtitle1Size'] = subtitle1Size;
    d['subtitle1LetterSpacing'] = subtitle1LetterSpacing;
    d['subtitle2Weight'] = subtitle2Weight;
    d['subtitle2Size'] = subtitle2Size;
    d['subtitle2LetterSpacing'] = subtitle2LetterSpacing;
    d['body1Weight'] = body1Weight;
    d['body1Size'] = body1Size;
    d['body1LetterSpacing'] = body1LetterSpacing;
    d['body2Weight'] = body2Weight;
    d['body2Size'] = body2Size;
    d['body2LetterSpacing'] = body2LetterSpacing;
    d['buttonWeight'] = buttonWeight;
    d['buttonSize'] = buttonSize;
    d['buttonLetterSpacing'] = buttonLetterSpacing;
    d['captionWeight'] = captionWeight;
    d['captionSize'] = captionSize;
    d['captionLetterSpacing'] = captionLetterSpacing;
    d['overlineWeight'] = overlineWeight;
    d['overlineSize'] = overlineSize;
    d['overlineLetterSpacing'] = overlineLetterSpacing;
    return d;
  }

  /// create this class from map.
  static SpWMLFontStyle fromDict(Map<String, dynamic> src) {
    return SpWMLFontStyle(
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
        buttonWeight:
            src.containsKey('buttonWeight') ? src['buttonWeight'] : null,
        buttonSize: src.containsKey('buttonSize') ? src['buttonSize'] : null,
        buttonLetterSpacing: src.containsKey('buttonLetterSpacing')
            ? src['buttonLetterSpacing']
            : null,
        captionWeight: src['captionWeight'],
        captionSize: src['captionSize'],
        captionLetterSpacing: src['captionLetterSpacing'],
        overlineWeight: src['overlineWeight'],
        overlineSize: src['overlineSize'],
        overlineLetterSpacing: src['overlineLetterSpacing']);
  }
}
