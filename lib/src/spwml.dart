import 'package:flutter/material.dart';
import '../simple_widget_markup.dart';

///
/// SpWMLBuilder wrapper widget.
///
/// Author Masahide Mori
///
/// First edition creation date 2022-01-06 13:14:26
///
class SpWML extends StatelessWidget {
  final String spWML;
  final MainAxisAlignment mainAA;
  final CrossAxisAlignment crossAA;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final SpWMLFontStyle style;
  final SpWMLInfo? info;

  /// Constructor
  /// * [spWML] : SpWML text.
  /// * [mainAA] : Top level Column MainAxisAlignment.
  /// * [crossAA] : Top level Column CrossAxisAlignment.
  /// * [margin] : Top level Column Margin.
  /// * [padding] : Top level Column Padding.
  /// * [spWMLStyle] : Font styles. If you want to change the default style,
  /// you can change the contents of the singleton SpWMLFontManager class.
  /// * [info] : This is information object. e.g. A hint when an error occurs.
  /// It is convenient to set when nesting multiple SpWMLs.
  SpWML(this.spWML,
      {this.mainAA = MainAxisAlignment.start,
      this.crossAA = CrossAxisAlignment.start,
      this.margin = const EdgeInsets.all(0),
      this.padding = const EdgeInsets.all(8),
      SpWMLFontStyle? spWMLStyle,
      this.info,
      GlobalKey? key})
      : style = spWMLStyle ?? SpWMLFontStyleManager().style,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpWMLBuilder(spWML,
            mainAA: mainAA,
            crossAA: crossAA,
            margin: margin,
            padding: padding,
            spWMLStyle: style,
            info: info)
        .build(context);
  }
}
