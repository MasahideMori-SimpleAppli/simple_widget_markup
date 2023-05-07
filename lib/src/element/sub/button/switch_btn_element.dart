import 'package:flutter/material.dart';

import '../../../../simple_widget_markup.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-05-29 17:50:16
///
class SwitchBtnElement extends SpWMLElement {
  final SwitchBtnParamsWrapper elParams;

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
  SwitchBtnElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      this.elParams)
      : super(serial, EnumSpWMLElementType.switchBtn, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info);

  @override
  SwitchBtnElement initParams() {
    super.initParams();
    elParams.p.splashRadius = params.containsKey(EnumSpWMLParams.splashRadius)
        ? params[EnumSpWMLParams.splashRadius]
        : null;
    elParams.p.value = params.containsKey(EnumSpWMLParams.value)
        ? params[EnumSpWMLParams.value]
        : false;
    if (params.containsKey(EnumSpWMLParams.type)) {
      if (params[EnumSpWMLParams.type] == EnumSwitchBtnType.check) {
        setSwitchIcon(Icons.check, Icons.close);
      }
    }
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    return _SwitchBtnElementWidget(elParams);
  }

  /// (en)Set button callback.
  ///
  /// (ja)ボタンのコールバックを設定します。
  /// * [callback] : The button callback.
  void setCallback(void Function(bool btnEnabled)? callback) {
    elParams.p.onChanged = callback;
  }

  /// (en)Set switch value.
  ///
  /// (ja)スイッチの値を設定します。
  /// * [v] : If true, switch initial value is true.
  void setSwitchValue(bool v) {
    elParams.p.value = v;
  }

  /// (en)Set switch value.
  ///
  /// (ja)スイッチのアイコンを設定します。
  /// * [selected] : The icon for selected state.
  /// * [nonSelected] : The icon for non-selected state.
  void setSwitchIcon(IconData? selected, IconData? nonSelected) {
    elParams.p.thumbIcon = MaterialStateProperty.resolveWith<Icon?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Icon(selected);
        }
        return Icon(nonSelected);
      },
    );
  }
}

class _SwitchBtnElementWidget extends StatefulWidget {
  final SwitchBtnParamsWrapper elParams;

  const _SwitchBtnElementWidget(this.elParams);

  @override
  _SwitchBtnElementWidgetState createState() => _SwitchBtnElementWidgetState();
}

class _SwitchBtnElementWidgetState extends State<_SwitchBtnElementWidget> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      key: widget.elParams.p.key,
      value: widget.elParams.p.value,
      onChanged: widget.elParams.p.onChanged != null
          ? (bool b) {
              setState(() {
                widget.elParams.p.value = b;
                if (widget.elParams.p.onChanged != null) {
                  widget.elParams.p.onChanged!(b);
                }
              });
            }
          : null,
      activeColor: widget.elParams.p.activeColor,
      activeTrackColor: widget.elParams.p.activeTrackColor,
      inactiveThumbColor: widget.elParams.p.inactiveThumbColor,
      inactiveTrackColor: widget.elParams.p.inactiveTrackColor,
      activeThumbImage: widget.elParams.p.activeThumbImage,
      onActiveThumbImageError: widget.elParams.p.onActiveThumbImageError,
      inactiveThumbImage: widget.elParams.p.inactiveThumbImage,
      onInactiveThumbImageError: widget.elParams.p.onInactiveThumbImageError,
      thumbColor: widget.elParams.p.thumbColor,
      trackColor: widget.elParams.p.trackColor,
      thumbIcon: widget.elParams.p.thumbIcon,
      materialTapTargetSize: widget.elParams.p.materialTapTargetSize,
      dragStartBehavior: widget.elParams.p.dragStartBehavior,
      mouseCursor: widget.elParams.p.mouseCursor,
      focusColor: widget.elParams.p.focusColor,
      hoverColor: widget.elParams.p.hoverColor,
      overlayColor: widget.elParams.p.overlayColor,
      splashRadius: widget.elParams.p.splashRadius,
      focusNode: widget.elParams.p.focusNode,
      autofocus: widget.elParams.p.autofocus,
    );
  }
}
