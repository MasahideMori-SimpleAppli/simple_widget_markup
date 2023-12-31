import 'package:flutter/material.dart';
import '../simple_widget_markup.dart';

///
/// (en) SpWMLBuilder wrapper widget.
/// This widget can only be used for widgets that have no internal state.
/// It is for example the display of text.
///
/// (ja) SpWMLBuilder ラッパー ウィジェット。
/// このウィジェットは、内部状態を持たないウィジェットにのみ使用できます。
/// 例えばテキストの表示のみを行う場合は有用です。
///
class SpWML extends StatelessWidget {
  final String spWML;
  final MainAxisAlignment mainAA;
  final CrossAxisAlignment crossAA;
  final MainAxisSize mainAS;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final SpWMLFontStyle style;
  final SpWMLInfo? info;

  /// Constructor
  /// * [spWML] : SpWML text.
  /// * [mainAA] : Top level Column MainAxisAlignment.
  /// * [crossAA] : Top level Column CrossAxisAlignment.
  /// * [mainAS] : The MainAxisSize of wrap column.
  /// * [margin] : Top level Column Margin.
  /// * [padding] : Top level Column Padding.
  /// * [spWMLStyle] : Font styles. If you want to change the default style,
  /// you can change the contents of the singleton SpWMLFontManager class.
  /// * [info] : This is information object. e.g. A hint when an error occurs.
  /// It is convenient to set when nesting multiple SpWMLs.
  SpWML(this.spWML,
      {this.mainAA = MainAxisAlignment.start,
      this.crossAA = CrossAxisAlignment.start,
      this.mainAS = MainAxisSize.max,
      this.margin = const EdgeInsets.all(0),
      this.padding = const EdgeInsets.all(0),
      SpWMLFontStyle? spWMLStyle,
      this.info,
      GlobalKey? key})
      : style = spWMLStyle ?? SpWMLFontStyleManager().style,
        super(key: key);

  /// (en)Build widget.
  ///
  /// (ja)ウィジェットとしてビルドします。
  ///
  /// * [context] : Build Context.
  ///
  /// Returns Widget.
  @override
  Widget build(BuildContext context) {
    return SpWMLBuilder(spWML,
            mainAA: mainAA,
            crossAA: crossAA,
            mainAS: mainAS,
            margin: margin,
            padding: padding,
            spWMLStyle: style,
            info: info)
        .build(context);
  }
}
