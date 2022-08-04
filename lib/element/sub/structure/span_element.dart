import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../element/sub/text/ruby_text_element.dart';
import '../../../element_params/sub/structure/span_params.dart';
import '../../../element_params/sub/text/text_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../text/href_element.dart';
import '../text/text_element.dart';
import '../../../element_params/element_child.dart';
import '../../spwml_font_style.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-01-04 00:15:15
///
class SpanElement extends TextElement {
  final StructureElementChildren children;
  final SpanParamsWrapper elParams;

  SpanElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlEP,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      this.children,
      TextParamsWrapper textParams,
      this.elParams)
      : super(serial, EnumSpWMLElementType.span, params, spwmlEP, parentSerial,
            lineStart, lineEnd, style, textParams);

  @override
  SpanElement initParams() {
    super.initParams();
    elParams.p.isSelectable = params.containsKey(EnumSpWMLParams.isSelectable)
        ? params[EnumSpWMLParams.isSelectable]
        : true;
    if (elParams.p.isSelectable) {
      elParams.p.selectableTextRichParams = SelectableTextRichParams();
    } else {
      elParams.p.richTextParams = RichTextParams();
    }
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    return elParams.p.isSelectable
        ? SelectableText.rich(
            elParams.p.selectableTextRichParams!.textSpan ??
                TextSpan(children: _convertChildren(context)),
            key: elParams.p.selectableTextRichParams!.selectableTextParams.key,
            focusNode: elParams
                .p.selectableTextRichParams!.selectableTextParams.focusNode,
            style: elParams
                    .p.selectableTextRichParams!.selectableTextParams.style ??
                getStyle(),
            strutStyle: elParams.p.selectableTextRichParams!
                    .selectableTextParams.strutStyle ??
                getStrutStyle(),
            textAlign: elParams.p.selectableTextRichParams!.selectableTextParams
                    .textAlign ??
                getTextAlign(),
            textDirection: elParams
                .p.selectableTextRichParams!.selectableTextParams.textDirection,
            textScaleFactor: elParams.p.selectableTextRichParams!
                    .selectableTextParams.textScaleFactor ??
                MediaQuery.of(context).textScaleFactor,
            showCursor: elParams
                .p.selectableTextRichParams!.selectableTextParams.showCursor,
            autofocus: elParams
                .p.selectableTextRichParams!.selectableTextParams.autofocus,
            toolbarOptions: elParams.p.selectableTextRichParams!
                .selectableTextParams.toolbarOptions,
            minLines: elParams
                .p.selectableTextRichParams!.selectableTextParams.minLines,
            maxLines: elParams
                .p.selectableTextRichParams!.selectableTextParams.maxLines,
            cursorWidth: elParams
                .p.selectableTextRichParams!.selectableTextParams.cursorWidth,
            cursorHeight: elParams
                .p.selectableTextRichParams!.selectableTextParams.cursorHeight,
            cursorRadius: elParams
                .p.selectableTextRichParams!.selectableTextParams.cursorRadius,
            cursorColor: elParams
                .p.selectableTextRichParams!.selectableTextParams.cursorColor,
            selectionHeightStyle: elParams.p.selectableTextRichParams!
                .selectableTextParams.selectionHeightStyle,
            selectionWidthStyle: elParams.p.selectableTextRichParams!
                .selectableTextParams.selectionWidthStyle,
            dragStartBehavior: elParams.p.selectableTextRichParams!
                .selectableTextParams.dragStartBehavior,
            enableInteractiveSelection: elParams.p.selectableTextRichParams!
                .selectableTextParams.enableInteractiveSelection,
            selectionControls: elParams.p.selectableTextRichParams!
                .selectableTextParams.selectionControls,
            onTap:
                elParams.p.selectableTextRichParams!.selectableTextParams.onTap,
            scrollPhysics: elParams
                .p.selectableTextRichParams!.selectableTextParams.scrollPhysics,
            semanticsLabel: elParams.p.selectableTextRichParams!
                .selectableTextParams.semanticsLabel,
            textHeightBehavior: elParams.p.selectableTextRichParams!
                .selectableTextParams.textHeightBehavior,
            textWidthBasis: elParams.p.selectableTextRichParams!
                .selectableTextParams.textWidthBasis,
            onSelectionChanged: elParams.p.selectableTextRichParams!
                .selectableTextParams.onSelectionChanged,
          )
        : RichText(
            key: elParams.p.richTextParams!.key,
            text: elParams.p.richTextParams!.text ??
                TextSpan(children: _convertChildren(context)),
            textAlign: elParams.p.richTextParams!.textAlign ?? getTextAlign(),
            textDirection: elParams.p.richTextParams!.textDirection,
            softWrap: elParams.p.richTextParams!.softWrap,
            overflow: elParams.p.richTextParams!.overflow,
            textScaleFactor: elParams.p.richTextParams!.textScaleFactor ??
                MediaQuery.of(context).textScaleFactor,
            maxLines: elParams.p.richTextParams!.maxLines,
            locale: elParams.p.richTextParams!.locale,
            strutStyle: elParams.p.richTextParams!.strutStyle,
            textWidthBasis: elParams.p.richTextParams!.textWidthBasis,
            textHeightBehavior: elParams.p.richTextParams!.textHeightBehavior,
          );
  }

  List<InlineSpan> _convertChildren(BuildContext context) {
    List<InlineSpan> r = [];
    if (children.children.length ==
        (elParams.p.textSpanParamsList?.length ?? -1)) {
      int count = 0;
      final List<TextSpanParams> tsp = elParams.p.textSpanParamsList!;
      for (Widget i in children.children) {
        final int n = count;
        if (i is HrefElement) {
          r.add(TextSpan(
              text: tsp[n].text ?? i.getDisplayText(),
              children: tsp[n].children,
              style: tsp[n].style ?? i.getStyle(),
              recognizer: tsp[n].recognizer ??
                  (TapGestureRecognizer()
                    ..onTap = () {
                      i.onTapFunc(context);
                    }),
              mouseCursor: tsp[n].mouseCursor,
              onEnter: tsp[n].onEnter,
              onExit: tsp[n].onExit,
              semanticsLabel: tsp[n].semanticsLabel,
              locale: tsp[n].locale,
              spellOut: tsp[n].spellOut));
        } else if (i is RubyTextElement) {
          r.add(WidgetSpan(child: i));
        } else if (i is TextElement) {
          r.add(TextSpan(
              text: tsp[n].text ?? i.spwmlParams.p.text,
              children: tsp[n].children,
              style: tsp[n].style ?? i.getStyle(),
              recognizer: tsp[n].recognizer,
              mouseCursor: tsp[n].mouseCursor,
              onEnter: tsp[n].onEnter,
              onExit: tsp[n].onExit,
              semanticsLabel: tsp[n].semanticsLabel,
              locale: tsp[n].locale,
              spellOut: tsp[n].spellOut));
        } else {
          r.add(WidgetSpan(child: i));
        }
        count += 1;
      }
    } else {
      for (Widget i in children.children) {
        if (i is HrefElement) {
          r.add(TextSpan(
              text: i.getDisplayText(),
              style: i.getStyle(),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  i.onTapFunc(context);
                }));
        } else if (i is RubyTextElement) {
          r.add(WidgetSpan(child: i));
        } else if (i is TextElement) {
          r.add(TextSpan(
            text: i.spwmlParams.p.text,
            style: i.getStyle(),
          ));
        } else {
          r.add(WidgetSpan(child: i));
        }
      }
    }
    return r;
  }
}
