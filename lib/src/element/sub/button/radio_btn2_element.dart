import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';
import '../../../../simple_widget_markup.dart';

///
/// (en) The radioBtn2.
/// This is a flavor of radioBtn that differs in
/// how it manages the selection.
/// To use this class, you must set the tag for
/// all child (immediate descendants only).
///
/// (ja) radioBtn2の実装。
/// これは、選択内容の管理方法が異なる radioBtn の一種です。
/// このクラスを使用するには、すべての小要素（直下のみ）にtagを設定する必要があります。
///
class RadioBtn2Element extends MultiChildElement {
  final RadioBtn2ParamsWrapper elParams;

  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [info] : SpWML info.
  /// * [children] : This element children.
  /// * [elParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  RadioBtn2Element(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      StructureElementChildren children,
      this.elParams,
      {super.key})
      : super(serial, EnumSpWMLElementType.radioBtn2, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, children);

  /// Get this class name.
  @override
  String getClassName() {
    return "RadioBtn2Element";
  }

  /// Initialize the parameters.
  @override
  RadioBtn2Element initParams() {
    super.initParams();
    elParams.p.isEnabled = params.containsKey(EnumSpWMLParams.isEnabled)
        ? params[EnumSpWMLParams.isEnabled]
        : true;
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
    elParams.p.enableTapLabel =
        params.containsKey(EnumSpWMLParams.enableTapLabel)
            ? params[EnumSpWMLParams.enableTapLabel]
            : false;
    elParams.p.isPrefixIcon = params.containsKey(EnumSpWMLParams.isPrefixIcon)
        ? params[EnumSpWMLParams.isPrefixIcon]
        : true;
    if (params.containsKey(EnumSpWMLParams.isV3)) {
      elParams.p.enableParams!.isV3 = params[EnumSpWMLParams.isV3];
      elParams.p.disableParams!.isV3 = params[EnumSpWMLParams.isV3];
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
    return _RadioBtnElement2Widget(getSID()!, children, elParams, getShape());
  }

  /// (en)Set radio button callback.
  ///
  /// (ja)ラジオボタンのコールバックを設定します。
  /// * [callback] : The radio button callback.
  void setCallback(void Function(String? sid)? callback) {
    elParams.p.callback = callback;
  }

  /// (en) Sets the value. Disabled if the manager class is not set.
  ///
  /// (ja) 値を設定します。マネージャークラスが未設定の場合は無効です。
  /// * [v] : value.
  void setValue(String? v) {
    if (elParams.p.manager != null) {
      final String? sid = getSID();
      if (sid != null) {
        elParams.p.manager!.setSelection(sid, v);
      }
    }
  }

  /// (en) Sets the manager class that manages the state.
  ///
  /// (ja) 状態を管理するマネージャクラスを設定します。
  /// * [m] : Manager class.
  /// * [sid] : This element sid.
  void setManager(SelectionManager m, String sid) {
    elParams.p.manager = m;
    elParams.p.manager!.getSelection(sid);
  }

  /// (en) Enable/disable this button.
  ///
  /// (ja)このボタンの有効・無効を切り替えます。
  ///
  /// * [isEnabled] : If true, the button is enabled.
  void setEnabled(bool isEnabled) {
    elParams.p.isEnabled = isEnabled;
  }

  /// (en) Specify the button you want to disable by sid Set.
  /// If set to empty, all buttons will be enabled.
  /// However, if disabled with setEnabled, all buttons will remain disabled.
  ///
  /// (ja) 無効にしたいボタンをsidのSetで指定します。
  /// 空を設定した場合は全てのボタンが有効化されます。
  /// ただし、setEnabledで無効化された場合は全てのボタンが無効なままになります。
  ///
  /// * [sids] : A set of sids for the elements you want to disable.
  void setDisabledSelections(Set<String> sids) {
    elParams.p.disabledSelections = sids;
  }
}

class _RadioBtnElement2Widget extends StatefulWidget {
  final String sid;
  final StructureElementChildren children;
  final RadioBtn2ParamsWrapper elParams;
  final OutlinedBorder? shape;

  const _RadioBtnElement2Widget(
      this.sid, this.children, this.elParams, this.shape);

  @override
  _RadioBtnElement2WidgetState createState() => _RadioBtnElement2WidgetState();
}

