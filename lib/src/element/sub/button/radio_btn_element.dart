import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';
import '../../../../simple_widget_markup.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-06-13 21:13:22
///
class RadioBtnElement extends MultiChildElement {
  final RadioBtnParamsWrapper elParams;

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
  RadioBtnElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      StructureElementChildren children,
      this.elParams)
      : super(serial, EnumSpWMLElementType.radioBtn, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, children);

  /// Get this class name.
  @override
  String getClassName() {
    return "RadioBtnElement";
  }

  /// Initialize the parameters.
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
    // マネージャークラスが未設定の場合、仮のマネージャークラスを生成する。
    elParams.p.manager ??= IndexManager();
    return _RadioBtnElementWidget(getSID()!, children, elParams, getShape());
  }

  /// (en)Set radio button callback.
  ///
  /// (ja)ラジオボタンのコールバックを設定します。
  /// * [callback] : The radio button callback.
  void setCallback(void Function(int? selectedIndex)? callback) {
    elParams.p.callback = callback;
  }

  /// (en) Sets the value. Disabled if the manager class is not set.
  ///
  /// (ja) 値を設定します。マネージャークラスが未設定の場合は無効になります。
  /// * [v] : value.
  void setValue(int? v) {
    if (elParams.p.manager != null) {
      final String? sid = getSID();
      if (sid != null) {
        elParams.p.manager!.setIndex(sid, v);
      }
    }
  }

  /// (en) Sets the manager class that manages the state.
  ///
  /// (ja) 状態を管理するマネージャクラスを設定します。
  /// * [m] : Manager class.
  void setManager(IndexManager m) {
    elParams.p.manager = m;
  }
}

class _RadioBtnElementWidget extends StatefulWidget {
  final String sid;
  final StructureElementChildren children;
  final RadioBtnParamsWrapper elParams;
  final OutlinedBorder? shape;

  const _RadioBtnElementWidget(
      this.sid, this.children, this.elParams, this.shape);

  @override
  _RadioBtnElementWidgetState createState() => _RadioBtnElementWidgetState();
}

class _RadioBtnElementWidgetState extends State<_RadioBtnElementWidget> {
  /// The onTap callback.
  void _onTapCallback(int index) {
    setState(() {
      widget.elParams.p.manager!.setIndex(widget.sid, index);
      if (widget.elParams.p.callback != null) {
        widget.elParams.p.callback!(index);
      }
    });
  }

  /// Return wrapped widget.
  Widget _getWrap(int index, Widget w) {
    if (widget.elParams.p.enableTapLabel) {
      return InkWell(
        key: widget.elParams.p.enableTapInkWellParams.key,
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
        child: w,
      );
    } else {
      return w;
    }
  }

  Widget _getEnabledIconBtn(int index) {
    if (widget.elParams.p.enableParams!.isV3) {
      final ColorScheme colors = Theme.of(context).colorScheme;
      return IconButton(
        iconSize: widget.elParams.p.enableParams!.iconSize,
        visualDensity: widget.elParams.p.enableParams!.visualDensity,
        padding: widget.elParams.p.enableParams!.padding,
        alignment: widget.elParams.p.enableParams!.alignment,
        splashRadius: widget.elParams.p.enableParams!.splashRadius,
        color: widget.elParams.p.enableParams!.color ?? colors.primary,
        focusColor: widget.elParams.p.enableParams!.focusColor,
        hoverColor: widget.elParams.p.enableParams!.hoverColor,
        highlightColor: widget.elParams.p.enableParams!.highlightColor,
        splashColor: widget.elParams.p.enableParams!.splashColor,
        disabledColor: widget.elParams.p.enableTapLabel
            ? widget.elParams.p.enableParams!.color
            : widget.elParams.p.enableParams!.disabledColor,
        onPressed: widget.elParams.p.enableTapLabel
            ? null
            : () {
                _onTapCallback(index);
              },
        mouseCursor: widget.elParams.p.enableParams!.mouseCursor,
        focusNode: widget.elParams.p.enableParams!.focusNode,
        autofocus: widget.elParams.p.enableParams!.autofocus,
        tooltip: widget.elParams.p.enableParams!.tooltip,
        enableFeedback: widget.elParams.p.enableParams!.enableFeedback,
        constraints: widget.elParams.p.enableParams!.constraints,
        style: widget.elParams.p.enableParams!.style,
        isSelected: widget.elParams.p.enableParams!.isSelected,
        selectedIcon: widget.elParams.p.enableParams!.selectedIcon,
        icon: widget.elParams.p.enableParams!.icon!,
      );
    } else {
      return IconButton(
        key: widget.elParams.p.enableParams!.key,
        iconSize: widget.elParams.p.enableParams!.iconSize,
        visualDensity: widget.elParams.p.enableParams!.visualDensity,
        padding: widget.elParams.p.enableParams!.padding,
        alignment: widget.elParams.p.enableParams!.alignment,
        splashRadius: widget.elParams.p.enableParams!.splashRadius,
        color: widget.elParams.p.enableParams!.color,
        focusColor: widget.elParams.p.enableParams!.focusColor,
        hoverColor: widget.elParams.p.enableParams!.hoverColor,
        highlightColor: widget.elParams.p.enableParams!.highlightColor,
        splashColor: widget.elParams.p.enableParams!.splashColor,
        disabledColor: widget.elParams.p.enableTapLabel
            ? widget.elParams.p.enableParams!.color ?? Colors.black87
            : widget.elParams.p.enableParams!.disabledColor,
        onPressed: widget.elParams.p.enableTapLabel
            ? null
            : () {
                _onTapCallback(index);
              },
        mouseCursor: widget.elParams.p.enableParams!.mouseCursor,
        focusNode: widget.elParams.p.enableParams!.focusNode,
        autofocus: widget.elParams.p.enableParams!.autofocus,
        tooltip: widget.elParams.p.enableParams!.tooltip,
        enableFeedback: widget.elParams.p.enableParams!.enableFeedback,
        constraints: widget.elParams.p.enableParams!.constraints,
        style: widget.elParams.p.enableParams!.style,
        isSelected: widget.elParams.p.enableParams!.isSelected,
        selectedIcon: widget.elParams.p.enableParams!.selectedIcon,
        icon: widget.elParams.p.enableParams!.icon!,
      );
    }
  }

