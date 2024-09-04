import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';
import '../../../../simple_widget_markup.dart';

///
/// (en) The dropDownBtn2.
/// This is a flavor of dropDownBtn that differs in
/// how it manages the selection.
/// To use this class, you must set the tag for
/// all child (immediate descendants only).
///
/// (ja) dropDownBtn2の実装。
/// これは、選択内容の管理方法が異なる dropDownBtn の一種です。
/// このクラスを使用するには、すべての小要素（直下のみ）にtagを設定する必要があります。
///
class DropdownBtn2Element extends MultiChildElement {
  final DropdownBtn2ParamsWrapper elParams;

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
  DropdownBtn2Element(
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
      : super(serial, EnumSpWMLElementType.dropdownBtn2, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, children);

  /// Get this class name.
  @override
  String getClassName() {
    return "DropdownBtn2Element";
  }

  /// Initialize the parameters.
  @override
  DropdownBtn2Element initParams() {
    super.initParams();
    // メニューアイテムのパラメーターはここでは設定できない。
    // 設定可能なのはウィジェット側パラメータのみ。
    elParams.p.isEnabled = params.containsKey(EnumSpWMLParams.isEnabled)
        ? params[EnumSpWMLParams.isEnabled]
        : true;
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
    final String sid = getSID()!;
    List<DropdownMenuItem<String>> menus = [];
    if (elParams.p.dropdownMenuItemParams.length == children.children.length) {
      int count = 0;
      for (final i in children.children) {
        final int v = count;
        if (i is! SpWMLElement) {
          throw SpWMLException(
              EnumSpWMLExceptionType.childrenTagNotExistException,
              -1,
              -1,
              SpWMLInfo(errorHint: 'dropdownBtn2, sid=$sid'));
        }
        final String? targetTag = i.getTag();
        if (targetTag == null) {
          throw SpWMLException(
              EnumSpWMLExceptionType.childrenTagNotExistException,
              -1,
              -1,
              SpWMLInfo(errorHint: 'dropdownBtn2, sid=$sid'));
        }
        menus.add(DropdownMenuItem(
          key: elParams.p.dropdownMenuItemParams[v].key,
          onTap: () {
            elParams.p.manager!.setSelection(sid, targetTag);
            if (elParams.p.dropdownMenuItemParams[v].onTap == null) {
              if (elParams.p.menuCallback != null) {
                elParams.p.menuCallback!(targetTag);
              }
            } else {
              elParams.p.dropdownMenuItemParams[v].onTap!();
            }
          },
          value: targetTag,
          enabled: elParams.p.dropdownMenuItemParams[v].enabled,
          alignment: elParams.p.dropdownMenuItemParams[v].alignment,
          child: i,
        ));
        count += 1;
      }
    } else {
      for (final i in children.children) {
        if (i is! SpWMLElement) {
          throw SpWMLException(
              EnumSpWMLExceptionType.childrenTagNotExistException,
              -1,
              -1,
              SpWMLInfo(errorHint: 'dropdownBtn2, sid=$sid'));
        }
        final String? targetTag = i.getTag();
        if (targetTag == null) {
          throw SpWMLException(
              EnumSpWMLExceptionType.childrenTagNotExistException,
              -1,
              -1,
              SpWMLInfo(errorHint: 'dropdownBtn2, sid=$sid'));
        }
        menus.add(DropdownMenuItem(
            value: targetTag,
            onTap: () {
              elParams.p.manager!.setSelection(sid, targetTag);
              if (elParams.p.menuCallback != null) {
                elParams.p.menuCallback!(targetTag);
              }
            },
            child: i));
      }
    }
    return _DropDownElement2Widget(
      getSID()!,
      menus,
      elParams,
    );
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
  ///
  /// * [tag] : Tag name.
  void setValue(String? tag) {
    if (elParams.p.manager != null) {
      final String? sid = getSID();
      if (sid != null) {
        elParams.p.manager!.setSelection(sid, tag);
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
}

class _DropDownElement2Widget extends StatefulWidget {
  final String sid;
  final List<DropdownMenuItem<String>> menus;
  final DropdownBtn2ParamsWrapper elParams;

  const _DropDownElement2Widget(this.sid, this.menus, this.elParams);

  @override
  _DropDownElement2WidgetState createState() => _DropDownElement2WidgetState();
}

class _DropDownElement2WidgetState extends State<_DropDownElement2Widget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      key: widget.elParams.p.key,
      items: widget.elParams.p.items ?? widget.menus,
      selectedItemBuilder: widget.elParams.p.selectedItemBuilder,
      value: widget.elParams.p.manager!.getSelection(widget.sid),
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
      onChanged: widget.elParams.p.isEnabled
          ? (String? v) => {
                if (mounted)
                  {
                    setState(() {}),
                  }
              }
          : null,
    );
  }
}
