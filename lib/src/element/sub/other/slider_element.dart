import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';
import '../../../../simple_widget_markup.dart';

///
/// (en) The slider.
///
/// (ja) sliderの実装。
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
    this.elParams, {
    super.key,
  }) : super(
         serial,
         EnumSpWMLElementType.slider,
         params,
         spwmlParams,
         parentSerial,
         lineStart,
         lineEnd,
         style,
         info,
       );

  /// Get this class name.
  @override
  String getClassName() {
    return "SliderElement";
  }

  /// Initialize the parameters.
  @override
  SliderElement initParams() {
    super.initParams();
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
    elParams.p.useAutoLabel = params.containsKey(EnumSpWMLParams.useAutoLabel)
        ? params[EnumSpWMLParams.useAutoLabel]
        : SliderParams.defUseAutoLabel;
    elParams.p.isIntValue = params.containsKey(EnumSpWMLParams.isIntValue)
        ? params[EnumSpWMLParams.isIntValue]
        : SliderParams.defIsIntValue;
    // SIDが設定されていなければエラー。
    if (getSID() == null) {
      throw SpWMLException(
        EnumSpWMLExceptionType.sidDoesNotExistException,
        lineStart,
        lineEnd,
        info,
      );
    }
    return this;
  }

  /// (en) Set slider value. Invalid if the manager class is not set.
  ///
  /// (ja) スライダーの値を設定します。マネージャークラスが未設定の場合は無効です。
  /// * [v] : The slider value.
  void setValue(double v) {
    if (elParams.p.manager != null) {
      final String? sid = getSID();
      if (sid != null) {
        elParams.p.manager!.setValue(sid, v);
      }
    }
  }

  /// (en) Get the value.
  /// If the manager class has not been set or there is no value,
  /// null is returned.
  ///
  /// (ja) 値を取得します。
  /// マネージャークラスが未設定の場合や、値が無い場合はnullが返ります。
  double? getValue() {
    if (elParams.p.manager != null) {
      final String? sid = getSID();
      if (sid != null) {
        return elParams.p.manager!.getValue(sid);
      }
    }
    return null;
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

  /// (en) Sets the manager class that manages the state.
  ///
  /// (ja) 状態を管理するマネージャクラスを設定します。
  /// * [m] : Manager class.
  /// * [sid] : This element sid.
  void setManager(ValueManager m, String sid) {
    elParams.p.manager = m;
    elParams.p.manager!.getValue(sid, initialValue: null);
  }

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    return _SliderElementWidget(getSID()!, elParams);
  }
}

class _SliderElementWidget extends StatefulWidget {
  final String sid;
  final SliderParamsWrapper elParams;

  const _SliderElementWidget(this.sid, this.elParams);

  @override
  _SliderElementWidgetState createState() => _SliderElementWidgetState();
}

class _SliderElementWidgetState extends State<_SliderElementWidget> {
  /// onChanged wrapper.
  void _onChanged(double v) {
    if (mounted) {
      setState(() {
        widget.elParams.p.manager!.setValue(widget.sid, v);
        widget.elParams.p.onChanged!(v);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double value =
        widget.elParams.p.manager!.getValue(widget.sid) ??
        widget.elParams.p.min;
    return Slider(
      key: widget.elParams.p.key,
      value: value,
      onChanged: widget.elParams.p.onChanged == null ? null : _onChanged,
      onChangeStart: widget.elParams.p.onChangeStart,
      onChangeEnd: widget.elParams.p.onChangeEnd,
      min: widget.elParams.p.min,
      max: widget.elParams.p.max,
      divisions: widget.elParams.p.divisions,
      label:
          widget.elParams.p.label ??
          (widget.elParams.p.useAutoLabel
              ? (widget.elParams.p.isIntValue
                    ? value.toInt().toString()
                    : value.toString())
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
