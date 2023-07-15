import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';
import '../../../../simple_widget_markup.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-04-11 15:02:04
///
class DropdownBtnElement extends MultiChildElement {
  final DropdownBtnParamsWrapper elParams;

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
  DropdownBtnElement(
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
      : super(serial, EnumSpWMLElementType.dropdownBtn, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, children);

  /// Initialize the parameters.
  @override
  DropdownBtnElement initParams() {
    super.initParams();
    // メニューアイテムのパラメーターはここでは設定できない。
    // 設定可能なのはウィジェット側パラメータのみ。
    elParams.p.hint = params.containsKey(EnumSpWMLParams.hint)
        ? Text(params[EnumSpWMLParams.hint] as String)
        : null;
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
    if (params.containsKey(EnumSpWMLParams.underlineColor) ||
        params.containsKey(EnumSpWMLParams.underlineHeight)) {
      elParams.p.underline = Container(
          color: params.containsKey(EnumSpWMLParams.underlineColor)
              ? params[EnumSpWMLParams.underlineColor]
              : Colors.black87,
          height: params.containsKey(EnumSpWMLParams.underlineHeight)
              ? params[EnumSpWMLParams.underlineHeight]
              : 1.0);
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
    return _getBtn(context);
  }

  /// create dropdown button.
  Widget _getBtn(BuildContext context) {
    // マネージャークラスが未設定の場合、仮のマネージャークラスを生成する。
    elParams.p.manager ??= IndexManager();
    final String sid = getSID()!;
    List<DropdownMenuItem<int>> menus = [];
    int count = 0;
    if (elParams.p.dropdownMenuItemParams.length == children.children.length) {
      for (final i in children.children) {
        final int v = count;
        menus.add(DropdownMenuItem(
          key: elParams.p.dropdownMenuItemParams[v].key,
          onTap: () {
            elParams.p.manager!.setIndex(sid, v);
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
              value: v,
              onTap: () {
                elParams.p.manager!.setIndex(sid, v);
                elParams.p.menuCallback!(v);
              },
              child: i));
        } else {
          menus.add(DropdownMenuItem(value: v, child: i));
        }
        count += 1;
      }
    }
    return _DropDownElementWidget(
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

class _DropDownElementWidget extends StatefulWidget {
  final String sid;
  final List<DropdownMenuItem<int>> menus;
  final DropdownBtnParamsWrapper elParams;

  const _DropDownElementWidget(this.sid, this.menus, this.elParams);

  @override
  _DropDownElementWidgetState createState() => _DropDownElementWidgetState();
}

class _DropDownElementWidgetState extends State<_DropDownElementWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      key: widget.elParams.p.key,
      items: widget.elParams.p.items ?? widget.menus,
      selectedItemBuilder: widget.elParams.p.selectedItemBuilder,
      value: widget.elParams.p.manager!.getIndex(widget.sid),
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
      padding: widget.elParams.p.padding,
      onChanged: (int? v) => {
        setState(() {}),
      },
    );
  }
}
