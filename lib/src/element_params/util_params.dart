import 'package:flutter/material.dart';
import '../../simple_widget_markup.dart';

///
/// (en) A utility to convert parameters appropriately when parsing SpWML.
///
/// (ja) SpWMLをパースする時、パラメータを適切に変換するためのユーティリティ。
///
class UtilParams {
  /// escape code
  static const escape = "\\";

  /// ARGB or material parameter to Color
  /// * [color] : color code string.
  /// * [lineStart] : SpWML line start.
  /// * [lineEnd] : SpWML line end.
  /// * [info] : SPWML information.
  ///
  /// Throws [SpWMLException] : If the parameter value is incorrect,
  static Color? convertColor(
      String color, int lineStart, int lineEnd, SpWMLInfo? info) {
    if (color == "null" || color == "nil") {
      return null;
    }
    if (color.startsWith('#')) {
      String c = color.toUpperCase().replaceAll('#', '');
      if (c.length == 6) {
        c = 'FF$c';
      }
      return Color(
          int.tryParse(c, radix: 16) ?? int.parse("FFFFFFFF", radix: 16));
    } else {
      if (color.contains("Accent")) {
        // accent
        if (color.startsWith('redAccent')) {
          return Colors.redAccent[_getShade(color, true)]!;
        } else if (color.startsWith('pinkAccent')) {
          return Colors.pinkAccent[_getShade(color, true)]!;
        } else if (color.startsWith('purpleAccent')) {
          return Colors.purpleAccent[_getShade(color, true)]!;
        } else if (color.startsWith('deepPurpleAccent')) {
          return Colors.deepPurpleAccent[_getShade(color, true)]!;
        } else if (color.startsWith('indigoAccent')) {
          return Colors.indigoAccent[_getShade(color, true)]!;
        } else if (color.startsWith('blueAccent')) {
          return Colors.blueAccent[_getShade(color, true)]!;
        } else if (color.startsWith('lightBlueAccent')) {
          return Colors.lightBlueAccent[_getShade(color, true)]!;
        } else if (color.startsWith('cyanAccent')) {
          return Colors.cyanAccent[_getShade(color, true)]!;
        } else if (color.startsWith('tealAccent')) {
          return Colors.tealAccent[_getShade(color, true)]!;
        } else if (color.startsWith('greenAccent')) {
          return Colors.greenAccent[_getShade(color, true)]!;
        } else if (color.startsWith('lightGreenAccent')) {
          return Colors.lightGreenAccent[_getShade(color, true)]!;
        } else if (color.startsWith('limeAccent')) {
          return Colors.limeAccent[_getShade(color, true)]!;
        } else if (color.startsWith('yellowAccent')) {
          return Colors.yellowAccent[_getShade(color, true)]!;
        } else if (color.startsWith('amberAccent')) {
          return Colors.amberAccent[_getShade(color, true)]!;
        } else if (color.startsWith('orangeAccent')) {
          return Colors.orangeAccent[_getShade(color, true)]!;
        } else if (color.startsWith('deepOrangeAccent')) {
          return Colors.deepOrangeAccent[_getShade(color, true)]!;
        } else {
          throw SpWMLException(EnumSpWMLExceptionType.paramValueException,
              lineStart, lineEnd, info);
        }
      } else {
        // primary
        if (color.startsWith('red')) {
          return Colors.red[_getShade(color, false)]!;
        } else if (color.startsWith('pink')) {
          return Colors.pink[_getShade(color, false)]!;
        } else if (color.startsWith('purple')) {
          return Colors.purple[_getShade(color, false)]!;
        } else if (color.startsWith('deepPurple')) {
          return Colors.deepPurple[_getShade(color, false)]!;
        } else if (color.startsWith('indigo')) {
          return Colors.indigo[_getShade(color, false)]!;
        } else if (color.startsWith('blue')) {
          return Colors.blue[_getShade(color, false)]!;
        } else if (color.startsWith('lightBlue')) {
          return Colors.lightBlue[_getShade(color, false)]!;
        } else if (color.startsWith('cyan')) {
          return Colors.cyan[_getShade(color, false)]!;
        } else if (color.startsWith('teal')) {
          return Colors.teal[_getShade(color, false)]!;
        } else if (color.startsWith('green')) {
          return Colors.green[_getShade(color, false)]!;
        } else if (color.startsWith('lightGreen')) {
          return Colors.lightGreen[_getShade(color, false)]!;
        } else if (color.startsWith('lime')) {
          return Colors.lime[_getShade(color, false)]!;
        } else if (color.startsWith('yellow')) {
          return Colors.yellow[_getShade(color, false)]!;
        } else if (color.startsWith('amber')) {
          return Colors.amber[_getShade(color, false)]!;
        } else if (color.startsWith('orange')) {
          return Colors.orange[_getShade(color, false)]!;
        } else if (color.startsWith('deepOrange')) {
          return Colors.deepOrange[_getShade(color, false)]!;
        } else if (color.startsWith('brown')) {
          return Colors.brown[_getShade(color, false)]!;
        } else if (color.startsWith('grey')) {
          return Colors.grey[_getShade(color, false)]!;
        } else if (color.startsWith('blueGrey')) {
          return Colors.blueGrey[_getShade(color, false)]!;
        } else if (color.startsWith('gray')) {
          return Colors.grey[_getShade(color, false)]!;
        } else if (color.startsWith('blueGray')) {
          return Colors.blueGrey[_getShade(color, false)]!;
        } else if (color.startsWith('transparent')) {
          return Colors.transparent;
        } else if (color.startsWith('white')) {
          return _getWhiteVariation(color, lineStart, lineEnd, info);
        } else {
          return _getBlackVariation(color, lineStart, lineEnd, info);
        }
      }
    }
  }

