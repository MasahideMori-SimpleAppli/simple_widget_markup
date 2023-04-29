import 'spwml_element_part.dart';
import '../element_params/spwml_element_params_all.dart';
import '../enum/enum_spwml_element_type.dart';
import '../style/spwml_font_style.dart';
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
  /// * [info] : SpWML info.
  ///
  /// Returns SpWMLElement.
  ///
  /// Throws [
  /// SpWMLException] : ParamException.
  /// Throws [SpWMLException] : ParamValueException.
  static SpWMLElement create(
      int serial,
      String type,
      Map<String, String> params,
      String text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info) {
    EnumSpWMLElementType eType =
        EXTEnumSpWMLElementType.fromStr(type, lineStart, lineEnd, info);
    late SpWMLElement r;
    final SpWMLParamsWrapper spwmlParams =
        SpWMLParamsWrapper(SpWMLParams(text));
    // v2
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
      r = TextElement(serial, eType, params, spwmlParams, parentSerial,
          lineStart, lineEnd, style, info, TextParamsWrapper(TextParams()));
    }
    // v3
    else if (eType == EnumSpWMLElementType.displayL ||
        eType == EnumSpWMLElementType.displayM ||
        eType == EnumSpWMLElementType.displayS ||
        eType == EnumSpWMLElementType.headlineL ||
        eType == EnumSpWMLElementType.headlineM ||
        eType == EnumSpWMLElementType.headlineS ||
        eType == EnumSpWMLElementType.titleL ||
        eType == EnumSpWMLElementType.titleM ||
        eType == EnumSpWMLElementType.titleS ||
        eType == EnumSpWMLElementType.labelL ||
        eType == EnumSpWMLElementType.labelM ||
        eType == EnumSpWMLElementType.labelS ||
        eType == EnumSpWMLElementType.bodyL ||
        eType == EnumSpWMLElementType.bodyM ||
        eType == EnumSpWMLElementType.bodyS) {
      r = TextElement(serial, eType, params, spwmlParams, parentSerial,
          lineStart, lineEnd, style, info, TextParamsWrapper(TextParams()));
    } else if (eType == EnumSpWMLElementType.textField) {
      r = TextFieldElement(
          serial,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          TextParamsWrapper(TextParams()),
          TextFieldParamsWrapper(TextFieldParams()));
    } else if (eType == EnumSpWMLElementType.href) {
      r = HrefElement(
          serial,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          TextParamsWrapper(TextParams()),
          HrefParamsWrapper(HrefParams()));
    } else if (eType == EnumSpWMLElementType.ruby) {
      r = RubyTextElement(
          serial,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          TextParamsWrapper(TextParams()),
          RubyTextParamsWrapper(RubyTextParams()));
    } else if (eType == EnumSpWMLElementType.line) {
      r = LineElement(serial, params, spwmlParams, parentSerial, lineStart,
          lineEnd, style, info, LineParamsWrapper(LineParams()));
    } else if (eType == EnumSpWMLElementType.vline) {
      r = VLineElement(serial, params, spwmlParams, parentSerial, lineStart,
          lineEnd, style, info, VLineParamsWrapper(VLineParams()));
    } else if (eType == EnumSpWMLElementType.progressIndicator) {
      r = ProgressIndicatorElement(
          serial,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          ProgressIndicatorParamsWrapper(ProgressIndicatorParams()));
    } else if (eType == EnumSpWMLElementType.img) {
      r = ImgElement(serial, params, spwmlParams, parentSerial, lineStart,
          lineEnd, style, info, ImgParamsWrapper(ImgParams()));
    } else if (eType == EnumSpWMLElementType.col) {
      r = ColElement(
          serial,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          StructureElementChildren(),
          RowColParamsWrapper(RowColParams()));
    } else if (eType == EnumSpWMLElementType.row) {
      r = RowElement(
          serial,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          StructureElementChildren(),
          RowColParamsWrapper(RowColParams()));
    } else if (eType == EnumSpWMLElementType.block) {
      r = BlockElement(serial, params, spwmlParams, parentSerial, lineStart,
          lineEnd, style, info, BlockElementChild());
    } else if (eType == EnumSpWMLElementType.span) {
      r = SpanElement(
          serial,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          StructureElementChildren(),
          TextParamsWrapper(TextParams()),
          SpanParamsWrapper(SpanParams()));
    } else if (eType == EnumSpWMLElementType.btn) {
      r = BtnElement(
          serial,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          BlockElementChild(),
          TextParamsWrapper(TextParams()),
          BtnParamsWrapper(BtnParams()));
    } else if (eType == EnumSpWMLElementType.stack) {
      r = StackElement(
          serial,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          StructureElementChildren(),
          StackParamsWrapper(StackParams()));
    } else if (eType == EnumSpWMLElementType.wrap) {
      r = WrapElement(
          serial,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          StructureElementChildren(),
          WrapParamsWrapper(WrapParams()));
    } else if (eType == EnumSpWMLElementType.dropdownBtn) {
      r = DropdownBtnElement(
          serial,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          StructureElementChildren(),
          DropdownBtnParamsWrapper(DropdownBtnParams()));
    } else if (eType == EnumSpWMLElementType.popupMenuBtn) {
      r = PopupMenuBtnElement(
          serial,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          StructureElementChildren(),
          PopupMenuBtnParamsWrapper(PopupMenuBtnParams()));
    } else if (eType == EnumSpWMLElementType.expTile) {
      r = ExpTileElement(
          serial,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          StructureElementChildren(),
          TextParamsWrapper(TextParams()),
          ExpTileParamsWrapper(ExpTileParams()));
    } else if (eType == EnumSpWMLElementType.checkbox) {
      r = CheckboxElement(
          serial,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          StructureElementChildren(),
          CheckboxParamsWrapper(CheckboxParams()));
    } else if (eType == EnumSpWMLElementType.radioBtn) {
      r = RadioBtnElement(
          serial,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          StructureElementChildren(),
          RadioBtnParamsWrapper(RadioBtnParams()));
    } else if (eType == EnumSpWMLElementType.scroll) {
      r = ScrollElement(
          serial,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          BlockElementChild(),
          ScrollParamsWrapper(ScrollParams()));
    } else if (eType == EnumSpWMLElementType.switchBtn) {
      r = SwitchBtnElement(serial, params, spwmlParams, parentSerial, lineStart,
          lineEnd, style, info, SwitchBtnParamsWrapper(SwitchBtnParams()));
    } else if (eType == EnumSpWMLElementType.icon) {
      r = IconElement(serial, params, spwmlParams, parentSerial, lineStart,
          lineEnd, style, info, IconParamsWrapper(IconParams()));
    } else if (eType == EnumSpWMLElementType.card) {
      r = CardElement(
          serial,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          BlockElementChild(),
          CardParamsWrapper(CardParams()));
    } else if (eType == EnumSpWMLElementType.table) {
      r = TableElement(
          serial,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          StructureElementChildren(),
          TableParamsWrapper(TableParams()));
    } else if (eType == EnumSpWMLElementType.tableRow) {
      r = TableRowElement(
          serial,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          StructureElementChildren(),
          TableRowParamsWrapper(TableRowParams()));
    } else {
      // 存在しないタイプの場合は通常はfromStr時点で例外が発生している。
      // ここで発生する場合は処理の追加漏れ。
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd, info);
    }
    // 各エレメント固有のパラメータを変数として初期化・格納する。
    r.initParams();
    return r;
  }
}
