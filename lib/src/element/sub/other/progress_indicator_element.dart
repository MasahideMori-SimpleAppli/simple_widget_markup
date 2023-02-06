import 'package:flutter/material.dart';

import '../../../../simple_widget_markup.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2023-02-05 16:50:03
///
class ProgressIndicatorElement extends SpWMLElement {
  final ProgressIndicatorParamsWrapper elParams;

  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [info] : SpWML info.
  /// * [elParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  ProgressIndicatorElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      this.elParams)
      : super(serial, EnumSpWMLElementType.progressIndicator, params,
            spwmlParams, parentSerial, lineStart, lineEnd, style, info);

  @override
  ProgressIndicatorElement initParams() {
    super.initParams();
    elParams.p.indicatorType = params.containsKey(EnumSpWMLParams.type)
        ? params[EnumSpWMLParams.type]
        : EnumIndicatorType.circular;
    if (elParams.p.indicatorType == EnumIndicatorType.circular) {
      elParams.p.circularProgressIndicatorParams =
          CircularProgressIndicatorParams();
      elParams.p.circularProgressIndicatorParams!.value =
          params.containsKey(EnumSpWMLParams.value)
              ? params[EnumSpWMLParams.value]
              : null;
      elParams.p.circularProgressIndicatorParams!.color =
          params.containsKey(EnumSpWMLParams.indicatorColor)
              ? params[EnumSpWMLParams.indicatorColor]
              : null;
      elParams.p.circularProgressIndicatorParams!.backgroundColor =
          params.containsKey(EnumSpWMLParams.indicatorBGColor)
              ? params[EnumSpWMLParams.indicatorBGColor]
              : null;
    } else {
      elParams.p.linearProgressIndicatorParams =
          LinearProgressIndicatorParams();
      elParams.p.linearProgressIndicatorParams!.value =
          params.containsKey(EnumSpWMLParams.value)
              ? params[EnumSpWMLParams.value]
              : null;
      elParams.p.linearProgressIndicatorParams!.color =
          params.containsKey(EnumSpWMLParams.indicatorColor)
              ? params[EnumSpWMLParams.indicatorColor]
              : null;
      elParams.p.linearProgressIndicatorParams!.backgroundColor =
          params.containsKey(EnumSpWMLParams.indicatorBGColor)
              ? params[EnumSpWMLParams.indicatorBGColor]
              : null;
    }
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    if (elParams.p.indicatorType == EnumIndicatorType.circular) {
      return CircularProgressIndicator(
          key: elParams.p.circularProgressIndicatorParams!.key,
          value: elParams.p.circularProgressIndicatorParams!.value,
          backgroundColor:
              elParams.p.circularProgressIndicatorParams!.backgroundColor,
          color: elParams.p.circularProgressIndicatorParams!.color,
          valueColor: elParams.p.circularProgressIndicatorParams!.valueColor,
          strokeWidth: elParams.p.circularProgressIndicatorParams!.strokeWidth,
          semanticsLabel:
              elParams.p.circularProgressIndicatorParams!.semanticsLabel,
          semanticsValue:
              elParams.p.circularProgressIndicatorParams!.semanticsValue);
    } else {
      return LinearProgressIndicator(
          key: elParams.p.linearProgressIndicatorParams!.key,
          value: elParams.p.linearProgressIndicatorParams!.value,
          backgroundColor:
              elParams.p.linearProgressIndicatorParams!.backgroundColor,
          color: elParams.p.linearProgressIndicatorParams!.color,
          valueColor: elParams.p.linearProgressIndicatorParams!.valueColor,
          minHeight: elParams.p.linearProgressIndicatorParams!.minHeight,
          semanticsLabel:
              elParams.p.linearProgressIndicatorParams!.semanticsLabel,
          semanticsValue:
              elParams.p.linearProgressIndicatorParams!.semanticsValue);
    }
  }

  /// (en)Set progress.
  ///
  /// (ja)進捗具合を設定します。
  /// * [v] The progress value. null or the value between 0.0 and 1.0.
  /// If null, set loading animation.
  void setValue(double? v) {
    if (elParams.p.indicatorType == EnumIndicatorType.circular) {
      elParams.p.circularProgressIndicatorParams!.value = v;
    } else {
      elParams.p.linearProgressIndicatorParams!.value = v;
    }
  }
}
