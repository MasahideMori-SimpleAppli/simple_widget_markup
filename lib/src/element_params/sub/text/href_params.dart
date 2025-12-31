import 'package:simple_widget_markup/simple_widget_markup.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class HrefParamsWrapper {
  HrefParams p;

  /// * [p] : The parameter set.
  HrefParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class HrefParams {
  static const defUrlOpenErrorMsg = "The specified URL could not be opened.";
  String? alt;
  InkWellParams inkWellParams = InkWellParams();
  String urlOpenErrorMsg = defUrlOpenErrorMsg;
  Duration urlOpenErrorMsgDuration = const Duration(seconds: 3);
}
