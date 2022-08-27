import '../../element_params/element_child.dart';
import '../../element_params/sub/text/text_params.dart';
import '../../element_params/super/spwml_params.dart';
import '../../enum/enum_spwml_element_type.dart';
import '../../style/spwml_font_style.dart';
import '../sub/text/text_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-08-27 18:29:26
///
class MultiChildTextElement extends TextElement {
  final StructureElementChildren children;

  ///
  /// * [serial] : Array Index.
  /// * [type] : Element type.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [children] : This element children.
  /// * [textParams] : Parent class parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  MultiChildTextElement(
      int serial,
      EnumSpWMLElementType type,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children,
      TextParamsWrapper textParams)
      : super(serial, type, params, spwmlParams, parentSerial, lineStart,
            lineEnd, style, textParams);

  @override
  MultiChildTextElement initParams() {
    super.initParams();
    return this;
  }
}
