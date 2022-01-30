import 'package:flutter/material.dart';
import 'element_child.dart';
import 'element_param.dart';
import 'enum_spwml_element_param.dart';
import 'enum_spwml_element_type.dart';
import 'spwml_font_style.dart';
import 'spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-01-30 20:14:05
///
class ScrollElement extends SpWMLElement {
  final BlockElementChild child;
  final ScrollElementParams seParams;

  ScrollElement(
      int serial,
      List<String> param,
      String text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.child,
      this.seParams)
      : super(serial, EnumSpWMLElementType.scroll, param, text, parentSerial,
            lineStart, lineEnd, style);

  const ScrollElement.convert(
      int serial,
      Map<EnumSpWMLElementParam, dynamic> param,
      String text,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.child,
      this.seParams)
      : super.convert(serial, EnumSpWMLElementType.scroll, param, text,
            parentSerial, lineStart, lineEnd, style);

  /// (en)Use this when you want to keep the scroll position when updating the widget.
  ///
  /// (ja)ウィジェットの更新時にスクロール位置を保持したい場合に使用します。
  /// * [ctrl] : ScrollController
  setScrollController(ScrollController? ctrl) {
    seParams.ctrl = ctrl;
  }

  @override
  Widget getWidget(BuildContext context) {
    final bool isExistWidth = param.containsKey(EnumSpWMLElementParam.width);
    final bool isExistHeight = param.containsKey(EnumSpWMLElementParam.height);
    final bool isExistAxis = param.containsKey(EnumSpWMLElementParam.axis);
    return ConstrainedBox(
        constraints: getConstraints(),
        child: Container(
          width: isExistWidth ? param[EnumSpWMLElementParam.width]! : null,
          height: isExistHeight ? param[EnumSpWMLElementParam.height]! : null,
          margin: getMargin(context),
          padding: getPadding(context),
          color: param.containsKey(EnumSpWMLElementParam.bgColor)
              ? param[EnumSpWMLElementParam.bgColor]
              : null,
          child: SingleChildScrollView(
              child: child.getChild(),
              controller: seParams.ctrl,
              scrollDirection: isExistAxis
                  ? param[EnumSpWMLElementParam.axis]!
                  : Axis.vertical),
        ));
  }
}
