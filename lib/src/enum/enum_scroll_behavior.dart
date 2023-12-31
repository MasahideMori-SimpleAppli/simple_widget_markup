import 'dart:ui';

import 'package:flutter/material.dart';

import '../../simple_widget_markup.dart';

///
/// (en) ScrollBehavior definition.
///
/// (ja) ScrollBehaviorの定義です。
///
enum EnumScrollBehavior {
  touch,
  touchAndMouse,
  touchAndMouseAndTrackpad,
  nonEraser,
  all
}

/// EnumScrollBehavior extension.
extension EXTEnumScrollBehavior on EnumScrollBehavior {
  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static ScrollBehavior toObjFromStr(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    if (s == EnumScrollBehavior.touch.name) {
      return const MaterialScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.touch,
      });
    } else if (s == EnumScrollBehavior.touchAndMouse.name) {
      return const MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse});
    } else if (s == EnumScrollBehavior.touchAndMouseAndTrackpad.name) {
      return const MaterialScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad
      });
    } else if (s == EnumScrollBehavior.nonEraser.name) {
      return const MaterialScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.stylus
      });
    } else if (s == EnumScrollBehavior.all.name) {
      return const MaterialScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.stylus,
        PointerDeviceKind.invertedStylus
      });
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd, info);
    }
  }
}
