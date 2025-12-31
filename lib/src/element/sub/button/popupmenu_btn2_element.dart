import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';
import 'package:simple_widget_markup/simple_widget_markup.dart';

///
/// (en) The popupMenuBtn2.
/// This is a flavor of popupMenuBtn that differs in
/// how it manages the selection.
/// To use this class, you must set the tag for
/// all child (immediate descendants only).
///
/// (ja) popupMenuBtn2の実装。
/// これは、選択内容の管理方法が異なる popupMenuBtn の一種です。
/// このクラスを使用するには、すべての小要素（直下のみ）にtagを設定する必要があります。
///
class PopupMenuBtn2Element extends MultiChildElement {
  final PopupMenuBtn2ParamsWrapper elParams;

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
  PopupMenuBtn2Element(
    int serial,
    Map<String, String> params,
    SpWMLParamsWrapper spwmlParams,
    int parentSerial,
    int lineStart,
    int lineEnd,
    SpWMLFontStyle style,
    SpWMLInfo? info,
    StructureElementChildren children,
    this.elParams, {
    super.key,
  }) : super(
          serial,
          EnumSpWMLElementType.popupMenuBtn2,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          children,
        );

  /// Get this class name.
  @override
  String getClassName() {
    return "PopupMenuBtn2Element";
  }

  /// Initialize the parameters.
  @override
  PopupMenuBtn2Element initParams() {
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
      throw SpWMLException(
        EnumSpWMLExceptionType.sidDoesNotExistException,
        lineStart,
        lineEnd,
        info,
      );
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
    List<PopupMenuItem<String>> menus = [];
    final String sid = getSID()!;
    if (elParams.p.popupMenuItemParams.length == children.children.length) {
      int count = 0;
      for (final i in children.children) {
        final int v = count;
        if (i is! SpWMLElement) {
          throw SpWMLException(
            EnumSpWMLExceptionType.childrenTagNotExistException,
            -1,
            -1,
            SpWMLInfo(errorHint: 'popupMenuBtn2, sid=$sid'),
          );
        }
        final String? targetTag = i.getTag();
        if (targetTag == null) {
          throw SpWMLException(
            EnumSpWMLExceptionType.childrenTagNotExistException,
            -1,
            -1,
            SpWMLInfo(errorHint: 'popupMenuBtn2, sid=$sid'),
          );
        }
        menus.add(
          PopupMenuItem(
            key: elParams.p.popupMenuItemParams[v].key,
            value: targetTag,
            onTap: elParams.p.isEnabled
                ? () {
                    elParams.p.manager!.setSelection(sid, targetTag);
                    if (elParams.p.popupMenuItemParams[v].onTap == null) {
                      if (elParams.p.menuCallback != null) {
                        elParams.p.menuCallback!(targetTag);
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
          ),
        );
        count += 1;
      }
    } else {
      for (final i in children.children) {
        if (i is! SpWMLElement) {
          throw SpWMLException(
            EnumSpWMLExceptionType.childrenTagNotExistException,
            -1,
            -1,
            SpWMLInfo(errorHint: 'popupMenuBtn2, sid=$sid'),
          );
        }
        final String? targetTag = i.getTag();
        if (targetTag == null) {
          throw SpWMLException(
            EnumSpWMLExceptionType.childrenTagNotExistException,
            -1,
            -1,
            SpWMLInfo(errorHint: 'popupMenuBtn2, sid=$sid'),
          );
        }
        menus.add(
          PopupMenuItem(
            value: targetTag,
            onTap: elParams.p.isEnabled
                ? () {
                    elParams.p.manager!.setSelection(sid, targetTag);
                    if (elParams.p.menuCallback != null) {
                      elParams.p.menuCallback!(targetTag);
                    }
                  }
                : null,
            child: i,
          ),
        );
      }
    }
    return _PopupMenuElement2Widget(getSID()!, menus, elParams);
  }

  /// (en)Set menus callback.
  ///
  /// (ja)ドロップダウンで展開されるメニューのコールバックを設定します。
  /// * [callback] : Menu callback.
  void setCallback(void Function(String? tag)? callback) {
    elParams.p.menuCallback = callback;
  }

  /// (en) Sets the value. Disabled if the manager class is not set.
  ///
  /// (ja) 値を設定します。マネージャークラスが未設定の場合は無効です。
  /// * [tag] : Tag name.
  void setValue(String? tag) {
    if (elParams.p.manager != null) {
      final String? sid = getSID();
      if (sid != null) {
        elParams.p.manager!.setSelection(sid, tag);
      }
    }
  }

  /// (en) Get the value.
  /// If the manager class has not been set or there is no value,
  /// null is returned.
  ///
  /// (ja) 値を取得します。
  /// マネージャークラスが未設定の場合や、値が無い場合はnullが返ります。
  String? getValue() {
    if (elParams.p.manager != null) {
      final String? sid = getSID();
      if (sid != null) {
        return elParams.p.manager!.getSelection(sid);
      }
    }
    return null;
  }

  /// (en) Sets the manager class that manages the state.
  ///
  /// (ja) 状態を管理するマネージャクラスを設定します。
  /// * [m] : Manager class.
  /// * [sid] : This element sid.
  void setManager(TagSelectionManager m, String sid) {
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
}

class _PopupMenuElement2Widget extends StatefulWidget {
  final String sid;
  final List<PopupMenuEntry<String>> menus;
  final PopupMenuBtn2ParamsWrapper elParams;

  const _PopupMenuElement2Widget(this.sid, this.menus, this.elParams);

  @override
  _PopupMenuElement2WidgetState createState() =>
      _PopupMenuElement2WidgetState();
}

class _PopupMenuElement2WidgetState extends State<_PopupMenuElement2Widget> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      key: widget.elParams.p.key,
      itemBuilder: widget.elParams.p.itemBuilder ??
          (BuildContext context) {
            return widget.menus;
          },
      initialValue: widget.elParams.p.manager!.getSelection(widget.sid),
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
