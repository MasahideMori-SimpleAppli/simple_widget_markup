import 'package:flutter/material.dart';
import 'package:simple_widget_markup/simple_widget_markup.dart';

///
/// (en) The expTile.
///
/// (ja) expTileの実装。
///
class ExpTileElement extends MultiChildTextElement {
  final ExpTileParamsWrapper elParams;

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
  ExpTileElement(
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
    this.elParams, {
    super.key,
  }) : super(
          serial,
          EnumSpWMLElementType.expTile,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          children,
          textParams,
        );

  /// Get this class name.
  @override
  String getClassName() {
    return "ExpTileElement";
  }

  /// Initialize the parameters.
  @override
  ExpTileElement initParams() {
    super.initParams();
    final bool isContainIcon = params.containsKey(EnumSpWMLParams.iconNum);
    if (isContainIcon) {
      elParams.p.leading = Icon(
        params[EnumSpWMLParams.iconNum]!,
        size: params.containsKey(EnumSpWMLParams.iconSize)
            ? params[EnumSpWMLParams.iconSize]
            : null,
        color: params.containsKey(EnumSpWMLParams.iconColor)
            ? params[EnumSpWMLParams.iconColor]
            : null,
      );
    }
    return this;
  }

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    return ExpansionTile(
      key: elParams.p.key,
      leading: elParams.p.leading,
      title: elParams.p.title ??
          Text(
            spwmlParams.p.text,
            textScaler: MediaQuery.of(context).textScaler,
            style: getStyle(context),
            strutStyle: getStrutStyle(context),
            textAlign: params.containsKey(EnumSpWMLParams.textAlign)
                ? params[EnumSpWMLParams.textAlign]
                : TextAlign.left,
            maxLines: null,
          ),
      subtitle: elParams.p.subtitle,
      onExpansionChanged: elParams.p.onExpansionChanged,
      trailing: elParams.p.trailing,
      initiallyExpanded: elParams.p.initiallyExpanded,
      showTrailingIcon: elParams.p.showTrailingIcon,
      maintainState: elParams.p.maintainState,
      tilePadding: elParams.p.tilePadding,
      expandedCrossAxisAlignment: elParams.p.expandedCrossAxisAlignment,
      expandedAlignment: elParams.p.expandedAlignment,
      childrenPadding: elParams.p.childrenPadding,
      backgroundColor: elParams.p.backgroundColor,
      collapsedBackgroundColor: elParams.p.collapsedBackgroundColor,
      textColor: elParams.p.textColor,
      collapsedTextColor: elParams.p.collapsedTextColor,
      iconColor: elParams.p.iconColor,
      collapsedIconColor: elParams.p.collapsedIconColor,
      shape: elParams.p.shape,
      collapsedShape: elParams.p.collapsedShape,
      clipBehavior: elParams.p.clipBehavior,
      controlAffinity: elParams.p.controlAffinity,
      controller: elParams.p.controller,
      dense: elParams.p.dense,
      visualDensity: elParams.p.visualDensity,
      minTileHeight: elParams.p.minTileHeight,
      enableFeedback: elParams.p.enableFeedback,
      enabled: elParams.p.enabled,
      expansionAnimationStyle: elParams.p.expansionAnimationStyle,
      internalAddSemanticForOnTap: elParams.p.internalAddSemanticForOnTap,
      children: elParams.p.children ?? children.getChildren(),
    );
  }
}
