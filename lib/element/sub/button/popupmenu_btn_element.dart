import 'package:flutter/material.dart';

import '../../../element_params/element_child.dart';
import '../../../element_params/sub/button/popupmenu_btn_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../spwml_font_style.dart';
import '../../super/spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-04-11 15:02:04
///
class PopupMenuBtnElement extends SpWMLElement {
  final StructureElementChildren children;
  final PopupMenuBtnParamsWrapper elParams;

  PopupMenuBtnElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlEP,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children,
      this.elParams)
      : super(serial, EnumSpWMLElementType.popupMenuBtn, params, spwmlEP,
            parentSerial, lineStart, lineEnd, style);

  @override
  PopupMenuBtnElement initParams() {
    super.initParams();
    // メニューアイテムのパラメーターはここでは設定できない。
    // 設定可能なのはウィジェット側パラメータのみ。
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
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    return _getBtn(context);
  }

  /// create dropdown button.
  Widget _getBtn(BuildContext context) {
    List<PopupMenuItem<int>> menus = [];
    int count = 0;
    if (elParams.p.popupMenuItemParams.length == children.children.length) {
      for (final i in children.children) {
        final int v = count;
        menus.add(PopupMenuItem(
          key: elParams.p.popupMenuItemParams[v].key,
          value: v,
          onTap: () {
            if (elParams.p.popupMenuItemParams[v].onTap == null) {
              if (elParams.p.menuCallback != null) {
                elParams.p.menuCallback!(v);
              }
            } else {
              elParams.p.popupMenuItemParams[v].onTap!();
            }
          },
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
        if (elParams.p.menuCallback != null) {
          menus.add(PopupMenuItem(
              child: i,
              value: v,
              onTap: () {
                elParams.p.menuCallback!(v);
              }));
        } else {
          menus.add(PopupMenuItem(child: i, value: v));
        }
        count += 1;
      }
    }
    return _PopupMenuElementWidget(
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
}

class _PopupMenuElementWidget extends StatefulWidget {
  final List<PopupMenuEntry<int>> menus;
  final PopupMenuBtnParamsWrapper elParam;

  const _PopupMenuElementWidget(this.menus, this.elParam);

  @override
  _PopupMenuElementWidgetState createState() => _PopupMenuElementWidgetState();
}

class _PopupMenuElementWidgetState extends State<_PopupMenuElementWidget> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      key: widget.elParam.p.key,
      itemBuilder: widget.elParam.p.itemBuilder ??
          (BuildContext context) {
            return widget.menus;
          },
      initialValue: widget.elParam.p.initialValue,
      onSelected: widget.elParam.p.onSelected,
      onCanceled: widget.elParam.p.onCanceled,
      tooltip: widget.elParam.p.tooltip,
      elevation: widget.elParam.p.elevation,
      padding: widget.elParam.p.padding,
      child: widget.elParam.p.child,
      splashRadius: widget.elParam.p.splashRadius,
      icon: widget.elParam.p.icon,
      iconSize: widget.elParam.p.iconSize,
      offset: widget.elParam.p.offset,
      enabled: widget.elParam.p.enabled,
      shape: widget.elParam.p.shape,
      color: widget.elParam.p.color,
      enableFeedback: widget.elParam.p.enableFeedback,
      constraints: widget.elParam.p.constraints,
      position: widget.elParam.p.position,
    );
  }
}