  Widget _getDisableIconBtn(int index) {
    if (widget.elParams.p.disableParams!.isV3) {
      final ColorScheme colors = Theme.of(context).colorScheme;
      return IconButton(
        iconSize: widget.elParams.p.disableParams!.iconSize,
        visualDensity: widget.elParams.p.disableParams!.visualDensity,
        padding: widget.elParams.p.disableParams!.padding,
        alignment: widget.elParams.p.disableParams!.alignment,
        splashRadius: widget.elParams.p.disableParams!.splashRadius,
        color: widget.elParams.p.disableParams!.color ?? colors.primary,
        focusColor: widget.elParams.p.disableParams!.focusColor,
        hoverColor: widget.elParams.p.disableParams!.hoverColor,
        highlightColor: widget.elParams.p.disableParams!.highlightColor,
        splashColor: widget.elParams.p.disableParams!.splashColor,
        disabledColor: widget.elParams.p.enableTapLabel
            ? widget.elParams.p.enableParams!.color ?? Colors.black87
            : widget.elParams.p.disableParams!.disabledColor,
        onPressed: widget.elParams.p.enableTapLabel
            ? null
            : () {
                _onTapCallback(index);
              },
        mouseCursor: widget.elParams.p.disableParams!.mouseCursor,
        focusNode: widget.elParams.p.disableParams!.focusNode,
        autofocus: widget.elParams.p.disableParams!.autofocus,
        tooltip: widget.elParams.p.disableParams!.tooltip,
        enableFeedback: widget.elParams.p.disableParams!.enableFeedback,
        constraints: widget.elParams.p.disableParams!.constraints,
        style: widget.elParams.p.disableParams!.style,
        isSelected: widget.elParams.p.disableParams!.isSelected,
        selectedIcon: widget.elParams.p.disableParams!.selectedIcon,
        icon: widget.elParams.p.disableParams!.icon!,
      );
    } else {
      return IconButton(
        key: widget.elParams.p.disableParams!.key,
        iconSize: widget.elParams.p.disableParams!.iconSize,
        visualDensity: widget.elParams.p.disableParams!.visualDensity,
        padding: widget.elParams.p.disableParams!.padding,
        alignment: widget.elParams.p.disableParams!.alignment,
        splashRadius: widget.elParams.p.disableParams!.splashRadius,
        color: widget.elParams.p.disableParams!.color,
        focusColor: widget.elParams.p.disableParams!.focusColor,
        hoverColor: widget.elParams.p.disableParams!.hoverColor,
        highlightColor: widget.elParams.p.disableParams!.highlightColor,
        splashColor: widget.elParams.p.disableParams!.splashColor,
        disabledColor: widget.elParams.p.enableTapLabel
            ? widget.elParams.p.enableParams!.color ?? Colors.black87
            : widget.elParams.p.disableParams!.disabledColor,
        onPressed: widget.elParams.p.enableTapLabel
            ? null
            : () {
                _onTapCallback(index);
              },
        mouseCursor: widget.elParams.p.disableParams!.mouseCursor,
        focusNode: widget.elParams.p.disableParams!.focusNode,
        autofocus: widget.elParams.p.disableParams!.autofocus,
        tooltip: widget.elParams.p.disableParams!.tooltip,
        enableFeedback: widget.elParams.p.disableParams!.enableFeedback,
        constraints: widget.elParams.p.disableParams!.constraints,
        style: widget.elParams.p.disableParams!.style,
        isSelected: widget.elParams.p.disableParams!.isSelected,
        selectedIcon: widget.elParams.p.disableParams!.selectedIcon,
        icon: widget.elParams.p.disableParams!.icon!,
      );
    }
  }

  List<Widget> _getIconAndWidget(int index) {
    if (widget.elParams.p.isPrefixIcon) {
      return [
        widget.elParams.p.manager!.getIndex(widget.sid) == index
            ? _getEnabledIconBtn(index)
            : _getDisableIconBtn(index),
        widget.children.children[index]
      ];
    } else {
      return [
        Expanded(child: widget.children.children[index]),
        widget.elParams.p.manager!.getIndex(widget.sid) == index
            ? _getEnabledIconBtn(index)
            : _getDisableIconBtn(index)
      ];
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
              children: _getIconAndWidget(i))));
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
