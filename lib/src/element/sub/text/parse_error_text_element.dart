import '../../../../simple_widget_markup.dart';

///
/// (en) A variant of TextElement that is used only when parsing fails
/// in SpWMLParser.
///
/// (ja) SpWMLParserで、パースに失敗した時のみ使われるTextElementの亜種です。
///
class ParseErrorTextElement extends TextElement {
  ParseErrorTextElement(
      super.serial,
      super.type,
      super.params,
      super.spwmlParams,
      super.parentSerial,
      super.lineStart,
      super.lineEnd,
      super.style,
      super.info,
      super.textParams,
      {super.key});
}
