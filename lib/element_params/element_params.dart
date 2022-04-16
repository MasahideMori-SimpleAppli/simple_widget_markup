import 'dart:core';
import 'package:flutter/material.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-01-30 20:19:25

class ElementParams {
  String s;

  ElementParams(this.s);
}

class WidgetParams {
  Widget? w;

  WidgetParams(this.w);
}

class ScrollElementParams {
  ScrollController? ctrl;
}

class BtnElementParams {
  void Function()? f;
  ButtonStyle? btnStyle;

  /// Must initialize empty function.
  BtnElementParams(this.f, {this.btnStyle});
}

class ShowMenuBtnElementParams {
  List<void Function()?> menuCallbacks;
  ButtonStyle? btnStyle;

  /// Must initialize empty function.
  ShowMenuBtnElementParams(this.menuCallbacks, {this.btnStyle});
}

class BoolCallbackParams {
  void Function(bool b)? f;

  /// Must initialize empty function.
  BoolCallbackParams(this.f);
}
