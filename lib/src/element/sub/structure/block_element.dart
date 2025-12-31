import 'package:flutter/material.dart';
import 'package:simple_widget_markup/simple_widget_markup.dart';

///
/// (en) The block.
///
/// (ja) blockの実装。
///
class BlockElement extends SingleChildElement {
  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [info] : SpWML info.
  /// * [child] : This element child.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  BlockElement(
    int serial,
    Map<String, String> params,
    SpWMLParamsWrapper spwmlParams,
    int parentSerial,
    int lineStart,
    int lineEnd,
    SpWMLFontStyle style,
    SpWMLInfo? info,
    BlockElementChild child, {
    super.key,
  }) : super(
          serial,
          EnumSpWMLElementType.block,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          child,
        );

  /// Get this class name.
  @override
  String getClassName() {
    return "BlockElement";
  }

  /// Initialize the parameters.
  @override
  BlockElement initParams() {
    super.initParams();
    return this;
  }

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    return child.getChild();
  }
}
