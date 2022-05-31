import 'package:flutter/material.dart';
import 'package:simple_widget_markup/element/sub/text/text_element.dart';
import '../../../element_params/sub/text/href_params.dart';
import '../../../element_params/sub/text/text_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../spwml_font_style.dart';

import 'package:url_launcher/url_launcher.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-01-04 00:16:17
///
class HrefElement extends TextElement {
  final HrefParamsWrapper elParams;

  HrefElement(
      int serial,
      List<String> param,
      SpWMLParamsWrapper spwmlEP,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      TextParamsWrapper textParams,
      this.elParams)
      : super(serial, EnumSpWMLElementType.href, param, spwmlEP, parentSerial,
            lineStart, lineEnd, style, textParams);

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
      child: getText(context),
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
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("The specified URL could not be opened."),
        duration: Duration(seconds: 3),
      ));
    }
  }
}
