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
  final SpWMLFontStyle style;

  SpWML(this.spWML, {SpWMLFontStyle? spWMLStyle, GlobalKey? key})
      : style = spWMLStyle ?? SpWMLFontStyle(), super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpWMLBuilder(spWML, spWMLStyle: style).build(context);
  }
}
