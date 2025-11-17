import 'package:flutter/material.dart';
import '../../../element_params/spwml_info.dart';
import '../../super/multi_child_element.dart';
import '../../../element_params/element_child.dart';
import '../../../element_params/sub/structure/row_col_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../style/spwml_font_style.dart';

///
/// (en) The row.
///
/// (ja) rowの実装。
///
class RowElement extends MultiChildElement {
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
  RowElement(
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
         EnumSpWMLElementType.row,
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
    return "RowElement";
  }

  /// Initialize the parameters.
  @override
  RowElement initParams() {
    super.initParams();
    elParams.p.mainAxisAlignment = params.containsKey(EnumSpWMLParams.hAlign)
        ? params[EnumSpWMLParams.hAlign]
        : MainAxisAlignment.start;
    elParams.p.crossAxisAlignment = params.containsKey(EnumSpWMLParams.vAlign)
        ? params[EnumSpWMLParams.vAlign]
        : CrossAxisAlignment.start;
    elParams.p.textBaseline = params.containsKey(EnumSpWMLParams.baselineType)
        ? params[EnumSpWMLParams.baselineType]
        : null;
    if (elParams.p.textBaseline != null) {
      elParams.p.crossAxisAlignment = CrossAxisAlignment.baseline;
    }
    if (elParams.p.crossAxisAlignment == CrossAxisAlignment.baseline &&
        elParams.p.textBaseline == null) {
      elParams.p.textBaseline = TextBaseline.alphabetic;
    }
    elParams.p.mainAxisSize = params.containsKey(EnumSpWMLParams.mainAxisSize)
        ? params[EnumSpWMLParams.mainAxisSize]
        : MainAxisSize.max;
    return this;
  }

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    return Row(
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
