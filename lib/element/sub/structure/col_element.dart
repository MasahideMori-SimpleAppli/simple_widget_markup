import 'package:flutter/material.dart';

import '../../../element_params/element_child.dart';
import '../../../element_params/sub/structure/row_col_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../spwml_font_style.dart';
import '../../super/spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-31 17:58:41
///
class ColElement extends SpWMLElement {
  final StructureElementChildren children;
  final RowColParamsWrapper elParams;

  ColElement(
      int serial,
      List<String> param,
      SpWMLParamsWrapper spwmlEP,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children,
      this.elParams)
      : super(serial, EnumSpWMLElementType.col, param, spwmlEP, parentSerial,
            lineStart, lineEnd, style);

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
