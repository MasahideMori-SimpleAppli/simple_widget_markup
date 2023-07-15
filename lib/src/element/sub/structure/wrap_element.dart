import 'package:flutter/material.dart';
import '../../../element/super/multi_child_element.dart';
import '../../../element_params/element_child.dart';
import '../../../element_params/spwml_info.dart';
import '../../../element_params/sub/structure/wrap_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../style/spwml_font_style.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-04-10 16:18:52
///
class WrapElement extends MultiChildElement {
  final WrapParamsWrapper elParams;

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
  WrapElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      StructureElementChildren children,
      this.elParams)
      : super(serial, EnumSpWMLElementType.wrap, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, children);

  /// Initialize the parameters.
  @override
  WrapElement initParams() {
    super.initParams();
    elParams.p.alignment = params.containsKey(EnumSpWMLParams.hAlign)
        ? params[EnumSpWMLParams.hAlign]
        : WrapAlignment.start;
    elParams.p.runAlignment = params.containsKey(EnumSpWMLParams.vAlign)
        ? params[EnumSpWMLParams.vAlign]
        : WrapAlignment.start;
    return this;
  }

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    return Wrap(
      key: elParams.p.key,
      direction: elParams.p.direction,
      alignment: elParams.p.alignment,
      spacing: elParams.p.spacing,
      runAlignment: elParams.p.runAlignment,
      runSpacing: elParams.p.runSpacing,
      crossAxisAlignment: elParams.p.crossAxisAlignment,
      textDirection: elParams.p.textDirection,
      verticalDirection: elParams.p.verticalDirection,
      clipBehavior: elParams.p.clipBehavior,
      children: elParams.p.children ?? children.getChildren(),
    );
  }
}
