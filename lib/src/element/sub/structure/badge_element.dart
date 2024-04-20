import 'package:flutter/material.dart';
import '../../../../simple_widget_markup.dart';

///
/// (en) The badge.
///
/// (ja) badgeの実装。
///
class BadgeElement extends SingleChildTextElement {
  final BadgeParamsWrapper elParams;

  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [info] : SpWML info.
  /// * [child] : This element child.
  /// * [elParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  BadgeElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      BlockElementChild child,
      TextParamsWrapper textParams,
      this.elParams)
      : super(serial, EnumSpWMLElementType.badge, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, child, textParams);

  /// Get this class name.
  @override
  String getClassName() {
    return "BadgeElement";
  }

  /// Initialize the parameters.
  @override
  BadgeElement initParams() {
    super.initParams();
    elParams.p.backgroundColor = params.containsKey(EnumSpWMLParams.color)
        ? params[EnumSpWMLParams.color]
        : null;
    elParams.p.textColor = params.containsKey(EnumSpWMLParams.textColor)
        ? params[EnumSpWMLParams.textColor]
        : null;
    elParams.p.label = params.containsKey(EnumSpWMLParams.label)
        ? Text(params[EnumSpWMLParams.label])
        : null;
    elParams.p.smallSize = params.containsKey(EnumSpWMLParams.smallSize)
        ? params[EnumSpWMLParams.smallSize]
        : null;
    final bool useOffsetX = params.containsKey(EnumSpWMLParams.offsetX);
    final bool useOffsetY = params.containsKey(EnumSpWMLParams.offsetY);
    if (useOffsetX || useOffsetY) {
      elParams.p.offset = Offset(
          useOffsetX ? params[EnumSpWMLParams.offsetX] : 0.0,
          useOffsetY ? params[EnumSpWMLParams.offsetY] : 0.0);
    }
    elParams.p.isLabelVisible =
        params.containsKey(EnumSpWMLParams.isLabelVisible)
            ? params[EnumSpWMLParams.isLabelVisible]
            : true;
    return this;
  }

  /// (en) Set the label. The label is typically text widget.
  ///
  /// (ja) ラベルを設定します。ラベルは、通常はテキストウィジェットです。
  ///
  /// * [label] : Text widget label.
  void setLabel(Widget label) {
    elParams.p.label = label;
  }

  /// (en) Set label visibility.
  /// Note that this method has no effect
  /// if called after the screen has been configured.
  ///
  /// (ja) ラベルの可視化状態を変更します。
  /// なお、このメソッドは画面構成後に呼び出しても効果がありません。
  ///
  /// * [isLabelVisible] : If true, the label is visible.
  void setVisibility(bool isLabelVisible) {
    elParams.p.isLabelVisible = isLabelVisible;
  }

  /// (en) Set the label offset.
  ///
  /// (ja) ラベルのオフセットを設定します。
  ///
  /// * [offset] : The offset of text widget label.
  void setOffset(Offset offset) {
    elParams.p.offset = offset;
  }

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    return Badge(
      key: elParams.p.key,
      backgroundColor: elParams.p.backgroundColor,
      textColor: elParams.p.textColor,
      smallSize: elParams.p.smallSize,
      largeSize: elParams.p.largeSize,
      textStyle: elParams.p.textStyle ?? getStyle(context),
      padding: elParams.p.padding,
      alignment: elParams.p.alignment,
      offset: elParams.p.offset,
      label: elParams.p.label,
      isLabelVisible: elParams.p.isLabelVisible,
      child: elParams.p.child ?? child.child,
    );
  }
}
