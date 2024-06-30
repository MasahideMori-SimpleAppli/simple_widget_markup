import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';
import '../../../../simple_widget_markup.dart';

///
/// (en) The popupMenuBtn.
///
/// (ja) popupMenuBtnの実装。
///
class PopupMenuBtnElement extends MultiChildElement {
  final PopupMenuBtnParamsWrapper elParams;

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
  PopupMenuBtnElement(
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
      : super(serial, EnumSpWMLElementType.popupMenuBtn, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, children);

  /// Get this class name.
  @override
  String getClassName() {
    return "PopupMenuBtnElement";
  }

  /// Initialize the parameters.
  @override
  PopupMenuBtnElement initParams() {
    super.initParams();
    // メニューアイテムのパラメーターはここでは設定できない。
    // 設定可能なのはウィジェット側パラメータのみ。
    elParams.p.isEnabled = params.containsKey(EnumSpWMLParams.isEnabled)
        ? params[EnumSpWMLParams.isEnabled]
        : true;
    elParams.p.icon = params.containsKey(EnumSpWMLParams.iconNum)
        ? Icon(
            params[EnumSpWMLParams.iconNum]!,
            color: params.containsKey(EnumSpWMLParams.iconColor)
                ? params[EnumSpWMLParams.iconColor]
                : null,
          )
        : null;
    elParams.p.iconSize = params.containsKey(EnumSpWMLParams.iconSize)
        ? params[EnumSpWMLParams.iconSize]
        : null;
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
    return _getBtn(context);
  }

  /// create dropdown button.
  Widget _getBtn(BuildContext context) {
    List<PopupMenuItem<int>> menus = [];
    final String sid = getSID()!;
    int count = 0;
    if (elParams.p.popupMenuItemParams.length == children.children.length) {
      for (final i in children.children) {
        final int v = count;
        menus.add(PopupMenuItem(
          key: elParams.p.popupMenuItemParams[v].key,
          value: v,
          onTap: elParams.p.isEnabled
              ? () {
                  elParams.p.manager!.setIndex(sid, v);
                  if (elParams.p.popupMenuItemParams[v].onTap == null) {
                    if (elParams.p.menuCallback != null) {
                      elParams.p.menuCallback!(v);
                    }
                  } else {
                    elParams.p.popupMenuItemParams[v].onTap!();
                  }
                }
              : null,
          enabled: elParams.p.popupMenuItemParams[v].enabled,
          height: elParams.p.popupMenuItemParams[v].height,
          padding: elParams.p.popupMenuItemParams[v].padding,
          textStyle: elParams.p.popupMenuItemParams[v].textStyle,
          mouseCursor: elParams.p.popupMenuItemParams[v].mouseCursor,
          child: i,
        ));
        count += 1;
      }
    } else {
      for (final i in children.children) {
        final int v = count;
        menus.add(PopupMenuItem(
            value: v,
            onTap: elParams.p.isEnabled
                ? () {
                    elParams.p.manager!.setIndex(sid, v);
                    if (elParams.p.menuCallback != null) {
                      elParams.p.menuCallback!(v);
                    }
                  }
                : null,
            child: i));
        count += 1;
      }
    }
    return _PopupMenuElementWidget(
      getSID()!,
      menus,
      elParams,
    );
  }

  /// (en)Set menus callback.
  ///
  /// (ja)ドロップダウンで展開されるメニューのコールバックを設定します。
  /// * [callback] : Menu callback.
  void setCallback(void Function(int index)? callback) {
    elParams.p.menuCallback = callback;
  }

  /// (en) Sets the value. Disabled if the manager class is not set.
  ///
  /// (ja) 値を設定します。マネージャークラスが未設定の場合は無効です。
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

  /// (en) Enable/disable this button.
  ///
  /// (ja)このボタンの有効・無効を切り替えます。
  ///
  /// * [isEnabled] : If true, the button is enabled.
  void setEnabled(bool isEnabled) {
    elParams.p.isEnabled = isEnabled;
  }
}

class _PopupMenuElementWidget extends StatefulWidget {
  final String sid;
  final List<PopupMenuEntry<int>> menus;
  final PopupMenuBtnParamsWrapper elParams;

  const _PopupMenuElementWidget(this.sid, this.menus, this.elParams);

  @override
  _PopupMenuElementWidgetState createState() => _PopupMenuElementWidgetState();
}

class _PopupMenuElementWidgetState extends State<_PopupMenuElementWidget> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      key: widget.elParams.p.key,
      itemBuilder: widget.elParams.p.itemBuilder ??
          (BuildContext context) {
            return widget.menus;
          },
      initialValue: widget.elParams.p.manager!.getIndex(widget.sid),
      onOpened: widget.elParams.p.onOpened,
      onSelected:
          widget.elParams.p.isEnabled ? widget.elParams.p.onSelected : null,
      onCanceled: widget.elParams.p.onCanceled,
      tooltip: widget.elParams.p.tooltip,
      elevation: widget.elParams.p.elevation,
      padding: widget.elParams.p.padding,
      splashRadius: widget.elParams.p.splashRadius,
      icon: widget.elParams.p.icon,
      iconSize: widget.elParams.p.iconSize,
      offset: widget.elParams.p.offset,
      enabled: widget.elParams.p.enabled,
      shape: widget.elParams.p.shape,
      color: widget.elParams.p.color,
      enableFeedback: widget.elParams.p.enableFeedback,
      constraints: widget.elParams.p.constraints,
      position: widget.elParams.p.position,
      clipBehavior: widget.elParams.p.clipBehavior,
      child: widget.elParams.p.child,
    );
  }
}
