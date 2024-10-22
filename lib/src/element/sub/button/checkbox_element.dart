import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';
import '../../../../simple_widget_markup.dart';

///
/// (en) The checkbox.
///
/// (ja) checkboxの実装。
///
class CheckboxElement extends MultiChildElement {
  final CheckboxParamsWrapper elParams;

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
  CheckboxElement(
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
      : super(serial, EnumSpWMLElementType.checkbox, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, children);

  /// Get this class name.
  @override
  String getClassName() {
    return "CheckboxElement";
  }

  /// Initialize the parameters.
  @override
  CheckboxElement initParams() {
    super.initParams();
    elParams.p.isEnabled = params.containsKey(EnumSpWMLParams.isEnabled)
        ? params[EnumSpWMLParams.isEnabled]
        : true;
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
    elParams.p.isPrefixIcon = params.containsKey(EnumSpWMLParams.isPrefixIcon)
        ? params[EnumSpWMLParams.isPrefixIcon]
        : true;
    if (params.containsKey(EnumSpWMLParams.isV3)) {
      elParams.p.enableParams!.isV3 = params[EnumSpWMLParams.isV3];
      elParams.p.disableParams!.isV3 = params[EnumSpWMLParams.isV3];
      enabled.icon = const Icon(Icons.check_box);
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
    final String? sid = getSID();
    if (sid != null) {
      List<bool> manageFlags = elParams.p.manager!.getFlags(sid);
      // まだ内容が未構成の場合
      if (manageFlags.isEmpty) {
        for (int i = 0; i < children.children.length; i++) {
          manageFlags.add(false);
        }
        elParams.p.manager!.setFlags(sid, manageFlags);
      }
    }
    return _CheckboxElementWidget(getSID()!, children, elParams, getShape());
  }

  /// (en)Set checkboxes callback.
  ///
  /// (ja)チェックボックスのコールバックを設定します。
  /// * [callback] : The checkboxes callback.
  void setCallback(void Function(List<bool>? checkValues)? callback) {
    elParams.p.callback = callback;
  }

  /// (en) Sets the value. Disabled if the manager class is not set.
  ///
  /// (ja) 値を設定します。マネージャークラスが未設定の場合は無効です。
  /// * [v] : value.
  void setValue(List<bool> v) {
    if (elParams.p.manager != null) {
      final String? sid = getSID();
      if (sid != null) {
        elParams.p.manager!.setFlags(sid, v);
      }
    }
  }

  /// (en) Get the value.
  /// If the manager class has not been set or there is no value,
  /// null is returned.
  ///
  /// (ja) 値を取得します。
  /// マネージャークラスが未設定の場合や、値が無い場合はnullが返ります。
  List<bool>? getValue() {
    if (elParams.p.manager != null) {
      final String? sid = getSID();
      if (sid != null) {
        return elParams.p.manager!.getFlags(sid);
      }
    }
    return null;
  }

  /// (en) Sets the manager class that manages the state.
  ///
  /// (ja) 状態を管理するマネージャクラスを設定します。
  /// * [m] : Manager class.
  /// * [sid] : This element sid.
  void setManager(MultiFlagManager m, String sid) {
    elParams.p.manager = m;
    // このエレメントはビルドした時に子ビューが確定し、初期化されるのでここでの初期化は不要。
    // elParams.p.manager!.getFlags(sid, initialValues: null);
  }

  /// (en) Enable/disable this button.
  ///
  /// (ja)このボタンの有効・無効を切り替えます。
  ///
  /// * [isEnabled] : If true, the button is enabled.
  void setEnabled(bool isEnabled) {
    elParams.p.isEnabled = isEnabled;
  }

  /// (en) Specify the checkbox you want to disable by index number.
  /// If set to empty, all checkbox will be enabled.
  /// However, if disabled with setEnabled, all checkbox will remain disabled.
  ///
  /// (ja) 無効にしたいチェックボックスをインデックス番号で指定します。
  /// 空を設定した場合は全てのチェックボックスが有効化されます。
  /// ただし、setEnabledで無効化された場合は全てのチェックボックスが無効なままになります。
  ///
  /// * [indexes] : A list of indexes of buttons you want to disable.
  void setDisabledIndexes(List<int> indexes) {
    elParams.p.disabledIndexes = indexes;
  }
}

class _CheckboxElementWidget extends StatefulWidget {
  final String sid;
  final StructureElementChildren children;
  final CheckboxParamsWrapper elParams;
  final OutlinedBorder? shape;

  const _CheckboxElementWidget(
      this.sid, this.children, this.elParams, this.shape);

  @override
  _CheckboxElementWidgetState createState() => _CheckboxElementWidgetState();
}

class _CheckboxElementWidgetState extends State<_CheckboxElementWidget> {
  /// The onTap callback.
  void _onTapCallback(int index) {
    if (mounted) {
      setState(() {
        widget.elParams.p.manager!.getFlags(widget.sid)[index] =
            !widget.elParams.p.manager!.getFlags(widget.sid)[index];
        if (widget.elParams.p.callback != null) {
          widget.elParams.p
              .callback!(widget.elParams.p.manager!.getFlags(widget.sid));
        }
      });
    }
  }

  /// Return wrapped widget.
  Widget _getWrap(int index, Widget w) {
    if (widget.elParams.p.enableTapLabel) {
      return InkWell(
        key: widget.elParams.p.enableTapInkWellParams.key,
        onTap: widget.elParams.p.isEnabled &&
                !widget.elParams.p.disabledIndexes.contains(index)
            ? () {
                _onTapCallback(index);
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

  Widget _getIconBtn(int index, SelectableIconBtnParams params) {
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
                !widget.elParams.p.disabledIndexes.contains(index)
            ? () {
                _onTapCallback(index);
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
                !widget.elParams.p.disabledIndexes.contains(index)
            ? () {
                _onTapCallback(index);
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

  List<Widget> _getIconAndWidget(int index) {
    final bool isSelected =
        widget.elParams.p.manager!.getFlags(widget.sid)[index];
    if (widget.elParams.p.isPrefixIcon) {
      return [
        _getIconBtn(index, _getParams(isSelected)),
        widget.children.children[index]
      ];
    } else {
      return [
        Expanded(child: widget.children.children[index]),
        _getIconBtn(index, _getParams(isSelected))
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
