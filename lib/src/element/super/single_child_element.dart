import '../../element_params/element_child.dart';
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
      super.serial,
      super.type,
      super.params,
      super.spwmlParams,
      super.parentSerial,
      super.lineStart,
      super.lineEnd,
      super.style,
      super.info,
      this.child,
      {super.key});

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
