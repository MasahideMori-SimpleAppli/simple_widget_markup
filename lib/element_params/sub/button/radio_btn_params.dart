import 'checkbox_params.dart';

class RadioBtnParamsWrapper {
  RadioBtnParams p;

  /// * [p] : The parameter set.
  RadioBtnParamsWrapper(this.p);
}

class RadioBtnParams {
  SelectableIconBtnParams? enableParams;
  SelectableIconBtnParams? disableParams;
  int? selectedIndex;
  void Function(int? selectedIndex)? callback = (int? i) {};
}