  static Color _getWhiteVariation(
      String color, int lineStart, int lineEnd, SpWMLInfo? info) {
    if (color == 'white') {
      return Colors.white;
    } else if (color == 'white10') {
      return Colors.white10;
    } else if (color == 'white12') {
      return Colors.white12;
    } else if (color == 'white24') {
      return Colors.white24;
    } else if (color == 'white30') {
      return Colors.white30;
    } else if (color == 'white38') {
      return Colors.white38;
    } else if (color == 'white54') {
      return Colors.white54;
    } else if (color == 'white60') {
      return Colors.white60;
    } else if (color == 'white70') {
      return Colors.white70;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.paramValueException, lineStart, lineEnd, info);
    }
  }

  static Color _getBlackVariation(
      String color, int lineStart, int lineEnd, SpWMLInfo? info) {
    if (color == 'black') {
      return Colors.black;
    } else if (color == 'black12') {
      return Colors.black12;
    } else if (color == 'black26') {
      return Colors.black26;
    } else if (color == 'black38') {
      return Colors.black38;
    } else if (color == 'black45') {
      return Colors.black45;
    } else if (color == 'black54') {
      return Colors.black54;
    } else if (color == 'black87') {
      return Colors.black87;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.paramValueException, lineStart, lineEnd, info);
    }
  }

  static int _getShade(String color, bool isAccent) {
    if (color.contains("[")) {
      String shade = color.split('[')[1].replaceAll(']', '');
      return int.parse(shade);
    } else {
      if (isAccent) {
        return 200;
      } else {
        return 500;
      }
    }
  }

  ///
  /// * [s] : Alignment text.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [info] : SpWML info.
  ///
  /// Returns MainAxisAlignment.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  static MainAxisAlignment convertMainAxisAlign(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    if (s == "left" || s == "start") {
      // Row
      return MainAxisAlignment.start;
    } else if (s == "center") {
      // Row and Column
      return MainAxisAlignment.center;
    } else if (s == "right" || s == "end") {
      // Row
      return MainAxisAlignment.end;
    } else if (s == "top") {
      // Column
      return MainAxisAlignment.start;
    } else if (s == "bottom") {
      // Column
      return MainAxisAlignment.end;
    } else if (s == MainAxisAlignment.spaceAround.name) {
      return MainAxisAlignment.spaceAround;
    } else if (s == MainAxisAlignment.spaceEvenly.name) {
      return MainAxisAlignment.spaceEvenly;
    } else if (s == MainAxisAlignment.spaceBetween.name) {
      return MainAxisAlignment.spaceBetween;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.paramValueException, lineStart, lineEnd, info);
    }
  }

  ///
  /// * [s] : Alignment text.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [info] : SpWML info.
  ///
  /// Returns CrossAxisAlignment.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  static CrossAxisAlignment convertCrossAxisAlign(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    if (s == "left" || s == "start") {
      // Column
      return CrossAxisAlignment.start;
    } else if (s == "center") {
      // Row and Column
      return CrossAxisAlignment.center;
    } else if (s == "right" || s == "end") {
      // Column
      return CrossAxisAlignment.end;
    } else if (s == "top") {
      // Row
      return CrossAxisAlignment.start;
    } else if (s == "bottom") {
      // Row
      return CrossAxisAlignment.end;
    } else if (s == CrossAxisAlignment.baseline.name) {
      // Row
      return CrossAxisAlignment.baseline;
    } else if (s == CrossAxisAlignment.stretch.name) {
      // Row
      return CrossAxisAlignment.stretch;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.paramValueException, lineStart, lineEnd, info);
    }
  }

  ///
  /// * [s] : Alignment text.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [info] : SpWML info.
  ///
  /// Returns WrapAlignment.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  static WrapAlignment convertWrapAlign(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    if (s == "left" || s == "start") {
      return WrapAlignment.start;
    } else if (s == "center") {
      return WrapAlignment.center;
    } else if (s == "right" || s == "end") {
      return WrapAlignment.end;
    } else if (s == "top") {
      return WrapAlignment.start;
    } else if (s == "bottom") {
      return WrapAlignment.end;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.paramValueException, lineStart, lineEnd, info);
    }
  }
}
