import 'package:flutter/material.dart';
import 'package:simple_widget_markup/simple_widget_markup.dart';

///
/// (en) The stack.
///
/// (ja) stackの実装。
///
class StackElement extends MultiChildElement {
  final StackParamsWrapper elParams;

  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [info] : SpWML info.
  /// * [children] : This element children.
  /// * [elParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  StackElement(
    int serial,
    Map<String, String> params,
    SpWMLParamsWrapper spwmlParams,
    int parentSerial,
    int lineStart,
    int lineEnd,
    SpWMLFontStyle style,
    SpWMLInfo? info,
    StructureElementChildren children,
    this.elParams, {
    super.key,
  }) : super(
          serial,
          EnumSpWMLElementType.stack,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          children,
        );

  /// Get this class name.
  @override
  String getClassName() {
    return "StackElement";
  }

  /// Initialize the parameters.
  @override
  StackElement initParams() {
    super.initParams();
    return this;
  }

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    return Stack(
      key: elParams.p.key,
      alignment: elParams.p.alignment,
      textDirection: elParams.p.textDirection,
      fit: elParams.p.fit,
      clipBehavior: elParams.p.clipBehavior,
      children: elParams.p.children ?? children.getChildren(),
    );
  }
}
