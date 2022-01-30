import 'package:flutter/material.dart';
import 'element/spwml_font_style.dart';
import 'spwml_builder.dart';

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

  SpWML(this.spWML,
      {this.mainAA = MainAxisAlignment.start,
      this.crossAA = CrossAxisAlignment.start,
      this.margin = const EdgeInsets.all(0),
      this.padding = const EdgeInsets.all(8),
      SpWMLFontStyle? spWMLStyle,
      GlobalKey? key})
      : style = spWMLStyle ?? SpWMLFontStyle(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpWMLBuilder(spWML,
            mainAA: mainAA,
            crossAA: crossAA,
            margin: margin,
            padding: padding,
            spWMLStyle: style)
        .build(context);
  }
}
