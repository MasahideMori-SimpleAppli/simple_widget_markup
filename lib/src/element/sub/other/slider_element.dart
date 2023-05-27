import 'package:flutter/material.dart';
import '../../../element_params/spwml_info.dart';
import '../../../element_params/sub/other/slider_element_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../style/spwml_font_style.dart';
import '../../super/spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-05-23 20:00:00
///
class SliderElement extends SpWMLElement {
  final SliderParamsWrapper elParams;

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
  SliderElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      this.elParams)
      : super(serial, EnumSpWMLElementType.slider, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info);

  @override
  SliderElement initParams() {
    super.initParams();
    elParams.p.value = params.containsKey(EnumSpWMLParams.value)
        ? params[EnumSpWMLParams.value]!
        : SliderParams.defValue;
    elParams.p.min = params.containsKey(EnumSpWMLParams.min)
        ? params[EnumSpWMLParams.min]!
        : SliderParams.defMin;
    elParams.p.max = params.containsKey(EnumSpWMLParams.max)
        ? params[EnumSpWMLParams.max]
        : SliderParams.defMax;
    elParams.p.label = params.containsKey(EnumSpWMLParams.label)
        ? params[EnumSpWMLParams.label]
        : null;
    elParams.p.activeColor = params.containsKey(EnumSpWMLParams.activeColor)
        ? params[EnumSpWMLParams.activeColor]
        : null;
    elParams.p.inactiveColor = params.containsKey(EnumSpWMLParams.inactiveColor)
        ? params[EnumSpWMLParams.inactiveColor]
        : null;
    elParams.p.divisions = params.containsKey(EnumSpWMLParams.divisions)
        ? params[EnumSpWMLParams.divisions]
        : SliderParams.defDivisions;
    return this;
  }

  /// (en) Set slider value.
  ///
  /// (ja) スライダーの値を設定します。
  /// * [v] : The slider value.
  void setValue(double v) {
    elParams.p.value = v;
  }

  /// (en) Set a callback when the slider value changes.
  /// If setting null, disables the slider.
  ///
  /// (ja) スライダーの値が変化した時のコールバックを設定します。
  /// nullを設定した場合はスライダーが無効化されます。
  /// * [onChanged] : callback.
  void setOnChanged(void Function(double)? onChanged) {
    elParams.p.onChanged = onChanged;
  }

  @override
  Widget getWidget(BuildContext context) {
    return _SliderElementWidget(elParams);
  }
}

class _SliderElementWidget extends StatefulWidget {
  final SliderParamsWrapper elParams;

  const _SliderElementWidget(this.elParams);

  @override
  _SliderElementWidgetState createState() => _SliderElementWidgetState();
}

class _SliderElementWidgetState extends State<_SliderElementWidget> {
  /// onChanged wrapper.
  void _onChanged(double v) {
    setState(() {
      widget.elParams.p.value = v;
      widget.elParams.p.onChanged!(v);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      key: widget.elParams.p.key,
      value: widget.elParams.p.value,
      onChanged: widget.elParams.p.onChanged == null ? null : _onChanged,
      onChangeStart: widget.elParams.p.onChangeStart,
      onChangeEnd: widget.elParams.p.onChangeEnd,
      min: widget.elParams.p.min,
      max: widget.elParams.p.max,
      divisions: widget.elParams.p.divisions,
      label: widget.elParams.p.label ??
          (widget.elParams.p.useAutoLabel
              ? widget.elParams.p.value.toString()
              : null),
      activeColor: widget.elParams.p.activeColor,
      inactiveColor: widget.elParams.p.inactiveColor,
      secondaryActiveColor: widget.elParams.p.secondaryActiveColor,
      thumbColor: widget.elParams.p.thumbColor,
      overlayColor: widget.elParams.p.overlayColor,
      mouseCursor: widget.elParams.p.mouseCursor,
      semanticFormatterCallback: widget.elParams.p.semanticFormatterCallback,
      focusNode: widget.elParams.p.focusNode,
      autofocus: widget.elParams.p.autofocus,
    );
  }
}
