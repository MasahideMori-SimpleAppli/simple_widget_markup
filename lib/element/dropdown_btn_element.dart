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
class DropdownBtnElement extends SpWMLElement {
  final StructureElementChildren children;
  final ShowMenuBtnElementParams menuBtnParam;

  DropdownBtnElement(
      int serial,
      List<String> param,
      ElementParams text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children,
      this.menuBtnParam)
      : super(serial, EnumSpWMLElementType.dropdownBtn, param, text,
            parentSerial, lineStart, lineEnd, style);

  const DropdownBtnElement.convert(
      int serial,
      Map<EnumSpWMLElementParam, dynamic> param,
      ElementParams text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children,
      this.menuBtnParam)
      : super.convert(serial, EnumSpWMLElementType.dropdownBtn, param, text,
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
    List<DropdownMenuItem<int>> menus = [];
    int count = 0;
    final int cLength = menuBtnParam.menuCallbacks.length;
    for (final i in children.children) {
      final int v = count;
      if (cLength > v) {
        menus.add(DropdownMenuItem(
            child: i, value: v, onTap: menuBtnParam.menuCallbacks[v]));
      } else {
        menus.add(DropdownMenuItem(child: i, value: v));
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
      return _DropDownElementWidget(
          menus,
          menuBtnParam,
          icon,
          param.containsKey(EnumSpWMLElementParam.iconSize)
              ? param[EnumSpWMLElementParam.iconSize]
              : null);
    } else {
      return _DropDownElementWidget(menus, menuBtnParam, null, null);
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

class _DropDownElementWidget extends StatefulWidget {
  final List<DropdownMenuItem<int>> menus;
  final ShowMenuBtnElementParams ddBtnParam;
  final Icon? icon;
  final double? iconSize;

  const _DropDownElementWidget(
      this.menus, this.ddBtnParam, this.icon, this.iconSize);

  @override
  _DropDownElementWidgetState createState() => _DropDownElementWidgetState();
}

class _DropDownElementWidgetState extends State<_DropDownElementWidget> {
  int _selectedItem = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: widget.icon,
      iconSize: widget.iconSize ?? 24.0,
      items: widget.menus,
      value: _selectedItem,
      onChanged: (int? v) => {
        setState(() {
          if (v != null) {
            _selectedItem = v;
          }
        }),
      },
    );
  }
}
