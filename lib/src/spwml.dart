import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';
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

  // managers
  final TextFieldManager? tfm;
  final IndexManager? im;
  final FlagManager? fm;
  final TagSelectionManager? tsm;
  final MultiIndexManager? mim;
  final MultiFlagManager? mfm;
  final MultiTagSelectionManager? mtsm;
  final ValueManager? vm;
  final StateManager? sm;

  /// (en)The manager class is automatically set using the sid set
  /// in the layout as a key.
  ///
  /// (ja)レイアウトに設定されているsidをキーとして、マネージャークラスは自動設定されます。
  ///
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
  /// * [tfm] : The manager for textfield.
  /// * [im] : The manager for dropdownBtn and popupMenuBtn and radioBtn.
  /// * [fm] : The manager for switchBtn.
  /// * [tsm] : The manager for dropdownBtn2 popupMenuBtn2 and radioBtn2.
  /// * [mim] : The manager for segmentedBtn.
  /// * [mfm] : The manager for checkbox.
  /// * [mtsm] : The manager for segmentedBtn2 and checkbox2.
  /// * [vm] : The manager for progressIndicator and slider.
  /// * [sm] : The manager for all widget state.
  /// If this is not null, other managers will be disabled.
  SpWML(
    this.spWML, {
    this.mainAA = MainAxisAlignment.start,
    this.crossAA = CrossAxisAlignment.start,
    this.mainAS = MainAxisSize.max,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    SpWMLFontStyle? spWMLStyle,
    this.info,
    this.tfm,
    this.im,
    this.fm,
    this.tsm,
    this.mim,
    this.mfm,
    this.mtsm,
    this.vm,
    this.sm,
    super.key,
  }) : style = spWMLStyle ?? SpWMLFontStyleManager().style;

  /// (en)Build widget.
  ///
  /// (ja)ウィジェットとしてビルドします。
  ///
  /// * [context] : Build Context.
  ///
  /// Returns Widget.
  @override
  Widget build(BuildContext context) {
    final builder = SpWMLBuilder(
      spWML,
      mainAA: mainAA,
      crossAA: crossAA,
      mainAS: mainAS,
      margin: margin,
      padding: padding,
      spWMLStyle: style,
      info: info,
    );
    if (sm != null) {
      builder.setStateManager(sm!);
    } else {
      builder.setManager(
        tfm: tfm,
        im: im,
        fm: fm,
        tsm: tsm,
        mim: mim,
        mfm: mfm,
        mtsm: mtsm,
        vm: vm,
      );
    }
    return builder.build(context);
  }
}
