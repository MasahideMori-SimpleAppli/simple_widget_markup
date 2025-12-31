import 'package:simple_widget_markup/simple_widget_markup.dart';

///
/// (en) Superclass for text-related elements with one child.
///
/// (ja) 1つの子を持つテキスト関係のエレメントのスーパークラス。
///
class SingleChildTextElement extends TextElement {
  final BlockElementChild child;

  ///
  /// * [serial] : Array Index.
  /// * [type] : Element type.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [info] : SpWML info.
  /// * [child] : This element child.
  /// * [textParams] : Parent class parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  SingleChildTextElement(
    int serial,
    EnumSpWMLElementType type,
    Map<String, String> params,
    SpWMLParamsWrapper spwmlParams,
    int parentSerial,
    int lineStart,
    int lineEnd,
    SpWMLFontStyle style,
    SpWMLInfo? info,
    this.child,
    TextParamsWrapper textParams, {
    super.key,
  }) : super(
          serial,
          type,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          textParams,
        );

  /// Get this class name.
  @override
  String getClassName() {
    return "SingleChildTextElement";
  }

  /// Initialize the parameters.
  @override
  SingleChildTextElement initParams() {
    super.initParams();
    return this;
  }
}
