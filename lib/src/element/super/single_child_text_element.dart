import '../../element_params/element_child.dart';
import '../../element_params/spwml_info.dart';
import '../../element_params/sub/text/text_params.dart';
import '../../element_params/super/spwml_params.dart';
import '../../enum/enum_spwml_element_type.dart';
import '../../style/spwml_font_style.dart';
import '../sub/text/text_element.dart';

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
