import '../enum/enum_font_style.dart';
import '../enum/enum_font_weight.dart';
import '../enum/enum_text_decoration.dart';
import '../enum/enum_text_decoration_style.dart';

/// (en) Font settings assigned to individual elements for SpWML font style version 3.
/// (ja) SpWMLのフォントスタイルバージョン３に関して、個別の要素に割り当てられるフォントの設定です。
///
/// Author Masahide Mori
///
/// First edition creation date 2023-04-15 18:18:13
///
class SpWMLFontStyleParams {
  static const String className = 'SpWMLFontStyleParams';
  static const String version = '2';

  // margin top
  double? mT;

  // other params
  String? textColor;
  String? textBGColor;
  double? fontSize;
  EnumFontWeight? fontWeight;
  EnumFontStyle? fontStyle;
  double? letterSpacing;
  double? wordSpacing;
  EnumTextDecoration? textDeco;
  EnumTextDecorationStyle? textDecoStyle;
  String? textDecoColor;
  double? textDecoThickness;
  String? fontFamily;
  double? lineHeight;

  /// Constructor
  /// * [mT] : Text top margin. This is non material parameter.
  /// * [textColor] : Text color. e.g. #DD000000.
  /// * [textBGColor] : Text background color. e.g. #DD000000.
  /// * [fontSize] : Font size.
  /// * [fontWeight] : Font weight. Default is 400. e.g. Regular is 400 and Medium is 500.
  /// * [fontStyle] : normal or italic.
  /// * [letterSpacing] : Same as tracking. The Space between fonts.
  /// * [wordSpacing] : Space between words.
  /// * [textDeco] : The text decoration.
  /// * [textDecoStyle] : decoration style.
  /// * [textDecoColor] : decoration color.
  /// * [textDecoThickness] : decoration line thickness.
  /// * [fontFamily] : Font family name. Default is Roboto.
  /// * [lineHeight] : Line height.
  SpWMLFontStyleParams({
    this.mT,
    this.textColor,
    this.textBGColor,
    this.fontSize,
    this.fontWeight = EnumFontWeight.w400,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.textDeco,
    this.textDecoStyle,
    this.textDecoColor,
    this.textDecoThickness,
    this.fontFamily,
    this.lineHeight,
  });

  SpWMLFontStyleParams deepCopy() {
    return SpWMLFontStyleParams(
      mT: mT,
      textColor: textColor,
      textBGColor: textBGColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textDeco: textDeco,
      textDecoStyle: textDecoStyle,
      textDecoColor: textDecoColor,
      textDecoThickness: textDecoThickness,
      fontFamily: fontFamily,
      lineHeight: lineHeight,
    );
  }

  Map<String, dynamic> toDict() {
    Map<String, dynamic> d = {};
    d['class_name'] = className;
    d['version'] = version;
    d['mT'] = mT;
    d['textColor'] = textColor;
    d['textBGColor'] = textBGColor;
    d['fontSize'] = fontSize;
    d['fontWeight'] = fontWeight?.name;
    d['fontStyle'] = fontStyle?.name;
    d['letterSpacing'] = letterSpacing;
    d['wordSpacing'] = wordSpacing;
    d['textDeco'] = textDeco?.name;
    d['textDecoStyle'] = textDecoStyle?.name;
    d['textDecoColor'] = textDecoColor;
    d['textDecoThickness'] = textDecoThickness;
    d['fontFamily'] = fontFamily;
    d['lineHeight'] = lineHeight;
    return d;
  }

  static SpWMLFontStyleParams fromDict(Map<String, dynamic> src) {
    return SpWMLFontStyleParams(
      mT: src['mT'],
      textColor: src['textColor'],
      textBGColor: src['textBGColor'],
      fontSize: src['fontSize'],
      fontWeight: src['fontWeight'] != null
          ? EnumFontWeight.values.byName(src['fontWeight'])
          : null,
      fontStyle: src['fontStyle'] != null
          ? EnumFontStyle.values.byName(src['fontStyle'])
          : null,
      letterSpacing: src['letterSpacing'],
      wordSpacing: src['wordSpacing'],
      textDeco: src['textDeco'] != null
          ? EnumTextDecoration.values.byName(src['textDeco'])
          : null,
      textDecoStyle: src['textDecoStyle'] != null
          ? EnumTextDecorationStyle.values.byName(src['textDecoStyle'])
          : null,
      textDecoColor: src['textDecoColor'],
      textDecoThickness: src['textDecoThickness'],
      fontFamily: src['fontFamily'],
      lineHeight: src['lineHeight'],
    );
  }
}
