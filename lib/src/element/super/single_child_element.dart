import '../../element_params/element_child.dart';
import '../../element_params/spwml_info.dart';
import '../../element_params/super/spwml_params.dart';
import '../../enum/enum_spwml_element_type.dart';
import '../../style/spwml_font_style.dart';
import 'spwml_element.dart';

///
/// (en) Superclass for elements with one child.
///
/// (ja) 1つの子を持つエレメントのスーパークラス。
///
class SingleChildElement extends SpWMLElement {
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
  /// * [child] : This element child.
  /// * [info] : SpWML info.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  SingleChildElement(
      int serial,
      EnumSpWMLElementType type,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      this.child)
      : super(serial, type, params, spwmlParams, parentSerial, lineStart,
            lineEnd, style, info);

  /// Get this class name.
  @override
  String getClassName() {
    return "SingleChildElement";
  }

  /// Initialize the parameters.
  @override
  SingleChildElement initParams() {
    super.initParams();
    return this;
  }
}
