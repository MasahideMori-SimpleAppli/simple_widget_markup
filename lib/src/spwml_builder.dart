import 'package:flutter/material.dart';
import 'element/spwml_element_part.dart';
import 'style/spwml_font_style.dart';
import 'element_params/sub/text/text_params.dart';
import 'element_params/super/spwml_params.dart';
import 'enum/enum_spwml_params.dart';
import 'enum/enum_spwml_element_type.dart';
import 'spwml_exception.dart';
import 'spwml_parser.dart';

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

  /// Constructor
  /// * [spWML] : SpWML text.
  /// * [mainAA] : Top level Column MainAxisAlignment.
  /// * [crossAA] : Top level Column CrossAxisAlignment.
  /// * [margin] : Top level Column Margin.
  /// * [padding] : Top level Column Padding.
  /// * [spWMLStyle] : Font styles.
  SpWMLBuilder(spWML,
      {this.mainAA = MainAxisAlignment.start,
      this.crossAA = CrossAxisAlignment.start,
      this.margin = const EdgeInsets.all(0),
      this.padding = const EdgeInsets.all(8),
      SpWMLFontStyle? spWMLStyle,
      this.key})
      : _parsedWidgets = SpWMLParser.run(spWML, spWMLStyle ?? SpWMLFontStyle()),
        style = spWMLStyle ?? SpWMLFontStyle();

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
          if (elm is BlockElement) {
            elm.child.child = newWidget;
            for (SpWMLElement j in _parsedWidgets) {
              if (elm.serial == j.parentSerial) {
                removeTarget = j;
              }
            }
            needReturn = true;
            break;
          } else if (elm is ScrollElement) {
            elm.child.child = newWidget;
            for (SpWMLElement j in _parsedWidgets) {
              if (elm.serial == j.parentSerial) {
                removeTarget = j;
              }
            }
            needReturn = true;
            break;
          } else if (elm is CardElement) {
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
                EnumSpWMLExceptionType.replaceException, -1, -1);
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
    throw SpWMLException(EnumSpWMLExceptionType.nullException, -1, -1);
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
          if (elm is ColElement) {
            elm.children.children = newWidgets;
            for (SpWMLElement j in _parsedWidgets) {
              if (elm.serial == j.parentSerial) {
                removeTargets.add(j);
              }
            }
            needReturn = true;
            break;
          } else if (elm is RowElement) {
            elm.children.children = newWidgets;
            for (SpWMLElement j in _parsedWidgets) {
              if (elm.serial == j.parentSerial) {
                removeTargets.add(j);
              }
            }
            needReturn = true;
            break;
          } else if (elm is WrapElement) {
            elm.children.children = newWidgets;
            for (SpWMLElement j in _parsedWidgets) {
              if (elm.serial == j.parentSerial) {
                removeTargets.add(j);
              }
            }
            needReturn = true;
            break;
          } else if (elm is DropdownBtnElement) {
            elm.children.children = newWidgets;
            for (SpWMLElement j in _parsedWidgets) {
              if (elm.serial == j.parentSerial) {
                removeTargets.add(j);
              }
            }
            needReturn = true;
            break;
          } else if (elm is PopupMenuBtnElement) {
            elm.children.children = newWidgets;
            for (SpWMLElement j in _parsedWidgets) {
              if (elm.serial == j.parentSerial) {
                removeTargets.add(j);
              }
            }
            needReturn = true;
            break;
          } else if (elm is ExpTileElement) {
            elm.children.children = newWidgets;
            for (SpWMLElement j in _parsedWidgets) {
              if (elm.serial == j.parentSerial) {
                removeTargets.add(j);
              }
            }
            needReturn = true;
            break;
          } else if (elm is CheckboxElement) {
            elm.children.children = newWidgets;
            for (SpWMLElement j in _parsedWidgets) {
              if (elm.serial == j.parentSerial) {
                removeTargets.add(j);
              }
            }
            needReturn = true;
            break;
          } else if (elm is RadioBtnElement) {
            elm.children.children = newWidgets;
            for (SpWMLElement j in _parsedWidgets) {
              if (elm.serial == j.parentSerial) {
                removeTargets.add(j);
              }
            }
            needReturn = true;
            break;
          } else if (elm is TableElement) {
            elm.children.children = newWidgets;
            for (SpWMLElement j in _parsedWidgets) {
              if (elm.serial == j.parentSerial) {
                removeTargets.add(j);
              }
            }
            needReturn = true;
            break;
          } else if (elm is TableRowElement) {
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
                EnumSpWMLExceptionType.replaceException, -1, -1);
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
    throw SpWMLException(EnumSpWMLExceptionType.nullException, -1, -1);
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

  List<Widget> _getStructuralWidget(BuildContext context) {
    List<Widget> r = [];
    for (SpWMLElement i in _parsedWidgets) {
      if (i is ColElement) {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.children.children.add(j);
          }
        }
      } else if (i is RowElement) {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.children.children.add(j);
          }
        }
      } else if (i is BlockElement) {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.child.child = j;
            break;
          }
        }
      } else if (i is CardElement) {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.child.child = j;
            break;
          }
        }
      } else if (i is BtnElement) {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.child.child = j;
            break;
          }
        }
      } else if (i is ScrollElement) {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.child.child = j;
            break;
          }
        }
      } else if (i is SpanElement) {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.children.children.add(j);
          }
        }
      } else if (i is StackElement) {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.children.children.add(j);
          }
        }
      } else if (i is WrapElement) {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.children.children.add(j);
          }
        }
      } else if (i is DropdownBtnElement) {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.children.children.add(j);
          }
        }
      } else if (i is PopupMenuBtnElement) {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.children.children.add(j);
          }
        }
      } else if (i is ExpTileElement) {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.children.children.add(j);
          }
        }
      } else if (i is CheckboxElement) {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.children.children.add(j);
          }
        }
      } else if (i is RadioBtnElement) {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.children.children.add(j);
          }
        }
      } else if (i is TableElement) {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.children.children.add(j);
          }
        }
      } else if (i is TableRowElement) {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.children.children.add(j);
          }
        }
      } else {
        for (SpWMLElement j in _parsedWidgets) {
          if (i.serial == j.parentSerial && i.serial != -1) {
            final String eStr = SpWMLException(
                    EnumSpWMLExceptionType.levelException,
                    j.lineStart,
                    j.lineEnd)
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
}
