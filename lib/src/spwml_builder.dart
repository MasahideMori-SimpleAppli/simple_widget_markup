import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';
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
  final MainAxisSize mainAS;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final SpWMLFontStyle style;
  final GlobalKey? key;
  final SpWMLInfo? info;

  /// Constructor
  /// * [spWML] : SpWML text.
  /// * [mainAA] : Top level Column MainAxisAlignment.
  /// * [crossAA] : Top level Column CrossAxisAlignment.
  /// * [mainAS] : The MainAxisSize of wrap column.
  /// * [margin] : Top level Column Margin.
  /// * [padding] : Top level Column Padding.
  /// * [spWMLStyle] : Font styles. If you want to change the default style,
  /// you can change the contents of the singleton SpWMLFontManager class.
  /// * [info] : This is information object. e.g. A hint when an error occurs.
  /// It is convenient to set when nesting multiple SpWMLs.
  SpWMLBuilder(spWML,
      {this.mainAA = MainAxisAlignment.start,
      this.crossAA = CrossAxisAlignment.start,
      this.mainAS = MainAxisSize.max,
      this.margin = const EdgeInsets.all(0),
      this.padding = const EdgeInsets.all(0),
      SpWMLFontStyle? spWMLStyle,
      this.info,
      this.key})
      : _parsedWidgets = SpWMLParser.run(
            spWML, spWMLStyle ?? SpWMLFontStyleManager().style, info),
        style = spWMLStyle ?? SpWMLFontStyleManager().style;

  /// (en)Replaces the contents of the specified SID with a widget.
  ///
  /// (ja)指定SIDの内容をウィジェットで置き換えます。
  ///
  /// * [sid] : Target SID.
  /// * [newWidget] : Replace Widget.
  ///
  /// Throws [SpWMLException] : If target is null, throws nullException.
  void replace(String sid, Widget newWidget) {
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

  /// (en)Disables any child element of col, row, or wrap with the specified SID and replaces it with a new widget.
  ///
  /// (ja)指定されたSIDを持つcol, row, wrap, expTileのいずれかの子要素を無効化して、新しいウィジェットに置き換えます。
  ///
  /// * [sid] : Target SID.
  /// * [newWidgets] : Replace Widgets.
  ///
  /// Throws [SpWMLException] : If target is null, throws nullException.
  void replaceUnderStructure(String sid, List<Widget> newWidgets) {
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

  /// (en) Get a reference to the elements.
  ///
  /// (ja) エレメントの参照を取得します。
  List<SpWMLElement> getAllElements() {
    return _parsedWidgets;
  }

  /// (en) Gets the element with the specified String ID.
  ///
  /// (ja) 指定String IDを持つエレメントを取得します。
  /// * [id]: String ID param of SpWML.
  ///
  /// returns: If target is not exist, return null.
  SpWMLElement? getElement(String sid) {
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
          mainAxisSize: mainAS,
          children: _getStructuralWidget(context),
        ));
  }

  /// (en)The manager class is automatically set using the sid set in the layout as a key.
  ///
  /// (ja)レイアウトに設定されているsidをキーとして、マネージャークラスを自動設定します。
  ///
  /// * [tfm] : The manager for textfield.
  /// * [im] : The manager for dropdownBtn and popupMenuBtn and radioBtn.
  /// * [fm] : The manager for switchBtn.
  /// * [mim] : The manager for segmentedBtn.
  /// * [mfm] : The manager for checkbox.
  /// * [vm] : The manager for progressIndicator and slider.
  void setManager(
      {TextFieldManager? tfm,
      IndexManager? im,
      FlagManager? fm,
      MultiIndexManager? mim,
      MultiFlagManager? mfm,
      ValueManager? vm}) {
    for (SpWMLElement i in _parsedWidgets) {
      final String? sid = i.getSID();
      if (sid == null) {
        continue;
      } else {
        if (tfm != null) {
          if (i.type == EnumSpWMLElementType.textField) {
            TextFieldElement elm = i as TextFieldElement;
            elm.setManager(tfm, sid);
          }
        }
        if (im != null) {
          if (i.type == EnumSpWMLElementType.dropdownBtn) {
            DropdownBtnElement elm = i as DropdownBtnElement;
            elm.setManager(im);
          } else if (i.type == EnumSpWMLElementType.popupMenuBtn) {
            PopupMenuBtnElement elm = i as PopupMenuBtnElement;
            elm.setManager(im);
          } else if (i.type == EnumSpWMLElementType.radioBtn) {
            RadioBtnElement elm = i as RadioBtnElement;
            elm.setManager(im);
          }
        }
        if (fm != null) {
          if (i.type == EnumSpWMLElementType.switchBtn) {
            SwitchBtnElement elm = i as SwitchBtnElement;
            elm.setManager(fm);
          }
        }
        if (mim != null) {
          if (i.type == EnumSpWMLElementType.segmentedBtn) {
            SegmentedBtnElement elm = i as SegmentedBtnElement;
            elm.setManager(mim);
          }
        }
        if (mfm != null) {
          if (i.type == EnumSpWMLElementType.checkbox) {
            CheckboxElement elm = i as CheckboxElement;
            elm.setManager(mfm);
          }
        }
        if (vm != null) {
          if (i.type == EnumSpWMLElementType.progressIndicator) {
            ProgressIndicatorElement elm = i as ProgressIndicatorElement;
            elm.setManager(vm);
          } else if (i.type == EnumSpWMLElementType.slider) {
            SliderElement elm = i as SliderElement;
            elm.setManager(vm);
          }
        }
      }
    }
  }
}
