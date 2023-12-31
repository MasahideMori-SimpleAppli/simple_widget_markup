import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../simple_widget_markup.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class ImgParamsWrapper {
  ImgParams p;

  /// * [p] : The parameter set.
  ImgParamsWrapper(this.p);
}

///
/// (en) Parameter class used in ImgParams.
///
/// (ja) ImgParamsで利用するパラメータのクラス。
///
class AssetImageParams {
  AssetBundle? bundle;
  double? scale;
  String? package;
}

///
/// (en) Parameter class used in ImgParams.
///
/// (ja) ImgParamsで利用するパラメータのクラス。
///
class ClipParams {
  Key? key;
  EnumClipType clipType = EnumClipType.none;
  CustomClipper<Rect>? clipper;
  Clip clipBehavior = Clip.antiAlias;

  // for ClipRRect
  BorderRadiusGeometry borderRadius = BorderRadius.circular(8.0);
  CustomClipper<RRect>? clipperRRect;
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class ImgParams {
  EnumImgType type = EnumImgType.network;
  String? src;
  // for memory type
  Uint8List? bytes;
  Key? key;
  double scale = 1.0;
  Widget Function(BuildContext, Widget, int?, bool)? frameBuilder;
  Widget Function(BuildContext, Widget, ImageChunkEvent?)? loadingBuilder;
  Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;
  String? semanticLabel;
  bool excludeFromSemantics = false;
  double? width;
  double? height;
  Color? color;
  Animation<double>? opacity;
  BlendMode? colorBlendMode;
  BoxFit? fit;
  AlignmentGeometry alignment = Alignment.center;
  ImageRepeat repeat = ImageRepeat.noRepeat;
  Rect? centerSlice;
  bool matchTextDirection = false;
  bool gaplessPlayback = false;
  FilterQuality filterQuality = FilterQuality.low;
  bool isAntiAlias = false;
  Map? headers;
  int? cacheWidth;
  int? cacheHeight;

  // Asset image additional parameter.
  AssetImageParams? assetImgParams;

  // Clipping option
  ClipParams clipParams = ClipParams();
}
