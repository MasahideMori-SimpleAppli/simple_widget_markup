import 'package:flutter/material.dart';
import '../../../element_params/spwml_info.dart';
import '../../super/multi_child_text_element.dart';
import '../../../element_params/element_child.dart';
import '../../../element_params/sub/structure/exp_tile_params.dart';
import '../../../element_params/sub/text/text_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../style/spwml_font_style.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-31 17:58:41
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
      this.elParams)
      : super(
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
            textParams);

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

  @override
  Widget getWidget(BuildContext context) {
    return ExpansionTile(
      key: elParams.p.key,
      leading: elParams.p.leading,
      title: elParams.p.title ??
          Text(
            spwmlParams.p.text,
            textScaleFactor: MediaQuery.of(context).textScaleFactor,
            style: getStyle(),
            strutStyle: getStrutStyle(),
            textAlign: params.containsKey(EnumSpWMLParams.textAlign)
                ? params[EnumSpWMLParams.textAlign]
                : TextAlign.left,
            maxLines: null,
          ),
      subtitle: elParams.p.subtitle,
      onExpansionChanged: elParams.p.onExpansionChanged,
      trailing: elParams.p.trailing,
      initiallyExpanded: elParams.p.initiallyExpanded,
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
      controlAffinity: elParams.p.controlAffinity,
      children: elParams.p.children ?? children.getChildren(),
    );
  }
}
