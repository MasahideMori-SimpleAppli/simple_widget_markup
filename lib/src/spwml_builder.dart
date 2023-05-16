import 'package:flutter/material.dart';
import 'package:textfield_manager/textfield_manager.dart';
import '../simple_widget_markup.dart';

///
/// (en)A builder class for converting SpWML to widgets.
///
/// (ja)SpWMLをウィジェットに変換するためのビルダークラスです。
///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-29 18:40:02
///
class SpWMLBuilder {
  final List<SpWMLElement> _parsedWidgets;
  final MainAxisAlignment mainAA;
  final CrossAxisAlignment crossAA;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final SpWMLFontStyle style;
  final GlobalKey? key;
  final SpWMLInfo? info;

  /// Constructor
  /// * [spWML] : SpWML text.
  /// * [mainAA] : Top level Column MainAxisAlignment.
  /// * [crossAA] : Top level Column CrossAxisAlignment.
  /// * [margin] : Top level Column Margin.
  /// * [padding] : Top level Column Padding.
  /// * [spWMLStyle] : Font styles. If you want to change the default style,
  /// you can change the contents of the singleton SpWMLFontManager class.
  /// * [info] : This is information object. e.g. A hint when an error occurs.
  /// It is convenient to set when nesting multiple SpWMLs.
  SpWMLBuilder(spWML,
      {this.mainAA = MainAxisAlignment.start,
      this.crossAA = CrossAxisAlignment.start,
      this.margin = const EdgeInsets.all(0),
      this.padding = const EdgeInsets.all(0),
      SpWMLFontStyle? spWMLStyle,
      this.info,
      this.key})
      : _parsedWidgets = SpWMLParser.run(
            spWML, spWMLStyle ?? SpWMLFontStyleManager().style, info),
        style = spWMLStyle ?? SpWMLFontStyleManager().style;

  /// (en)Replaces the contents of the specified ID with a widget.
  ///
  /// (ja)指定IDの内容をウィジェットで置き換えます。
  ///
  /// * [id] : Target ID.
  /// * [newWidget] : Replace Widget.
  ///
  /// Throws [SpWMLException] : If target is null, throws nullException.
  void replaceID(int id, Widget newWidget) {
    // 空の場合もあるのでフラグ処理が必要。
    bool needReturn = false;
    Widget? removeTarget;
    for (int i = 0; i < _parsedWidgets.length; i++) {
      final SpWMLElement elm = _parsedWidgets[i];
      if (elm.params.containsKey(EnumSpWMLParams.id)) {
        if (elm.params[EnumSpWMLParams.id] == id) {
          if (elm is SingleChildElement) {
            elm.child.child = newWidget;
            for (SpWMLElement j in _parsedWidgets) {
              if (elm.serial == j.parentSerial) {
                removeTarget = j;
              }
            }
            needReturn = true;
            break;
          } else if (elm is SingleChildTextElement) {
            elm.child.child = newWidget;
            for (SpWMLElement j in _parsedWidgets) {
              if (elm.serial == j.parentSerial) {
                removeTarget = j;
              }
            }
            needReturn = true;
            break;
          } else {
            throw SpWMLException(
                EnumSpWMLExceptionType.replaceException, -1, -1, info);
          }
        }
      }
    }
    if (removeTarget != null) {
      _parsedWidgets.remove(removeTarget);
    }
    if (needReturn) {
      return;
    }
    throw SpWMLException(EnumSpWMLExceptionType.nullException, -1, -1, info);
  }

  /// (en)Replaces the contents of the specified String ID with a widget.
  ///
  /// (ja)指定String IDの内容をウィジェットで置き換えます。
  ///
  /// * [sid] : Target String ID.
  /// * [newWidget] : Replace Widget.
  ///
  /// Throws [SpWMLException] : If target is null, throws nullException.
  void replaceSID(String sid, Widget newWidget) {
    // 空の場合もあるのでフラグ処理が必要。
    bool needReturn = false;
    Widget? removeTarget;
    for (int i = 0; i < _parsedWidgets.length; i++) {
      final SpWMLElement elm = _parsedWidgets[i];
      if (elm.params.containsKey(EnumSpWMLParams.sid)) {
        if (elm.params[EnumSpWMLParams.sid] == sid) {
          if (elm is SingleChildElement) {
            elm.child.child = newWidget;
            for (SpWMLElement j in _parsedWidgets) {
              if (elm.serial == j.parentSerial) {
                removeTarget = j;
              }
            }
            needReturn = true;
            break;
          } else if (elm is SingleChildTextElement) {
            elm.child.child = newWidget;
            for (SpWMLElement j in _parsedWidgets) {
              if (elm.serial == j.parentSerial) {
                removeTarget = j;
              }
            }
            needReturn = true;
            break;
          } else {
            throw SpWMLException(
                EnumSpWMLExceptionType.replaceException, -1, -1, info);
          }
        }
      }
    }
    if (removeTarget != null) {
      _parsedWidgets.remove(removeTarget);
    }
    if (needReturn) {
      return;
    }
    throw SpWMLException(EnumSpWMLExceptionType.nullException, -1, -1, info);
  }

