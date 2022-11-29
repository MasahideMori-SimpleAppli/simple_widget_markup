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
/// Author Masahide Mori
///
/// First edition creation date 2021-12-31 17:58:41
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
      this.elParams)
      : super(serial, EnumSpWMLElementType.col, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, children);

  @override
  ColElement initParams() {
    super.initParams();
    elParams.p.mainAxisAlignment = params.containsKey(EnumSpWMLParams.vAlign)
        ? params[EnumSpWMLParams.vAlign]
        : MainAxisAlignment.start;
    elParams.p.crossAxisAlignment = params.containsKey(EnumSpWMLParams.hAlign)
        ? params[EnumSpWMLParams.hAlign]
        : CrossAxisAlignment.start;
    return this;
  }

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
