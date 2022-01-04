import 'package:flutter/cupertino.dart';
import 'element/spwml_font_style.dart';
import 'element/span_element.dart';
import 'element/text_element.dart';
import 'element/block_element.dart';
import 'element/col_element.dart';
import 'element/enum_spwml_element_param.dart';
import 'element/enum_spwml_element_type.dart';
import 'element/row_element.dart';
import 'spwml_exception.dart';
import 'spwml_parser.dart';

import 'element/spwml_element.dart';

///
/// (en)A builder class for converting SpWML to widgets.
/// (ja)SpWMLをウィジェットに変換するためのビルダークラスです。
///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-29 18:40:02
///
class SpWMLBuilder {
  final List<SpWMLElement> parsedWidgets;
  final MainAxisAlignment mainAA;
  final CrossAxisAlignment crossAA;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final SpWMLFontStyle style;

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
      SpWMLFontStyle? spWMLStyle})
      : parsedWidgets = SpWMLParser.run(spWML, spWMLStyle ?? SpWMLFontStyle()),
        style = spWMLStyle ?? SpWMLFontStyle();

  /// (en)Replaces the contents of the specified ID with a widget.
  /// (ja)指定IDの内容をウィジェットで置き換えます。
  ///
  /// * [id] : Target ID.
  /// * [widget] : Replace Widget.
  ///
  /// Throws [SpWMLException] : If target is null, throws nullException.
  void replaceID(int id, Widget widget) {
    for (int i = 0; i < parsedWidgets.length; i++) {
      final SpWMLElement elm = parsedWidgets[i];
      if (elm.param.containsKey(EnumSpWMLElementParam.id)) {
        if (elm.param[EnumSpWMLElementParam.id] == id) {
          if (elm is BlockElement) {
            elm.child.child = widget;
            return;
          } else {
            throw SpWMLException(
                EnumSpWMLExceptionType.replaceException, -1, -1);
          }
        }
      }
    }
    throw SpWMLException(EnumSpWMLExceptionType.nullException, -1, -1);
  }

  List<Widget> _createStructuralWidget(BuildContext context) {
    List<Widget> r = [];
    for (SpWMLElement i in parsedWidgets) {
      if (i is ColElement) {
        for (SpWMLElement j in parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.children.children.add(j);
          }
        }
      } else if (i is RowElement) {
        for (SpWMLElement j in parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.children.children.add(j);
          }
        }
      } else if (i is BlockElement) {
        for (SpWMLElement j in parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.child.child = j;
            break;
          }
        }
      } else if (i is SpanElement) {
        for (SpWMLElement j in parsedWidgets) {
          if (i.serial == j.parentSerial) {
            i.children.children.add(j);
          }
        }
      } else {
        for (SpWMLElement j in parsedWidgets) {
          if (i.serial == j.parentSerial && i.serial != -1) {
            final String eStr = SpWMLException(
                    EnumSpWMLExceptionType.levelException,
                    j.lineStart,
                    j.lineEnd)
                .toString();
            debugPrint(eStr);
            r.clear();
            return [
              TextElement(-1, EnumSpWMLElementType.text, const [], eStr, -1,
                  j.lineStart, j.lineEnd, style)
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
  /// (ja)ウィジェットとしてビルドします。
  ///
  /// * [context] : Build Context.
  ///
  /// Returns Widget.
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        padding: padding,
        child: Column(
          mainAxisAlignment: mainAA,
          crossAxisAlignment: crossAA,
          children: _createStructuralWidget(context),
        ));
  }
}
