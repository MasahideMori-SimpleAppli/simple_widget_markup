import '../button/btn_params.dart';

class HrefParamsWrapper {
  HrefParams p;

  /// * [p] : The parameter set.
  HrefParamsWrapper(this.p);
}

class HrefParams {
  static const defUrlOpenErrorMsg = "The specified URL could not be opened.";
  String? alt;
  InkWellParams inkWellParams = InkWellParams();
  String urlOpenErrorMsg = defUrlOpenErrorMsg;
  Duration urlOpenErrorMsgDuration = const Duration(seconds: 3);
}
