import 'package:flutter/material.dart';

import '../../../element_params/element_child.dart';
import '../../../element_params/sub/button/checkbox_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../style/spwml_font_style.dart';
import '../../super/spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-06-13 21:13:22
///
class CheckboxElement extends SpWMLElement {
  final StructureElementChildren children;
  final CheckboxParamsWrapper elParams;

  CheckboxElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlEP,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children,
      this.elParams)
      : super(serial, EnumSpWMLElementType.checkbox, params, spwmlEP,
            parentSerial, lineStart, lineEnd, style);

  @override
  CheckboxElement initParams() {
    super.initParams();
    SelectableIconBtnParams enabled = SelectableIconBtnParams();
    enabled.icon = const Icon(Icons.check_box_outlined);
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
    disabled.icon = const Icon(Icons.check_box_outline_blank);
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
    elParams.p.enableTapLabel =
        params.containsKey(EnumSpWMLParams.enableTapLabel)
            ? params[EnumSpWMLParams.enableTapLabel]
            : false;
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    if (elParams.p.checkValues == null) {
      elParams.p.checkValues = [];
      for (int i = 0; i < children.children.length; i++) {
        elParams.p.checkValues!.add(false);
      }
    }
    return _CheckboxElementWidget(children, elParams, getShape());
  }

  /// (en)Set the initial value of the check box.
  /// To keep the value of the check box when the screen is refreshed,
  /// hold the value in the upper widget etc. and call this.
  ///
  /// (ja)チェックボックスの初期値を設定します。
  /// 画面の更新時にチェックボックスの値を保持するには、
  /// 上位のウィジェット等で値を保持し、これを呼び出します。
  /// * [v] : The values.
  void setInitialValues(List<bool> v) {
    elParams.p.checkValues = v;
  }

  /// (en)Set checkboxes callback.
  ///
  /// (ja)チェックボックスのコールバックを設定します。
  /// * [callback] : The checkboxes callback.
  void setCallback(void Function(List<bool>? checkValues)? callback) {
    elParams.p.callback = callback;
  }
}

class _CheckboxElementWidget extends StatefulWidget {
  final StructureElementChildren children;
  final CheckboxParamsWrapper elParams;
  final OutlinedBorder? shape;

  const _CheckboxElementWidget(this.children, this.elParams, this.shape);

  @override
  _CheckboxElementWidgetState createState() => _CheckboxElementWidgetState();
}

class _CheckboxElementWidgetState extends State<_CheckboxElementWidget> {
  /// The onTap callback.
  void _onTapCallback(int index) {
    setState(() {
      widget.elParams.p.checkValues![index] =
          !widget.elParams.p.checkValues![index];
      if (widget.elParams.p.callback != null) {
        widget.elParams.p.callback!(widget.elParams.p.checkValues!);
      }
    });
  }

  /// Return wrapped widget.
  Widget _getWrap(int index, Widget w) {
    if (widget.elParams.p.enableTapLabel) {
      return InkWell(
        key: widget.elParams.p.enableTapInkWellParams.key,
        child: w,
        onTap: () {
          _onTapCallback(index);
        },
        onDoubleTap: widget.elParams.p.enableTapInkWellParams.onDoubleTap,
        onLongPress: widget.elParams.p.enableTapInkWellParams.onLongPress,
        onTapDown: widget.elParams.p.enableTapInkWellParams.onTapDown,
        onTapUp: widget.elParams.p.enableTapInkWellParams.onTapUp,
        onTapCancel: widget.elParams.p.enableTapInkWellParams.onTapCancel,
        onHighlightChanged:
            widget.elParams.p.enableTapInkWellParams.onHighlightChanged,
        onHover: widget.elParams.p.enableTapInkWellParams.onHover,
        mouseCursor: widget.elParams.p.enableTapInkWellParams.mouseCursor,
        focusColor: widget.elParams.p.enableTapInkWellParams.focusColor,
        hoverColor: widget.elParams.p.enableTapInkWellParams.hoverColor,
        highlightColor: widget.elParams.p.enableTapInkWellParams.highlightColor,
        overlayColor: widget.elParams.p.enableTapInkWellParams.overlayColor,
        splashColor: widget.elParams.p.enableTapInkWellParams.splashColor,
        splashFactory: widget.elParams.p.enableTapInkWellParams.splashFactory,
        radius: widget.elParams.p.enableTapInkWellParams.radius,
        borderRadius: widget.elParams.p.enableTapInkWellParams.borderRadius,
        customBorder: widget.elParams.p.enableTapInkWellParams.customBorder ??
            widget.shape,
        enableFeedback: widget.elParams.p.enableTapInkWellParams.enableFeedback,
        excludeFromSemantics:
            widget.elParams.p.enableTapInkWellParams.excludeFromSemantics,
        focusNode: widget.elParams.p.enableTapInkWellParams.focusNode,
        canRequestFocus:
            widget.elParams.p.enableTapInkWellParams.canRequestFocus,
        onFocusChange: widget.elParams.p.enableTapInkWellParams.onFocusChange,
        autofocus: widget.elParams.p.enableTapInkWellParams.autofocus,
      );
    } else {
      return w;
    }
  }

