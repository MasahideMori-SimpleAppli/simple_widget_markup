import 'package:flutter/material.dart';

import '../../../element_params/element_child.dart';
import '../../../element_params/sub/structure/scroll_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../spwml_font_style.dart';
import '../../super/spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-01-30 20:14:05
///
class ScrollElement extends SpWMLElement {
  final BlockElementChild child;
  final ScrollParamsWrapper elParams;

  ScrollElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlEP,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.child,
      this.elParams)
      : super(serial, EnumSpWMLElementType.scroll, params, spwmlEP,
            parentSerial, lineStart, lineEnd, style);

  @override
  ScrollElement initParams() {
    super.initParams();
    elParams.p.primary = params.containsKey(EnumSpWMLParams.isPrimary)
        ? params[EnumSpWMLParams.isPrimary]!
        : null;
    elParams.p.scrollDirection = params.containsKey(EnumSpWMLParams.axis)
        ? params[EnumSpWMLParams.axis]!
        : Axis.vertical;
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    return SingleChildScrollView(
      key: elParams.p.key,
      scrollDirection: elParams.p.scrollDirection,
      reverse: elParams.p.reverse,
      padding: elParams.p.padding,
      primary: elParams.p.primary,
      physics: elParams.p.physics,
      controller: elParams.p.controller,
      child: child.getChild(),
      dragStartBehavior: elParams.p.dragStartBehavior,
      clipBehavior: elParams.p.clipBehavior,
      restorationId: elParams.p.restorationId,
      keyboardDismissBehavior: elParams.p.keyboardDismissBehavior,
    );
  }
}
