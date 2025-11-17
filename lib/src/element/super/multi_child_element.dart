import '../../element_params/element_child.dart';
import 'spwml_element.dart';

///
/// (en) Superclass for elements with multiple children.
///
/// (ja) 複数の子を持つエレメントのスーパークラス。
///
class MultiChildElement extends SpWMLElement {
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
  /// * [info] : SpWML info.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  MultiChildElement(
    super.serial,
    super.type,
    super.params,
    super.spwmlParams,
    super.parentSerial,
    super.lineStart,
    super.lineEnd,
    super.style,
    super.info,
    this.children, {
    super.key,
  });

  /// Get this class name.
  @override
  String getClassName() {
    return "MultiChildElement";
  }

  /// Initialize the parameters.
  @override
  MultiChildElement initParams() {
    super.initParams();
    return this;
  }
}
