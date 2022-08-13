import 'package:flutter/material.dart';

import '../../../element_params/sub/other/icon_element_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../style/spwml_font_style.dart';
import '../../super/spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-30 23:42:11
///
class IconElement extends SpWMLElement {
  final IconParamsWrapper elParams;

  IconElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlEP,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.elParams)
      : super(serial, EnumSpWMLElementType.icon, params, spwmlEP, parentSerial,
            lineStart, lineEnd, style);

  @override
  IconElement initParams() {
    super.initParams();
    elParams.p.icon = params.containsKey(EnumSpWMLParams.iconNum)
        ? params[EnumSpWMLParams.iconNum]!
        : null;
    elParams.p.size = params.containsKey(EnumSpWMLParams.iconSize)
        ? params[EnumSpWMLParams.iconSize]!
        : null;
    elParams.p.color = params.containsKey(EnumSpWMLParams.iconColor)
        ? params[EnumSpWMLParams.iconColor]!
        : null;
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    return Icon(
      elParams.p.icon,
      key: elParams.p.key,
      size: elParams.p.size,
      color: elParams.p.color,
      semanticLabel: elParams.p.semanticLabel,
      textDirection: elParams.p.textDirection,
      shadows: elParams.p.shadows,
    );
  }
}
