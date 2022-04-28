import 'package:flutter/material.dart';
import 'package:simple_widget_markup/element/popupmenu_btn_element.dart';
import 'package:simple_widget_markup/element/text_field_element.dart';
import 'package:simple_widget_markup/element/wrap_element.dart';
import '../element_params/textfield_params.dart';
import 'btn_element.dart';
import 'dropdown_btn_element.dart';
import 'exp_tile_element.dart';
import 'scroll_element.dart';
import 'vline_element.dart';
import '../element_params/element_params.dart';
import 'stack_element.dart';
import 'element_child.dart';
import 'spwml_font_style.dart';
import 'span_element.dart';
import 'block_element.dart';
import 'href_element.dart';
import 'img_element.dart';
import 'line_element.dart';
import 'spwml_element.dart';
import 'row_element.dart';
import 'text_element.dart';
import '../spwml_exception.dart';

import 'col_element.dart';
import 'enum_spwml_element_type.dart';

///
/// (en)Utility for generating SpWML elements.
/// (ja)SpWMLエレメントの生成用ユーティリティです。
///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-30 16:22:16
///
class UtilElement {
  ///
  /// Create Element.
  /// * [serial] : Array Index.
  /// * [type] : Element Type.
  /// * [param] : Element Parameter.
  /// * [text] : The text.
  /// * [parentSerial] : The parent element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  ///
  /// Returns SpWMLElement.
  ///
  /// Throws [SpWMLException] : ParamException.
  /// Throws [SpWMLException] : ParamValueException.
  static SpWMLElement create(
      int serial,
      String type,
      List<String> param,
      String text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style) {
    EnumSpWMLElementType eType =
        EXTEnumSpWMLElementType.fromStr(type, lineStart, lineEnd);
    late SpWMLElement r;
    final ElementParams pText = ElementParams(text);
    if (eType == EnumSpWMLElementType.text ||
        eType == EnumSpWMLElementType.h1 ||
        eType == EnumSpWMLElementType.h2 ||
        eType == EnumSpWMLElementType.h3 ||
        eType == EnumSpWMLElementType.h4 ||
        eType == EnumSpWMLElementType.h5 ||
        eType == EnumSpWMLElementType.h6 ||
        eType == EnumSpWMLElementType.subtitle1 ||
        eType == EnumSpWMLElementType.subtitle2 ||
        eType == EnumSpWMLElementType.body1 ||
        eType == EnumSpWMLElementType.body2 ||
        eType == EnumSpWMLElementType.caption ||
        eType == EnumSpWMLElementType.overline ||
        eType == EnumSpWMLElementType.menu) {
      r = TextElement(
          serial, eType, param, pText, parentSerial, lineStart, lineEnd, style);
    } else if (eType == EnumSpWMLElementType.textField) {
      r = TextFieldElement(serial, param, pText, parentSerial, lineStart,
              lineEnd, style, TextFieldParamsWrapper(TextFieldParams()))
          .initParams();
    } else if (eType == EnumSpWMLElementType.href) {
      r = HrefElement(
          serial, param, pText, parentSerial, lineStart, lineEnd, style);
    } else if (eType == EnumSpWMLElementType.line) {
      r = LineElement(
          serial, param, pText, parentSerial, lineStart, lineEnd, style);
    } else if (eType == EnumSpWMLElementType.vline) {
      r = VLineElement(
          serial, param, pText, parentSerial, lineStart, lineEnd, style);
    } else if (eType == EnumSpWMLElementType.img) {
      r = ImgElement(
          serial, param, pText, parentSerial, lineStart, lineEnd, style);
    } else if (eType == EnumSpWMLElementType.col) {
      r = ColElement(serial, param, pText, parentSerial, lineStart, lineEnd,
          style, StructureElementChildren());
    } else if (eType == EnumSpWMLElementType.row) {
      r = RowElement(serial, param, pText, parentSerial, lineStart, lineEnd,
          style, StructureElementChildren());
    } else if (eType == EnumSpWMLElementType.block) {
      r = BlockElement(serial, param, pText, parentSerial, lineStart, lineEnd,
          style, BlockElementChild());
    } else if (eType == EnumSpWMLElementType.span) {
      r = SpanElement(serial, param, pText, parentSerial, lineStart, lineEnd,
          style, StructureElementChildren());
    } else if (eType == EnumSpWMLElementType.btn) {
      r = BtnElement(serial, param, pText, parentSerial, lineStart, lineEnd,
          style, BlockElementChild(), BtnElementParams(() {}));
    } else if (eType == EnumSpWMLElementType.stack) {
      r = StackElement(serial, param, pText, parentSerial, lineStart, lineEnd,
          style, StructureElementChildren());
    } else if (eType == EnumSpWMLElementType.wrap) {
      r = WrapElement(serial, param, pText, parentSerial, lineStart, lineEnd,
          style, StructureElementChildren());
    } else if (eType == EnumSpWMLElementType.dropdownBtn) {
      r = DropdownBtnElement(
          serial,
          param,
          pText,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          StructureElementChildren(),
          ShowMenuBtnElementParams([]),
          DropDownBtnElementParams(0));
    } else if (eType == EnumSpWMLElementType.popupMenuBtn) {
      r = PopupMenuBtnElement(
          serial,
          param,
          pText,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          StructureElementChildren(),
          ShowMenuBtnElementParams([]));
    } else if (eType == EnumSpWMLElementType.expTile) {
      r = ExpTileElement(
          serial,
          param,
          pText,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          StructureElementChildren(),
          BoolCallbackParams((bool b) {}),
          WidgetParams(null));
    } else if (eType == EnumSpWMLElementType.scroll) {
      r = ScrollElement(serial, param, pText, parentSerial, lineStart, lineEnd,
          style, BlockElementChild(), ScrollElementParams());
    } else {
      // 存在しないタイプの場合は通常はfromStr時点で例外が発生している。
      // ここで発生する場合は処理の追加漏れ。
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd);
    }
    return r;
  }

  ///
  /// * [s] : Alignment text.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  ///
  /// Returns MainAxisAlignment.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  static MainAxisAlignment convertMainAxisAlign(
      String s, int lineStart, int lineEnd) {
    if (s == "left" || s == "start") {
      // Row
      return MainAxisAlignment.start;
    } else if (s == "center") {
      // Row and Column
      return MainAxisAlignment.center;
    } else if (s == "right" || s == "end") {
      // Row
      return MainAxisAlignment.end;
    } else if (s == "top") {
      // Column
      return MainAxisAlignment.start;
    } else if (s == "bottom") {
      // Column
      return MainAxisAlignment.end;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.paramValueException, lineStart, lineEnd);
    }
  }

  ///
  /// * [s] : Alignment text.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  ///
  /// Returns CrossAxisAlignment.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  static CrossAxisAlignment convertCrossAxisAlign(
      String s, int lineStart, int lineEnd) {
    if (s == "left" || s == "start") {
      // Column
      return CrossAxisAlignment.start;
    } else if (s == "center") {
      // Row and Column
      return CrossAxisAlignment.center;
    } else if (s == "right" || s == "end") {
      // Column
      return CrossAxisAlignment.end;
    } else if (s == "top") {
      // Row
      return CrossAxisAlignment.start;
    } else if (s == "bottom") {
      // Row
      return CrossAxisAlignment.end;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.paramValueException, lineStart, lineEnd);
    }
  }

  ///
  /// * [s] : Alignment text.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  ///
  /// Returns WrapAlignment.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  static WrapAlignment convertWrapAlign(String s, int lineStart, int lineEnd) {
    if (s == "left" || s == "start") {
      return WrapAlignment.start;
    } else if (s == "center") {
      return WrapAlignment.center;
    } else if (s == "right" || s == "end") {
      return WrapAlignment.end;
    } else if (s == "top") {
      return WrapAlignment.start;
    } else if (s == "bottom") {
      return WrapAlignment.end;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.paramValueException, lineStart, lineEnd);
    }
  }
}
