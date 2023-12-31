import 'package:flutter/material.dart';
import '../../../../simple_widget_markup.dart';

///
/// (en) The circleAvatar.
///
/// (ja) circleAvatarの実装。
///
class CircleAvatarElement extends SingleChildElement {
  final CircleAvatarParamsWrapper elParams;

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
  CircleAvatarElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      BlockElementChild child,
      this.elParams)
      : super(serial, EnumSpWMLElementType.circleAvatar, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, child);

  /// Get this class name.
  @override
  String getClassName() {
    return "CircleAvatarElement";
  }

  /// Initialize the parameters.
  @override
  CircleAvatarElement initParams() {
    super.initParams();
    elParams.p.backgroundColor = params.containsKey(EnumSpWMLParams.color)
        ? params[EnumSpWMLParams.color]
        : null;
    elParams.p.foregroundColor = params.containsKey(EnumSpWMLParams.fgColor)
        ? params[EnumSpWMLParams.fgColor]
        : null;
    elParams.p.radius = params.containsKey(EnumSpWMLParams.radius)
        ? params[EnumSpWMLParams.radius]
        : null;
    return this;
  }

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    return CircleAvatar(
      key: elParams.p.key,
      backgroundColor: elParams.p.backgroundColor,
      backgroundImage: elParams.p.backgroundImage,
      foregroundImage: elParams.p.foregroundImage,
      onBackgroundImageError: elParams.p.onBackgroundImageError,
      onForegroundImageError: elParams.p.onForegroundImageError,
      foregroundColor: elParams.p.foregroundColor,
      radius: elParams.p.radius,
      minRadius: elParams.p.minRadius,
      maxRadius: elParams.p.maxRadius,
      child: elParams.p.child ?? child.child,
    );
  }
}
