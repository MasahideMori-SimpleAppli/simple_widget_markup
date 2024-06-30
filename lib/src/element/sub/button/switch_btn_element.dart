import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';

import '../../../../simple_widget_markup.dart';

///
/// (en) The switch.
///
/// (ja) switchの実装。
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
      this.elParams,
      {super.key})
      : super(serial, EnumSpWMLElementType.switchBtn, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info);

  /// Get this class name.
  @override
  String getClassName() {
    return "SwitchBtnElement";
  }

  /// Initialize the parameters.
  @override
  SwitchBtnElement initParams() {
    super.initParams();
    elParams.p.isEnabled = params.containsKey(EnumSpWMLParams.isEnabled)
        ? params[EnumSpWMLParams.isEnabled]
        : true;
    elParams.p.splashRadius = params.containsKey(EnumSpWMLParams.splashRadius)
        ? params[EnumSpWMLParams.splashRadius]
        : null;
    if (params.containsKey(EnumSpWMLParams.type)) {
      if (params[EnumSpWMLParams.type] == EnumSwitchBtnType.check) {
        setSwitchIcon(Icons.check, Icons.close);
      }
    }
    // SIDが設定されていなければエラー。
    if (getSID() == null) {
      throw SpWMLException(EnumSpWMLExceptionType.sidDoesNotExistException,
          lineStart, lineEnd, info);
    }
    return this;
  }

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    return _SwitchBtnElementWidget(getSID()!, elParams);
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
  /// (ja)スイッチのアイコンを設定します。
  /// * [selected] : The icon for selected state.
  /// * [nonSelected] : The icon for non-selected state.
  void setSwitchIcon(IconData? selected, IconData? nonSelected) {
    elParams.p.thumbIcon = WidgetStateProperty.resolveWith<Icon?>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Icon(selected);
        }
        return Icon(nonSelected);
      },
    );
  }

  /// (en) Sets the switch value. Disabled if the manager class is not set.
  ///
  /// (ja) スイッチの値を設定します。マネージャークラスが未設定の場合は無効です。
  /// * [v] : Switch value.
  void setValue(bool v) {
    if (elParams.p.manager != null) {
      final String? sid = getSID();
      if (sid != null) {
        elParams.p.manager!.setFlag(sid, v);
      }
    }
  }

  /// (en) Sets the manager class that manages the state.
  ///
  /// (ja) 状態を管理するマネージャクラスを設定します。
  /// * [m] : Manager class.
  void setManager(FlagManager m) {
    elParams.p.manager = m;
  }

  /// (en) Enable/disable this button.
  ///
  /// (ja)このボタンの有効・無効を切り替えます。
  ///
  /// * [isEnabled] : If true, the button is enabled.
  void setEnabled(bool isEnabled) {
    elParams.p.isEnabled = isEnabled;
  }
}

class _SwitchBtnElementWidget extends StatefulWidget {
  final String sid;
  final SwitchBtnParamsWrapper elParams;

  const _SwitchBtnElementWidget(this.sid, this.elParams);

  @override
  _SwitchBtnElementWidgetState createState() => _SwitchBtnElementWidgetState();
}

class _SwitchBtnElementWidgetState extends State<_SwitchBtnElementWidget> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      key: widget.elParams.p.key,
      value: widget.elParams.p.manager!.getFlag(widget.sid),
      onChanged:
          widget.elParams.p.onChanged != null && widget.elParams.p.isEnabled
              ? (bool b) {
                  if (mounted) {
                    setState(() {
                      widget.elParams.p.manager!.setFlag(widget.sid, b);
                      if (widget.elParams.p.onChanged != null) {
                        widget.elParams.p.onChanged!(b);
                      }
                    });
                  }
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
