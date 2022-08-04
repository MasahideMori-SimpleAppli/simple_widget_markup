import 'package:flutter/material.dart';
import '../element/sub/button/checkbox_element.dart';
import '../element/sub/button/radio_btn_element.dart';
import '../element/sub/structure/table_element.dart';
import '../element/sub/text/ruby_text_element.dart';
import '../element_params/sub/button/checkbox_params.dart';
import '../element_params/sub/button/radio_btn_params.dart';
import '../element_params/sub/structure/table_params.dart';
import '../element_params/sub/text/ruby_text_params.dart';
import '../element/sub/button/btn_element.dart';
import '../element/sub/button/dropdown_btn_element.dart';
import '../element/sub/button/popupmenu_btn_element.dart';
import '../element/sub/button/switch_btn_element.dart';
import '../element/sub/other/icon_element.dart';
import '../element/sub/other/img_element.dart';
import '../element/sub/structure/card_element.dart';
import '../element/sub/structure/col_element.dart';
import '../element/sub/structure/scroll_element.dart';
import '../element/sub/structure/wrap_element.dart';
import '../element/sub/text/text_field_element.dart';
import '../element/super/spwml_element.dart';
import '../element_params/sub/button/btn_params.dart';
import '../element_params/sub/button/dropdown_btn_params.dart';
import '../element_params/sub/button/popupmenu_btn_params.dart';
import '../element_params/sub/button/switch_btn_params.dart';
import '../element_params/sub/other/icon_element_params.dart';
import '../element_params/sub/other/img_element_params.dart';
import '../element_params/sub/other/line_element_params.dart';
import '../element_params/sub/other/vline_element_params.dart';
import '../element_params/sub/structure/card_params.dart';
import '../element_params/sub/structure/exp_tile_params.dart';
import '../element_params/sub/structure/row_col_params.dart';
import '../element_params/sub/structure/scroll_params.dart';
import '../element_params/sub/structure/span_params.dart';
import '../element_params/sub/structure/stack_params.dart';
import '../element_params/sub/structure/table_row_params.dart';
import '../element_params/sub/structure/wrap_params.dart';
import '../element_params/sub/text/href_params.dart';
import '../element_params/sub/text/text_params.dart';
import '../element_params/super/spwml_params.dart';
import '../element_params/sub/text/textfield_params.dart';
import '../enum/enum_spwml_element_type.dart';
import 'sub/structure/exp_tile_element.dart';
import 'sub/other/vline_element.dart';
import 'sub/structure/stack_element.dart';
import '../element_params/element_child.dart';
import 'spwml_font_style.dart';
import 'sub/structure/span_element.dart';
import 'sub/structure/block_element.dart';
import 'sub/structure/table_row_element.dart';
import 'sub/text/href_element.dart';
import 'sub/other/line_element.dart';
import 'sub/structure/row_element.dart';
import 'sub/text/text_element.dart';
import '../spwml_exception.dart';

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
  /// * [params] : Element Parameter.
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
      Map<String, String> params,
      String text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style) {
    EnumSpWMLElementType eType =
        EXTEnumSpWMLElementType.fromStr(type, lineStart, lineEnd);
    late SpWMLElement r;
    final SpWMLParamsWrapper spwmlEP = SpWMLParamsWrapper(SpWMLParams(text));
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
      r = TextElement(serial, eType, params, spwmlEP, parentSerial, lineStart,
          lineEnd, style, TextParamsWrapper(TextParams()));
    } else if (eType == EnumSpWMLElementType.textField) {
      r = TextFieldElement(
          serial,
          params,
          spwmlEP,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          TextParamsWrapper(TextParams()),
          TextFieldParamsWrapper(TextFieldParams()));
    } else if (eType == EnumSpWMLElementType.href) {
      r = HrefElement(
          serial,
          params,
          spwmlEP,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          TextParamsWrapper(TextParams()),
          HrefParamsWrapper(HrefParams()));
    } else if (eType == EnumSpWMLElementType.ruby) {
      r = RubyTextElement(
          serial,
          params,
          spwmlEP,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          TextParamsWrapper(TextParams()),
          RubyTextParamsWrapper(RubyTextParams()));
    } else if (eType == EnumSpWMLElementType.line) {
      r = LineElement(serial, params, spwmlEP, parentSerial, lineStart, lineEnd,
          style, LineParamsWrapper(LineParams()));
    } else if (eType == EnumSpWMLElementType.vline) {
      r = VLineElement(serial, params, spwmlEP, parentSerial, lineStart,
          lineEnd, style, VLineParamsWrapper(VLineParams()));
    } else if (eType == EnumSpWMLElementType.img) {
      r = ImgElement(serial, params, spwmlEP, parentSerial, lineStart, lineEnd,
          style, ImgParamsWrapper(ImgParams()));
    } else if (eType == EnumSpWMLElementType.col) {
      r = ColElement(
          serial,
          params,
          spwmlEP,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          StructureElementChildren(),
          RowColParamsWrapper(RowColParams()));
    } else if (eType == EnumSpWMLElementType.row) {
      r = RowElement(
          serial,
          params,
          spwmlEP,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          StructureElementChildren(),
          RowColParamsWrapper(RowColParams()));
    } else if (eType == EnumSpWMLElementType.block) {
      r = BlockElement(serial, params, spwmlEP, parentSerial, lineStart,
          lineEnd, style, BlockElementChild());
    } else if (eType == EnumSpWMLElementType.span) {
      r = SpanElement(
          serial,
          params,
          spwmlEP,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          StructureElementChildren(),
          TextParamsWrapper(TextParams()),
          SpanParamsWrapper(SpanParams()));
    } else if (eType == EnumSpWMLElementType.btn) {
      r = BtnElement(
          serial,
          params,
          spwmlEP,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          BlockElementChild(),
          TextParamsWrapper(TextParams()),
          BtnParamsWrapper(BtnParams()));
    } else if (eType == EnumSpWMLElementType.stack) {
      r = StackElement(
          serial,
          params,
          spwmlEP,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          StructureElementChildren(),
          StackParamsWrapper(StackParams()));
    } else if (eType == EnumSpWMLElementType.wrap) {
      r = WrapElement(serial, params, spwmlEP, parentSerial, lineStart, lineEnd,
          style, StructureElementChildren(), WrapParamsWrapper(WrapParams()));
    } else if (eType == EnumSpWMLElementType.dropdownBtn) {
      r = DropdownBtnElement(
          serial,
          params,
          spwmlEP,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          StructureElementChildren(),
          DropdownBtnParamsWrapper(DropdownBtnParams()));
    } else if (eType == EnumSpWMLElementType.popupMenuBtn) {
      r = PopupMenuBtnElement(
          serial,
          params,
          spwmlEP,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          StructureElementChildren(),
          PopupMenuBtnParamsWrapper(PopupMenuBtnParams()));
    } else if (eType == EnumSpWMLElementType.expTile) {
      r = ExpTileElement(
          serial,
          params,
          spwmlEP,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          StructureElementChildren(),
          TextParamsWrapper(TextParams()),
          ExpTileParamsWrapper(ExpTileParams()));
    } else if (eType == EnumSpWMLElementType.checkbox) {
      r = CheckboxElement(
          serial,
          params,
          spwmlEP,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          StructureElementChildren(),
          CheckboxParamsWrapper(CheckboxParams()));
    } else if (eType == EnumSpWMLElementType.radioBtn) {
      r = RadioBtnElement(
          serial,
          params,
          spwmlEP,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          StructureElementChildren(),
          RadioBtnParamsWrapper(RadioBtnParams()));
    } else if (eType == EnumSpWMLElementType.scroll) {
      r = ScrollElement(
          serial,
          params,
          spwmlEP,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          BlockElementChild(),
          ScrollParamsWrapper(ScrollParams()));
    } else if (eType == EnumSpWMLElementType.switchBtn) {
      r = SwitchBtnElement(serial, params, spwmlEP, parentSerial, lineStart,
          lineEnd, style, SwitchBtnParamsWrapper(SwitchBtnParams()));
    } else if (eType == EnumSpWMLElementType.icon) {
      r = IconElement(serial, params, spwmlEP, parentSerial, lineStart, lineEnd,
          style, IconParamsWrapper(IconParams()));
    } else if (eType == EnumSpWMLElementType.card) {
      r = CardElement(serial, params, spwmlEP, parentSerial, lineStart, lineEnd,
          style, BlockElementChild(), CardParamsWrapper(CardParams()));
    } else if (eType == EnumSpWMLElementType.table) {
      r = TableElement(
          serial,
          params,
          spwmlEP,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          StructureElementChildren(),
          TableParamsWrapper(TableParams()));
    } else if (eType == EnumSpWMLElementType.tableRow) {
      r = TableRowElement(
          serial,
          params,
          spwmlEP,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          StructureElementChildren(),
          TableRowParamsWrapper(TableRowParams()));
    } else {
      // 存在しないタイプの場合は通常はfromStr時点で例外が発生している。
      // ここで発生する場合は処理の追加漏れ。
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd);
    }
    // 各エレメント固有のパラメータを変数として初期化・格納する。
    r.initParams();
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
