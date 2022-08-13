import '../button/btn_params.dart';

class HrefParamsWrapper {
  HrefParams p;

  /// * [p] : The parameter set.
  HrefParamsWrapper(this.p);
}

class HrefParams {
  String? alt;
  InkWellParams inkWellParams = InkWellParams();
}
