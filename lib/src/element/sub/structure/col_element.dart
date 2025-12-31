import 'package:flutter/material.dart';
import 'package:simple_widget_markup/simple_widget_markup.dart';

///
/// (en) The col.
///
/// (ja) colの実装。
///
class ColElement extends MultiChildElement {
  final RowColParamsWrapper elParams;

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
  ColElement(
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
          EnumSpWMLElementType.col,
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
    return "ColElement";
  }

  /// Initialize the parameters.
  @override
  ColElement initParams() {
    super.initParams();
    elParams.p.mainAxisAlignment = params.containsKey(EnumSpWMLParams.vAlign)
        ? params[EnumSpWMLParams.vAlign]
        : MainAxisAlignment.start;
    elParams.p.crossAxisAlignment = params.containsKey(EnumSpWMLParams.hAlign)
        ? params[EnumSpWMLParams.hAlign]
        : CrossAxisAlignment.start;
    elParams.p.mainAxisSize = params.containsKey(EnumSpWMLParams.mainAxisSize)
        ? params[EnumSpWMLParams.mainAxisSize]
        : MainAxisSize.max;
    return this;
  }

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    return Column(
      key: elParams.p.key,
      mainAxisAlignment: elParams.p.mainAxisAlignment,
      mainAxisSize: elParams.p.mainAxisSize,
      crossAxisAlignment: elParams.p.crossAxisAlignment,
      textDirection: elParams.p.textDirection,
      verticalDirection: elParams.p.verticalDirection,
      textBaseline: elParams.p.textBaseline,
      children: elParams.p.children ?? children.getChildren(),
    );
  }
}
