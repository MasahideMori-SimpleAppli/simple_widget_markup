import 'package:flutter/material.dart';
import 'element_child.dart';
import '../element_params/element_params.dart';
import 'enum_spwml_element_param.dart';
import 'enum_spwml_element_type.dart';
import 'spwml_font_style.dart';
import 'spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-04-11 15:02:04
///
class PopupMenuBtnElement extends SpWMLElement {
  final StructureElementChildren children;
  final ShowMenuBtnElementParams menuBtnParam;

  PopupMenuBtnElement(
      int serial,
      List<String> param,
      ElementParams text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children,
      this.menuBtnParam)
      : super(serial, EnumSpWMLElementType.popupMenuBtn, param, text,
            parentSerial, lineStart, lineEnd, style);

  const PopupMenuBtnElement.convert(
      int serial,
      Map<EnumSpWMLElementParam, dynamic> param,
      ElementParams text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children,
      this.menuBtnParam)
      : super.convert(serial, EnumSpWMLElementType.popupMenuBtn, param, text,
            parentSerial, lineStart, lineEnd, style);

  @override
  Widget getWidget(BuildContext context) {
    return ConstrainedBox(
        constraints: getConstraints(),
        child: Container(
            width: param.containsKey(EnumSpWMLElementParam.width)
                ? param[EnumSpWMLElementParam.width]!
                : null,
            height: param.containsKey(EnumSpWMLElementParam.height)
                ? param[EnumSpWMLElementParam.height]!
                : null,
            margin: getMargin(),
            padding: getPadding(),
            child: _getBtn(context)));
  }

  /// create dropdown button.
  Widget _getBtn(BuildContext context) {
    final bool isContainIcon = param.containsKey(EnumSpWMLElementParam.iconNum);
    List<PopupMenuEntry<int>> menus = [];
    int count = 0;
    final int cLength = menuBtnParam.menuCallbacks.length;
    for (final i in children.children) {
      final int v = count;
      if (cLength > v) {
        menus.add(PopupMenuItem(child: i, value: v, onTap: menuBtnParam.menuCallbacks[v]));
      } else {
        menus.add(PopupMenuItem(child: i, value: v));
      }
      count += 1;
    }
    if (isContainIcon) {
      final icon = Icon(
        (param[EnumSpWMLElementParam.iconNum]! as Icon).icon,
        color: param.containsKey(EnumSpWMLElementParam.iconColor)
            ? param[EnumSpWMLElementParam.iconColor]
            : null,
      );
      return _PopupMenuElementWidget(
          menus,
          menuBtnParam,
          icon,
          param.containsKey(EnumSpWMLElementParam.iconSize)
              ? param[EnumSpWMLElementParam.iconSize]
              : null);
    } else {
      return _PopupMenuElementWidget(menus, menuBtnParam, null, null);
    }
  }

  /// (en)Set menus callback.
  ///
  /// (ja)ドロップダウンで展開されるメニューのコールバックを設定します。
  /// * [callbacks] : Menu callback.
  void setCallback(List<void Function()?> callbacks) {
    menuBtnParam.menuCallbacks = callbacks;
  }
}

class _PopupMenuElementWidget extends StatefulWidget {
  final List<PopupMenuEntry<int>> menus;
  final ShowMenuBtnElementParams menuBtnParam;
  final Icon? icon;
  final double? iconSize;

  const _PopupMenuElementWidget(
      this.menus, this.menuBtnParam, this.icon, this.iconSize);

  @override
  _PopupMenuElementWidgetState createState() => _PopupMenuElementWidgetState();
}

class _PopupMenuElementWidgetState extends State<_PopupMenuElementWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: widget.icon,
      iconSize: widget.iconSize ?? 24.0,
      itemBuilder: (BuildContext context) { return widget.menus; },
    );
  }
}
