import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../../simple_widget_markup.dart';

///
/// (en) The img.
///
/// (ja) imgの実装。
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

  /// Get this class name.
  @override
  String getClassName() {
    return "ImgElement";
  }

  /// Initialize the parameters.
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
    elParams.p.clipParams.clipType =
        params.containsKey(EnumSpWMLParams.clipType)
            ? params[EnumSpWMLParams.clipType]!
            : EnumClipType.none;
    elParams.p.clipParams.borderRadius =
        params.containsKey(EnumSpWMLParams.clipRadius)
            ? params[EnumSpWMLParams.clipRadius]!
            : BorderRadius.circular(8.0);
    return this;
  }

  /// Widget clipping if needed.
  ///
  /// * [w]: wrap target widget.
  Widget _clipping(Widget w) {
    if (elParams.p.clipParams.clipType == EnumClipType.none) {
      return w;
    } else if (elParams.p.clipParams.clipType == EnumClipType.oval) {
      return ClipOval(
          key: elParams.p.clipParams.key,
          clipper: elParams.p.clipParams.clipper,
          clipBehavior: elParams.p.clipParams.clipBehavior,
          child: w);
    } else {
      return ClipRRect(
          key: elParams.p.clipParams.key,
          borderRadius: elParams.p.clipParams.borderRadius,
          clipper: elParams.p.clipParams.clipperRRect,
          clipBehavior: elParams.p.clipParams.clipBehavior,
          child: w);
    }
  }

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    if (elParams.p.type == EnumImgType.asset) {
      return _clipping(Image.asset(
        elParams.p.src ?? spwmlParams.p.text,
        key: elParams.p.key,
        scale: elParams.p.scale,
        bundle: elParams.p.assetImgParams?.bundle,
        frameBuilder: elParams.p.frameBuilder,
        errorBuilder: elParams.p.errorBuilder,
        semanticLabel: elParams.p.semanticLabel,
        excludeFromSemantics: elParams.p.excludeFromSemantics,
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
      ));
    } else if (elParams.p.type == EnumImgType.memory &&
        elParams.p.bytes != null) {
      return _clipping(Image.memory(
        elParams.p.bytes!,
        key: elParams.p.key,
        scale: elParams.p.scale,
        frameBuilder: elParams.p.frameBuilder,
        errorBuilder: elParams.p.errorBuilder,
        semanticLabel: elParams.p.semanticLabel,
        excludeFromSemantics: elParams.p.excludeFromSemantics,
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
      ));
    } else {
      return _clipping(Image.network(
        elParams.p.src ?? spwmlParams.p.text,
        key: elParams.p.key,
        scale: elParams.p.scale,
        frameBuilder: elParams.p.frameBuilder,
        errorBuilder: elParams.p.errorBuilder,
        semanticLabel: elParams.p.semanticLabel,
        excludeFromSemantics: elParams.p.excludeFromSemantics,
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
      ));
    }
  }

  /// (en)Set bytes image.
  ///
  /// (ja)バイトイメージを設定します。
  /// * [image] The bytes image data.
  void setBytesImage(Uint8List image) {
    elParams.p.bytes = image;
  }
}
