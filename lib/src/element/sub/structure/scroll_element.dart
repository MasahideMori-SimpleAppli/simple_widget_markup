import 'package:flutter/material.dart';

import '../../../element_params/element_child.dart';
import '../../../element_params/sub/structure/scroll_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../style/spwml_font_style.dart';
import '../../super/spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-01-30 20:14:05
///
class ScrollElement extends SpWMLElement {
  final BlockElementChild child;
  final ScrollParamsWrapper elParams;

  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [child] : This element child.
  /// * [elParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  ScrollElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.child,
      this.elParams)
      : super(serial, EnumSpWMLElementType.scroll, params, spwmlParams,
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