class _RadioBtnElement2WidgetState extends State<_RadioBtnElement2Widget> {
  /// The onTap callback.
  void _onTapCallback(String targetTag) {
    if (mounted) {
      setState(() {
        widget.elParams.p.manager!.setSelection(widget.sid, targetTag);
        if (widget.elParams.p.callback != null) {
          widget.elParams.p.callback!(targetTag);
        }
      });
    }
  }

  /// Return wrapped widget.
  Widget _getWrap(String targetTag, Widget w) {
    if (widget.elParams.p.enableTapLabel) {
      return InkWell(
        key: widget.elParams.p.enableTapInkWellParams.key,
        onTap: widget.elParams.p.isEnabled &&
                !widget.elParams.p.disabledSelections.contains(targetTag)
            ? () {
                _onTapCallback(targetTag);
              }
            : null,
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
        child: w,
      );
    } else {
      return w;
    }
  }

  SelectableIconBtnParams _getParams(bool isSelected) {
    if (isSelected) {
      return widget.elParams.p.enableParams!;
    } else {
      return widget.elParams.p.disableParams!;
    }
  }

  Widget _getIconBtn(String targetTag, SelectableIconBtnParams params) {
    if (params.isV3) {
      final ColorScheme colors = Theme.of(context).colorScheme;
      return IconButton(
        iconSize: params.iconSize,
        visualDensity: params.visualDensity,
        padding: params.padding,
        alignment: params.alignment,
        splashRadius: params.splashRadius,
        color: params.color ?? colors.primary,
        focusColor: params.focusColor,
        hoverColor: params.hoverColor,
        highlightColor: params.highlightColor,
        splashColor: params.splashColor,
        disabledColor: params.disabledColor,
        onPressed: widget.elParams.p.isEnabled &&
                !widget.elParams.p.disabledSelections.contains(targetTag)
            ? () {
                _onTapCallback(targetTag);
              }
            : null,
        mouseCursor: params.mouseCursor,
        focusNode: params.focusNode,
        autofocus: params.autofocus,
        tooltip: params.tooltip,
        enableFeedback: params.enableFeedback,
        constraints: params.constraints,
        style: params.style,
        isSelected: params.isSelected,
        selectedIcon: params.selectedIcon,
        icon: params.icon!,
      );
    } else {
      return IconButton(
        key: params.key,
        iconSize: params.iconSize,
        visualDensity: params.visualDensity,
        padding: params.padding,
        alignment: params.alignment,
        splashRadius: params.splashRadius,
        color: params.color,
        focusColor: params.focusColor,
        hoverColor: params.hoverColor,
        highlightColor: params.highlightColor,
        splashColor: params.splashColor,
        disabledColor: params.disabledColor,
        onPressed: widget.elParams.p.isEnabled &&
                !widget.elParams.p.disabledSelections.contains(targetTag)
            ? () {
                _onTapCallback(targetTag);
              }
            : null,
        mouseCursor: params.mouseCursor,
        focusNode: params.focusNode,
        autofocus: params.autofocus,
        tooltip: params.tooltip,
        enableFeedback: params.enableFeedback,
        constraints: params.constraints,
        style: params.style,
        isSelected: params.isSelected,
        selectedIcon: params.selectedIcon,
        icon: params.icon!,
      );
    }
  }

  List<Widget> _getIconAndWidget(int index, String targetTag) {
    final bool isSelected =
        widget.elParams.p.manager!.getSelection(widget.sid) == targetTag;
    if (widget.elParams.p.isPrefixIcon) {
      return [
        _getIconBtn(targetTag, _getParams(isSelected)),
        widget.children.children[index]
      ];
    } else {
      return [
        Expanded(child: widget.children.children[index]),
        _getIconBtn(targetTag, _getParams(isSelected)),
      ];
    }
  }

  Widget _getLayout() {
    List<Widget> r = [];
    for (int i = 0; i < widget.children.children.length; i++) {
      final Widget w = widget.children.children[i];
      if (w is! SpWMLElement) {
        throw SpWMLException(
            EnumSpWMLExceptionType.childrenTagNotExistException,
            -1,
            -1,
            SpWMLInfo(errorHint: 'radioBtn2, sid=${widget.sid}'));
      }
      final String? targetTag = w.getTag();
      if (targetTag == null) {
        throw SpWMLException(
            EnumSpWMLExceptionType.childrenTagNotExistException,
            -1,
            -1,
            SpWMLInfo(errorHint: 'radioBtn2, sid=${widget.sid}'));
      }
      r.add(_getWrap(
          targetTag,
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _getIconAndWidget(i, targetTag))));
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