  /// (en)Disables any child element of col, row, or wrap with the specified ID and replaces it with a new widget.
  ///
  /// (ja)指定されたIDを持つcol, row, wrap, expTileのいずれかの子要素を無効化して、新しいウィジェットに置き換えます。
  ///
  /// * [id] : Target ID.
  /// * [newWidgets] : Replace Widgets.
  ///
  /// Throws [SpWMLException] : If target is null, throws nullException.
  void replaceUnderStructure(int id, List<Widget> newWidgets) {
    // 空の場合もあるのでフラグ処理が必要。
    bool needReturn = false;
    List<Widget> removeTargets = [];
    for (int i = 0; i < _parsedWidgets.length; i++) {
      final SpWMLElement elm = _parsedWidgets[i];
      if (elm.params.containsKey(EnumSpWMLParams.id)) {
        if (elm.params[EnumSpWMLParams.id] == id) {
          if (elm is MultiChildElement) {
            elm.children.children = newWidgets;
            for (SpWMLElement j in _parsedWidgets) {
              if (elm.serial == j.parentSerial) {
                removeTargets.add(j);
              }
            }
            needReturn = true;
            break;
          } else if (elm is MultiChildTextElement) {
            elm.children.children = newWidgets;
            for (SpWMLElement j in _parsedWidgets) {
              if (elm.serial == j.parentSerial) {
                removeTargets.add(j);
              }
            }
            needReturn = true;
            break;
          } else {
            throw SpWMLException(
                EnumSpWMLExceptionType.replaceException, -1, -1, info);
          }
        }
      }
    }
    if (removeTargets.isNotEmpty) {
      for (final i in removeTargets) {
        _parsedWidgets.remove(i);
      }
    }
    if (needReturn) {
      return;
    }
    throw SpWMLException(EnumSpWMLExceptionType.nullException, -1, -1, info);
  }

  /// (en)Disables any child element of col, row, or wrap with the specified String ID and replaces it with a new widget.
  ///
  /// (ja)指定されたString IDを持つcol, row, wrap, expTileのいずれかの子要素を無効化して、新しいウィジェットに置き換えます。
  ///
  /// * [sid] : Target String ID.
  /// * [newWidgets] : Replace Widgets.
  ///
  /// Throws [SpWMLException] : If target is null, throws nullException.
  void replaceUnderStructureSID(String sid, List<Widget> newWidgets) {
    // 空の場合もあるのでフラグ処理が必要。
    bool needReturn = false;
    List<Widget> removeTargets = [];
    for (int i = 0; i < _parsedWidgets.length; i++) {
      final SpWMLElement elm = _parsedWidgets[i];
      if (elm.params.containsKey(EnumSpWMLParams.sid)) {
        if (elm.params[EnumSpWMLParams.sid] == sid) {
          if (elm is MultiChildElement) {
            elm.children.children = newWidgets;
            for (SpWMLElement j in _parsedWidgets) {
              if (elm.serial == j.parentSerial) {
                removeTargets.add(j);
              }
            }
            needReturn = true;
            break;
          } else if (elm is MultiChildTextElement) {
            elm.children.children = newWidgets;
            for (SpWMLElement j in _parsedWidgets) {
              if (elm.serial == j.parentSerial) {
                removeTargets.add(j);
              }
            }
            needReturn = true;
            break;
          } else {
            throw SpWMLException(
                EnumSpWMLExceptionType.replaceException, -1, -1, info);
          }
        }
      }
    }
    if (removeTargets.isNotEmpty) {
      for (final i in removeTargets) {
        _parsedWidgets.remove(i);
      }
    }
    if (needReturn) {
      return;
    }
    throw SpWMLException(EnumSpWMLExceptionType.nullException, -1, -1, info);
  }

