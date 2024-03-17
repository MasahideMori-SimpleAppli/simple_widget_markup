import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../simple_widget_markup.dart';

///
/// (en) The span.
///
/// (ja) spanの実装。
///
class SpanElement extends MultiChildTextElement {
  final SpanParamsWrapper elParams;

  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [info] : SpWML info.
  /// * [children] : This element children.
  /// * [elParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  SpanElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      StructureElementChildren children,
      TextParamsWrapper textParams,
      this.elParams)
      : super(
            serial,
            EnumSpWMLElementType.span,
            params,
            spwmlParams,
            parentSerial,
            lineStart,
            lineEnd,
            style,
            info,
            children,
            textParams);

  /// Get this class name.
  @override
  String getClassName() {
    return "SpanElement";
  }

  /// Initialize the parameters.
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
    elParams.p.isLayoutStrictMode =
        params.containsKey(EnumSpWMLParams.isLayoutStrictMode)
            ? params[EnumSpWMLParams.isLayoutStrictMode]
            : false;
    return this;
  }

  /// (en) Set onSelectionChanged function.
  ///
  /// (ja) 選択状態が変化した時のコールバックを設定します。
  void setOnSelectionChanged(
      void Function(TextSelection, SelectionChangedCause?)?
          onSelectionChanged) {
    elParams.p.selectableTextRichParams ??= SelectableTextRichParams();
    elParams.p.selectableTextRichParams!.selectableTextParams
        .onSelectionChanged = onSelectionChanged;
  }

  /// (en)If set to true, all child blocks will be calculated as WidgetSpan.
  ///
  /// (ja) trueを設定した場合、子ブロックを全てWidgetSpanとして計算します。
  void setStrictMode(bool isEnable) {
    elParams.p.isLayoutStrictMode = isEnable;
  }

  /// Assemble and return the widget.
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
                getStyle(context),
            strutStyle: elParams.p.selectableTextRichParams!
                    .selectableTextParams.strutStyle ??
                getStrutStyle(context),
            textAlign: elParams.p.selectableTextRichParams!.selectableTextParams
                    .textAlign ??
                getTextAlign(),
            textDirection: elParams
                .p.selectableTextRichParams!.selectableTextParams.textDirection,
            textScaler: elParams.p.selectableTextRichParams!
                    .selectableTextParams.textScaler ??
                MediaQuery.of(context).textScaler,
            showCursor: elParams
                .p.selectableTextRichParams!.selectableTextParams.showCursor,
            autofocus: elParams
                .p.selectableTextRichParams!.selectableTextParams.autofocus,
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
            contextMenuBuilder: elParams.p.selectableTextRichParams!
                .selectableTextParams.contextMenuBuilder,
            magnifierConfiguration: elParams.p.selectableTextRichParams!
                .selectableTextParams.magnifierConfiguration,
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
            textScaler: elParams.p.richTextParams!.textScaler ??
                MediaQuery.of(context).textScaler,
            maxLines: elParams.p.richTextParams!.maxLines,
            locale: elParams.p.richTextParams!.locale,
            strutStyle: elParams.p.richTextParams!.strutStyle,
            textWidthBasis: elParams.p.richTextParams!.textWidthBasis,
            textHeightBehavior: elParams.p.richTextParams!.textHeightBehavior,
            selectionRegistrar: elParams.p.richTextParams!.selectionRegistrar,
            selectionColor: elParams.p.richTextParams!.selectionColor,
          );
  }

  List<InlineSpan> _convertChildren(BuildContext context) {
    List<InlineSpan> r = [];
    if (elParams.p.isLayoutStrictMode) {
      for (Widget i in children.children) {
        if (i is SuperAndSubscriptElement) {
          r.add(WidgetSpan(child: i.getInSpan(context)));
        } else if (i is TextElement) {
          r.add(WidgetSpan(child: i.getInSpan(context)));
        } else {
          r.add(WidgetSpan(child: i));
        }
      }
    } else {
      for (Widget i in children.children) {
        if (i is HrefElement) {
          r.add(TextSpan(
              text: i.getDisplayText(),
              style: i.getStyle(context),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  i.onTapFunc(context);
                }));
        } else if (i is RubyTextElement) {
          r.add(WidgetSpan(child: i));
        } else if (i is SuperAndSubscriptElement) {
          r.add(WidgetSpan(child: i.getInSpanOfNonStrictMode(context)));
        } else if (i is TextElement) {
          r.add(TextSpan(
            text: i.spwmlParams.p.text,
            style: i.getStyle(context),
          ));
        } else {
          r.add(WidgetSpan(child: i));
        }
      }
    }
    return r;
  }
}
