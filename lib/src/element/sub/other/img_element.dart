import 'package:flutter/material.dart';

import '../../../element_params/spwml_info.dart';
import '../../../element_params/sub/other/img_element_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_img_type.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../style/spwml_font_style.dart';
import '../../super/spwml_element.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-30 23:42:11
///
class ImgElement extends SpWMLElement {
  final ImgParamsWrapper elParams;

  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [info] : SpWML info.
  /// * [elParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  ImgElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      this.elParams)
      : super(serial, EnumSpWMLElementType.img, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info);

  @override
  ImgElement initParams() {
    super.initParams();
    elParams.p.type = params.containsKey(EnumSpWMLParams.type)
        ? params[EnumSpWMLParams.type]!
        : EnumImgType.network;
    elParams.p.fit = params.containsKey(EnumSpWMLParams.fit)
        ? params[EnumSpWMLParams.fit]!
        : BoxFit.contain;
    elParams.p.repeat = params.containsKey(EnumSpWMLParams.repeat)
        ? params[EnumSpWMLParams.repeat]!
        : ImageRepeat.noRepeat;
    return this;
  }

  @override
  Widget getWidget(BuildContext context) {
    if (elParams.p.type == EnumImgType.asset) {
      return Image.asset(
        elParams.p.src ?? spwmlParams.p.text,
        key: elParams.p.key,
        bundle: elParams.p.assetImgParams?.bundle,
        frameBuilder: elParams.p.frameBuilder,
        errorBuilder: elParams.p.errorBuilder,
        semanticLabel: elParams.p.semanticLabel,
        excludeFromSemantics: elParams.p.excludeFromSemantics,
        scale: elParams.p.scale,
        width: elParams.p.width,
        height: elParams.p.height,
        color: elParams.p.color,
        opacity: elParams.p.opacity,
        colorBlendMode: elParams.p.colorBlendMode,
        fit: elParams.p.fit,
        alignment: elParams.p.alignment,
        repeat: elParams.p.repeat,
        centerSlice: elParams.p.centerSlice,
        matchTextDirection: elParams.p.matchTextDirection,
        gaplessPlayback: elParams.p.gaplessPlayback,
        isAntiAlias: elParams.p.isAntiAlias,
        package: elParams.p.assetImgParams?.package,
        filterQuality: elParams.p.filterQuality,
        cacheWidth: elParams.p.cacheWidth,
        cacheHeight: elParams.p.cacheHeight,
      );
    } else {
      return Image.network(
        elParams.p.src ?? spwmlParams.p.text,
        key: elParams.p.key,
        frameBuilder: elParams.p.frameBuilder,
        errorBuilder: elParams.p.errorBuilder,
        semanticLabel: elParams.p.semanticLabel,
        excludeFromSemantics: elParams.p.excludeFromSemantics,
        scale: elParams.p.scale,
        width: elParams.p.width,
        height: elParams.p.height,
        color: elParams.p.color,
        opacity: elParams.p.opacity,
        colorBlendMode: elParams.p.colorBlendMode,
        fit: elParams.p.fit,
        alignment: elParams.p.alignment,
        repeat: elParams.p.repeat,
        centerSlice: elParams.p.centerSlice,
        matchTextDirection: elParams.p.matchTextDirection,
        gaplessPlayback: elParams.p.gaplessPlayback,
        isAntiAlias: elParams.p.isAntiAlias,
        filterQuality: elParams.p.filterQuality,
        cacheWidth: elParams.p.cacheWidth,
        cacheHeight: elParams.p.cacheHeight,
      );
    }
  }
}
