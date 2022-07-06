import 'package:flutter/material.dart';

import '../../../element_params/element_child.dart';
import '../../../element_params/sub/button/checkbox_params.dart';
import '../../../element_params/sub/button/radio_btn_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../spwml_font_style.dart';
import '../../super/spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-06-13 21:13:22
///
class RadioBtnElement extends SpWMLElement {
  final StructureElementChildren children;
  final RadioBtnParamsWrapper elParams;

  RadioBtnElement(
      int serial,
      List<String> param,
      SpWMLParamsWrapper spwmlEP,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children,
      this.elParams)
      : super(serial, EnumSpWMLElementType.checkbox, param, spwmlEP,
            parentSerial, lineStart, lineEnd, style);

  @override
  RadioBtnElement initParams() {
    super.initParams();
    SelectableIconBtnParams enabled = SelectableIconBtnParams();
    enabled.icon = const Icon(Icons.radio_button_checked_outlined);
    enabled.iconSize = params.containsKey(EnumSpWMLParams.iconSize)
        ? params[EnumSpWMLParams.iconSize]!
        : 24;
    enabled.color = params.containsKey(EnumSpWMLParams.iconColor)
        ? params[EnumSpWMLParams.iconColor]
        : null;
    enabled.splashRadius = params.containsKey(EnumSpWMLParams.splashRadius)
        ? params[EnumSpWMLParams.splashRadius]
        : null;
    elParams.p.enableParams = enabled;
    SelectableIconBtnParams disabled = SelectableIconBtnParams();
    disabled.icon = const Icon(Icons.radio_button_off_outlined);
    disabled.iconSize = params.containsKey(EnumSpWMLParams.iconSize)
        ? params[EnumSpWMLParams.iconSize]!
        : 24;
    disabled.color = params.containsKey(EnumSpWMLParams.iconColor)
        ? params[EnumSpWMLParams.iconColor]
        : null;
    disabled.splashRadius = params.containsKey(EnumSpWMLParams.splashRadius)
        ? params[EnumSpWMLParams.splashRadius]
        : null;
    elParams.p.disableParams = disabled;
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    return _RadioBtnElementWidget(children, elParams);
  }

  /// (en)Set the initial value of the radio button.
  /// To keep the value of the radio button when the screen is refreshed,
  /// hold the value in the upper widget etc. and call this.
  ///
  /// (ja)ラジオボタンの初期値を設定します。
  /// 画面の更新時にラジオボタンの値を保持するには、
  /// 上位のウィジェット等で値を保持し、これを呼び出します。
  /// * [v] : The value.
  void setInitialIndex(int? v) {
    elParams.p.selectedIndex = v;
  }

  /// (en)Set radio button callback.
  ///
  /// (ja)ラジオボタンのコールバックを設定します。
  /// * [callback] : The radio button callback.
  void setCallback(void Function(int? selectedIndex)? callback) {
    elParams.p.callback = callback;
  }
}

class _RadioBtnElementWidget extends StatefulWidget {
  final StructureElementChildren children;
  final RadioBtnParamsWrapper elParams;

  const _RadioBtnElementWidget(this.children, this.elParams);

  @override
  _RadioBtnElementWidgetState createState() => _RadioBtnElementWidgetState();
}

class _RadioBtnElementWidgetState extends State<_RadioBtnElementWidget> {
  Widget _getLayout() {
    List<Widget> r = [];
    for (int i = 0; i < widget.children.children.length; i++) {
      r.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.elParams.p.selectedIndex == i
                ? IconButton(
                    key: widget.elParams.p.enableParams!.key,
                    iconSize: widget.elParams.p.enableParams!.iconSize,
                    visualDensity:
                        widget.elParams.p.enableParams!.visualDensity,
                    padding: widget.elParams.p.enableParams!.padding,
                    alignment: widget.elParams.p.enableParams!.alignment,
                    splashRadius: widget.elParams.p.enableParams!.splashRadius,
                    color: widget.elParams.p.enableParams!.color,
                    focusColor: widget.elParams.p.enableParams!.focusColor,
                    hoverColor: widget.elParams.p.enableParams!.hoverColor,
                    highlightColor:
                        widget.elParams.p.enableParams!.highlightColor,
                    splashColor: widget.elParams.p.enableParams!.splashColor,
                    disabledColor:
                        widget.elParams.p.enableParams!.disabledColor,
                    onPressed: () {
                      setState(() {
                        widget.elParams.p.selectedIndex = i;
                        if (widget.elParams.p.callback != null) {
                          widget.elParams.p.callback!(i);
                        }
                      });
                    },
                    mouseCursor: widget.elParams.p.enableParams!.mouseCursor,
                    focusNode: widget.elParams.p.enableParams!.focusNode,
                    autofocus: widget.elParams.p.enableParams!.autofocus,
                    tooltip: widget.elParams.p.enableParams!.tooltip,
                    enableFeedback:
                        widget.elParams.p.enableParams!.enableFeedback,
                    constraints: widget.elParams.p.enableParams!.constraints,
                    icon: widget.elParams.p.enableParams!.icon!,
                  )
                : IconButton(
                    key: widget.elParams.p.disableParams!.key,
                    iconSize: widget.elParams.p.disableParams!.iconSize,
                    visualDensity:
                        widget.elParams.p.disableParams!.visualDensity,
                    padding: widget.elParams.p.disableParams!.padding,
                    alignment: widget.elParams.p.disableParams!.alignment,
                    splashRadius: widget.elParams.p.disableParams!.splashRadius,
                    color: widget.elParams.p.disableParams!.color,
                    focusColor: widget.elParams.p.disableParams!.focusColor,
                    hoverColor: widget.elParams.p.disableParams!.hoverColor,
                    highlightColor:
                        widget.elParams.p.disableParams!.highlightColor,
                    splashColor: widget.elParams.p.disableParams!.splashColor,
                    disabledColor:
                        widget.elParams.p.disableParams!.disabledColor,
                    onPressed: () {
                      setState(() {
                        widget.elParams.p.selectedIndex = i;
                        if (widget.elParams.p.callback != null) {
                          widget.elParams.p.callback!(i);
                        }
                      });
                    },
                    mouseCursor: widget.elParams.p.disableParams!.mouseCursor,
                    focusNode: widget.elParams.p.disableParams!.focusNode,
                    autofocus: widget.elParams.p.disableParams!.autofocus,
                    tooltip: widget.elParams.p.disableParams!.tooltip,
                    enableFeedback:
                        widget.elParams.p.disableParams!.enableFeedback,
                    constraints: widget.elParams.p.disableParams!.constraints,
                    icon: widget.elParams.p.disableParams!.icon!,
                  ),
            widget.children.children[i]
          ]));
    }
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: r);
  }

  @override
  Widget build(BuildContext context) {
    return _getLayout();
  }
}
