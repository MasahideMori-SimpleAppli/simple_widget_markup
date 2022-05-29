import 'package:flutter/material.dart';

import '../../../element_params/element_child.dart';
import '../../../element_params/sub/button/dropdown_btn_params.dart';
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
class DropdownBtnElement extends SpWMLElement {
  final StructureElementChildren children;
  final DropdownBtnParamsWrapper elParams;

  DropdownBtnElement(
      int serial,
      List<String> param,
      SpWMLParamsWrapper spwmlEP,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children,
      this.elParams)
      : super(serial, EnumSpWMLElementType.dropdownBtn, param, spwmlEP,
            parentSerial, lineStart, lineEnd, style);

  @override
  DropdownBtnElement initParams() {
    super.initParams();
    // メニューアイテムのパラメーターはここでは設定できない。
    // 設定可能なのはウィジェット側パラメータのみ。
    elParams.p.hint = params.containsKey(EnumSpWMLParams.hint)
        ? Text(params[EnumSpWMLParams.hint] as String)
        : null;
    if (elParams.p.hint == null) {
      elParams.p.selectedIndex = 0;
    }
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
        : 24.0;
    elParams.p.isExpanded = params.containsKey(EnumSpWMLParams.isExpanded)
        ? params[EnumSpWMLParams.isExpanded]
        : false;
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    return _getBtn(context);
  }

  /// create dropdown button.
  Widget _getBtn(BuildContext context) {
    List<DropdownMenuItem<int>> menus = [];
    int count = 0;
    if (elParams.p.dropdownMenuItemParams.length == children.children.length) {
      for (final i in children.children) {
        final int v = count;
        menus.add(DropdownMenuItem(
          key: elParams.p.dropdownMenuItemParams[v].key,
          onTap: () {
            if (elParams.p.dropdownMenuItemParams[v].onTap == null) {
              if (elParams.p.menuCallback != null) {
                elParams.p.menuCallback!(v);
              }
            } else {
              elParams.p.dropdownMenuItemParams[v].onTap!();
            }
          },
          value: v,
          enabled: elParams.p.dropdownMenuItemParams[v].enabled,
          alignment: elParams.p.dropdownMenuItemParams[v].alignment,
          child: i,
        ));
        count += 1;
      }
    } else {
      for (final i in children.children) {
        final int v = count;
        if (elParams.p.menuCallback != null) {
          menus.add(DropdownMenuItem(
              child: i,
              value: v,
              onTap: () {
                elParams.p.menuCallback!(v);
              }));
        } else {
          menus.add(DropdownMenuItem(child: i, value: v));
        }
        count += 1;
      }
    }
    return _DropDownElementWidget(
      menus,
      elParams,
    );
  }

  /// (en)Set initial index of dropdown items.
  ///
  /// (ja)ドロップダウンアイテムの初期インデックスを設定します。
  /// * [index] : The index. The first child element is counted as 0.
  void setInitialIndex(int? index) {
    elParams.p.selectedIndex = index;
  }

  /// (en)Set menus callback.
  ///
  /// (ja)ドロップダウンで展開されるメニューのコールバックを設定します。
  /// * [callback] : Menu callback.
  void setCallback(void Function(int index)? callback) {
    elParams.p.menuCallback = callback;
  }
}

class _DropDownElementWidget extends StatefulWidget {
  final List<DropdownMenuItem<int>> menus;
  final DropdownBtnParamsWrapper elParams;

  const _DropDownElementWidget(this.menus, this.elParams);

  @override
  _DropDownElementWidgetState createState() => _DropDownElementWidgetState();
}

class _DropDownElementWidgetState extends State<_DropDownElementWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      key: widget.elParams.p.key,
      items: widget.elParams.p.items ?? widget.menus,
      selectedItemBuilder: widget.elParams.p.selectedItemBuilder,
      value: widget.elParams.p.selectedIndex,
      hint: widget.elParams.p.hint,
      disabledHint: widget.elParams.p.disabledHint,
      onTap: widget.elParams.p.onTap,
      elevation: widget.elParams.p.elevation,
      style: widget.elParams.p.style,
      underline: widget.elParams.p.underline,
      icon: widget.elParams.p.icon,
      iconDisabledColor: widget.elParams.p.iconDisabledColor,
      iconEnabledColor: widget.elParams.p.iconEnabledColor,
      iconSize: widget.elParams.p.iconSize,
      isDense: widget.elParams.p.isDense,
      isExpanded: widget.elParams.p.isExpanded,
      itemHeight: widget.elParams.p.itemHeight,
      focusColor: widget.elParams.p.focusColor,
      focusNode: widget.elParams.p.focusNode,
      autofocus: widget.elParams.p.autofocus,
      dropdownColor: widget.elParams.p.dropdownColor,
      menuMaxHeight: widget.elParams.p.menuMaxHeight,
      enableFeedback: widget.elParams.p.enableFeedback,
      alignment: widget.elParams.p.alignment,
      borderRadius: widget.elParams.p.borderRadius,
      onChanged: (int? v) => {
        setState(() {
          if (v != null) {
            widget.elParams.p.selectedIndex = v;
          }
        }),
      },
    );
  }
}