import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../simple_widget_markup.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-01-04 00:16:17
///
class HrefElement extends TextElement {
  final HrefParamsWrapper elParams;

  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [info] : SpWML info.
  /// * [textParams] : Parent class parameters.
  /// * [elParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  HrefElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      TextParamsWrapper textParams,
      this.elParams)
      : super(serial, EnumSpWMLElementType.href, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, textParams);

  @override
  HrefElement initParams() {
    super.initParams();
    elParams.p.alt = params.containsKey(EnumSpWMLParams.alt)
        ? params[EnumSpWMLParams.alt]
        : null;
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    return InkWell(
      key: elParams.p.inkWellParams.key,
      onTap: () {
        if (elParams.p.inkWellParams.onTap != null) {
          elParams.p.inkWellParams.onTap!();
        }
        onTapFunc(context);
      },
      onDoubleTap: elParams.p.inkWellParams.onDoubleTap,
      onLongPress: elParams.p.inkWellParams.onLongPress,
      onTapDown: elParams.p.inkWellParams.onTapDown,
      onTapUp: elParams.p.inkWellParams.onTapUp,
      onTapCancel: elParams.p.inkWellParams.onTapCancel,
      onHighlightChanged: elParams.p.inkWellParams.onHighlightChanged,
      onHover: elParams.p.inkWellParams.onHover,
      mouseCursor: elParams.p.inkWellParams.mouseCursor,
      focusColor: elParams.p.inkWellParams.focusColor,
      hoverColor: elParams.p.inkWellParams.hoverColor,
      highlightColor: elParams.p.inkWellParams.highlightColor,
      overlayColor: elParams.p.inkWellParams.overlayColor,
      splashColor: elParams.p.inkWellParams.splashColor,
      splashFactory: elParams.p.inkWellParams.splashFactory,
      radius: elParams.p.inkWellParams.radius,
      borderRadius: elParams.p.inkWellParams.borderRadius,
      customBorder: elParams.p.inkWellParams.customBorder,
      enableFeedback: elParams.p.inkWellParams.enableFeedback,
      excludeFromSemantics: elParams.p.inkWellParams.excludeFromSemantics,
      focusNode: elParams.p.inkWellParams.focusNode,
      canRequestFocus: elParams.p.inkWellParams.canRequestFocus,
      onFocusChange: elParams.p.inkWellParams.onFocusChange,
      autofocus: elParams.p.inkWellParams.autofocus,
      child: getText(context),
    );
  }

  /// Get text widget
  @override
  Widget getText(BuildContext context) {
    return Text(
      getDisplayText(),
      key: textParams.p.key,
      style: getStyle(),
      strutStyle: getStrutStyle(),
      textAlign: getTextAlign(),
      textDirection: textParams.p.textDirection,
      locale: textParams.p.locale,
      softWrap: textParams.p.softWrap,
      textScaleFactor: textParams.p.textScaleFactor ??
          MediaQuery.of(context).textScaleFactor,
      maxLines: textParams.p.maxLines,
      semanticsLabel: textParams.p.semanticsLabel,
      textWidthBasis: textParams.p.textWidthBasis,
      textHeightBehavior: textParams.p.textHeightBehavior,
    );
  }

  /// return alt text or text.
  String getDisplayText() {
    return elParams.p.alt != null ? elParams.p.alt! : spwmlParams.p.text;
  }

  /// launch url.
  void onTapFunc(BuildContext context) async {
    final Uri uri = Uri.parse(spwmlParams.p.text);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(elParams.p.urlOpenErrorMsg),
          duration: elParams.p.urlOpenErrorMsgDuration,
        ));
      }
    }
  }
}