  /// (en) Gets the element length.
  ///
  /// (ja) エレメントの総数を取得します。
  int length() {
    return _parsedWidgets.length;
  }

  /// (en) Gets the element with the specified serial.
  ///
  /// (ja) 指定シリアルを持つエレメントを取得します。
  /// * [serial]: The index value assigned to each element when parsing SpWML.
  /// Starting from 0, it is in the order of SpWML description.
  SpWMLElement getElement(int serial) {
    return _parsedWidgets[serial];
  }

  /// (en) Get a reference to the elements.
  ///
  /// (ja) エレメントの参照を取得します。
  List<SpWMLElement> getAllElements() {
    return _parsedWidgets;
  }

  /// (en) Gets the element with the specified id.
  ///
  /// (ja) 指定IDを持つエレメントを取得します。
  /// * [id]: ID param of SpWML.
  ///
  /// returns: If target is not exist, return null.
  SpWMLElement? getElementByID(int id) {
    for (SpWMLElement i in _parsedWidgets) {
      if (i.params.containsKey(EnumSpWMLParams.id)) {
        if (i.params[EnumSpWMLParams.id] == id) {
          return i;
        }
      }
    }
    return null;
  }

  /// (en) Gets the element with the specified String ID.
  ///
  /// (ja) 指定String IDを持つエレメントを取得します。
  /// * [id]: String ID param of SpWML.
  ///
  /// returns: If target is not exist, return null.
  SpWMLElement? getElementBySID(String sid) {
    for (SpWMLElement i in _parsedWidgets) {
      if (i.params.containsKey(EnumSpWMLParams.sid)) {
        if (i.params[EnumSpWMLParams.sid] == sid) {
          return i;
        }
      }
    }
    return null;
  }

  List<Widget> _getStructuralWidget(BuildContext context) {
    List<Widget> r = [];
    for (SpWMLElement i in _parsedWidgets) {
      if (i is MultiChildElement) {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.children.children.add(j);
          }
        }
      } else if (i is MultiChildTextElement) {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.children.children.add(j);
          }
        }
      } else if (i is SingleChildElement) {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.child.child = j;
            break;
          }
        }
      } else if (i is SingleChildTextElement) {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.child.child = j;
            break;
          }
        }
      } else {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial && i.serial != -1) {
            final String eStr = SpWMLException(
                    EnumSpWMLExceptionType.levelException,
                    j.lineStart,
                    j.lineEnd,
                    info)
                .toString();
            debugPrint(eStr);
            r.clear();
            return [
              TextElement(
                      -1,
                      EnumSpWMLElementType.text,
                      const {},
                      SpWMLParamsWrapper(SpWMLParams(eStr)),
                      -1,
                      j.lineStart,
                      j.lineEnd,
                      style,
                      info,
                      TextParamsWrapper(TextParams()))
                  .initParams()
            ];
          }
        }
      }
      // 基底直下のエレメントのみ追加。
      if (i.parentSerial == -1) {
        r.add(i);
      }
    }
    return r;
  }

  /// (en)Build widget.
  ///
  /// (ja)ウィジェットとしてビルドします。
  ///
  /// * [context] : Build Context.
  ///
  /// Returns Widget.
  Widget build(BuildContext context) {
    return Container(
        key: key,
        margin: margin,
        padding: padding,
        child: Column(
          mainAxisAlignment: mainAA,
          crossAxisAlignment: crossAA,
          children: _getStructuralWidget(context),
        ));
  }

  /// (en)Both TextEditingController and FocusNode are automatically set
  /// with the sid set in the layout as a key.
  /// The initial value set is empty.
  ///
  /// (ja)レイアウトに設定されているsidをキーとして、
  /// TextEditingControllerとFocusNodeの両方を自動設定します。
  /// 設定される初期値は空です。
  ///
  /// * [tfm] : The manager for text fields.
  void autoConfigureTextFieldManager(TextFieldManager tfm) {
    for (SpWMLElement i in _parsedWidgets) {
      if (i.type != EnumSpWMLElementType.textField) {
        continue;
      }
      if (i.params.containsKey(EnumSpWMLParams.sid)) {
        TextFieldElement tfe = i as TextFieldElement;
        tfe.setManager(tfm, i.params[EnumSpWMLParams.sid]);
      }
    }
  }
}