  Widget _getLayout() {
    List<Widget> r = [];
    for (int i = 0; i < widget.children.children.length; i++) {
      r.add(_getWrap(
          i,
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.elParams.p.checkValues![i]
                    ? IconButton(
                        key: widget.elParams.p.enableParams!.key,
                        iconSize: widget.elParams.p.enableParams!.iconSize,
                        visualDensity:
                            widget.elParams.p.enableParams!.visualDensity,
                        padding: widget.elParams.p.enableParams!.padding,
                        alignment: widget.elParams.p.enableParams!.alignment,
                        splashRadius:
                            widget.elParams.p.enableParams!.splashRadius,
                        color: widget.elParams.p.enableParams!.color,
                        focusColor: widget.elParams.p.enableParams!.focusColor,
                        hoverColor: widget.elParams.p.enableParams!.hoverColor,
                        highlightColor:
                            widget.elParams.p.enableParams!.highlightColor,
                        splashColor:
                            widget.elParams.p.enableParams!.splashColor,
                        disabledColor: widget.elParams.p.enableTapLabel
                            ? widget.elParams.p.enableParams!.color ??
                                Colors.black87
                            : widget.elParams.p.enableParams!.disabledColor,
                        onPressed: widget.elParams.p.enableTapLabel
                            ? null
                            : () {
                                _onTapCallback(i);
                              },
                        mouseCursor:
                            widget.elParams.p.enableParams!.mouseCursor,
                        focusNode: widget.elParams.p.enableParams!.focusNode,
                        autofocus: widget.elParams.p.enableParams!.autofocus,
                        tooltip: widget.elParams.p.enableParams!.tooltip,
                        enableFeedback:
                            widget.elParams.p.enableParams!.enableFeedback,
                        constraints:
                            widget.elParams.p.enableParams!.constraints,
                        icon: widget.elParams.p.enableParams!.icon!,
                      )
                    : IconButton(
                        key: widget.elParams.p.disableParams!.key,
                        iconSize: widget.elParams.p.disableParams!.iconSize,
                        visualDensity:
                            widget.elParams.p.disableParams!.visualDensity,
                        padding: widget.elParams.p.disableParams!.padding,
                        alignment: widget.elParams.p.disableParams!.alignment,
                        splashRadius:
                            widget.elParams.p.disableParams!.splashRadius,
                        color: widget.elParams.p.disableParams!.color,
                        focusColor: widget.elParams.p.disableParams!.focusColor,
                        hoverColor: widget.elParams.p.disableParams!.hoverColor,
                        highlightColor:
                            widget.elParams.p.disableParams!.highlightColor,
                        splashColor:
                            widget.elParams.p.disableParams!.splashColor,
                        disabledColor: widget.elParams.p.enableTapLabel
                            ? widget.elParams.p.enableParams!.color ??
                                Colors.black87
                            : widget.elParams.p.disableParams!.disabledColor,
                        onPressed: widget.elParams.p.enableTapLabel
                            ? null
                            : () {
                                _onTapCallback(i);
                              },
                        mouseCursor:
                            widget.elParams.p.disableParams!.mouseCursor,
                        focusNode: widget.elParams.p.disableParams!.focusNode,
                        autofocus: widget.elParams.p.disableParams!.autofocus,
                        tooltip: widget.elParams.p.disableParams!.tooltip,
                        enableFeedback:
                            widget.elParams.p.disableParams!.enableFeedback,
                        constraints:
                            widget.elParams.p.disableParams!.constraints,
                        icon: widget.elParams.p.disableParams!.icon!,
                      ),
                widget.children.children[i]
              ])));
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