import 'package:flutter/material.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-29 18:13:38
///
class UtilParser {
  static const escape = "\\";

  /// ARGB or material parameter to Color
  static Color convertColor(String color) {
    if (color.startsWith('#')) {
      String c = color.toUpperCase().replaceAll('#', '');
      if (c.length == 6) {
        c = 'FF' + c;
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
          throw Exception();
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
        } else if (color.startsWith('transparent')) {
          return Colors.transparent;
        } else if (color.startsWith('white')) {
          return _getWhiteVariation(color);
        } else {
          return _getBlackVariation(color);
        }
      }
    }
  }

  static Color _getWhiteVariation(String color) {
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
      throw Exception();
    }
  }

  static Color _getBlackVariation(String color) {
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
      throw Exception();
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

  /// Escape-enabled delete.
  /// * [targetCharacter] : The length must be 1.
  static String delete(String src, String targetCharacter) {
    String r = "";
    bool isInEscape = false;
    for (String i in src.split("")) {
      // エスケープ文字
      if (i == escape) {
        if (isInEscape) {
          isInEscape = false;
        } else {
          isInEscape = true;
        }
        r += i;
      } else {
        // エスケープ文字以外の場合
        if (isInEscape) {
          // 前の文字がエスケープの場合はターゲットは削除対象外
          r += i;
          isInEscape = false;
        } else {
          // エスケープでは無い場合
          if (i == targetCharacter) {
            // 対象がターゲット文字列なら追加しない。
            continue;
          } else {
            r += i;
          }
        }
      }
    }
    return r;
  }

  /// Escape-enabled count.
  /// return non escape target count.
  /// * [targetCharacter] : The length must be 1.
  static int count(String src, String targetCharacter) {
    int r = 0;
    bool isInEscape = false;
    for (String i in src.split("")) {
      // エスケープ文字
      if (i == escape) {
        if (isInEscape) {
          isInEscape = false;
        } else {
          isInEscape = true;
        }
      } else {
        // エスケープ文字以外の場合
        if (isInEscape) {
          // 前の文字がエスケープの場合はカウント対象外
          isInEscape = false;
        } else {
          // エスケープでは無い場合
          if (i == targetCharacter) {
            r += 1;
          }
        }
      }
    }
    return r;
  }

  /// Escape-enabled split.
  /// * [targetChar] : The length must be 1.
  /// * [targetCharAdd] : If true, Add target character to return list.
  static List<String> split(String src, String targetChar,
      {bool targetCharAdd = false}) {
    List<String> r = [];
    String buf = "";
    bool isInEscape = false;
    for (String i in src.split("")) {
      // エスケープ文字
      if (i == escape) {
        if (isInEscape) {
          isInEscape = false;
        } else {
          isInEscape = true;
        }
        buf += i;
      } else {
        // エスケープ文字以外の場合
        if (isInEscape) {
          // 前の文字がエスケープの場合はターゲットは分割対象外。
          buf += i;
          isInEscape = false;
        } else {
          // エスケープ中では無い場合
          if (i == targetChar) {
            // 対象がターゲット文字列
            if (buf.isNotEmpty) {
              r.add(buf);
            }
            if (targetCharAdd) {
              r.add(i);
            }
            buf = "";
          } else {
            buf += i;
          }
        }
      }
    }
    if (buf.isNotEmpty) {
      r.add(buf);
    }
    return r;
  }

  /// Escaped escape convert to escape character,
  /// and delete non escaped escape.
  static String adjustmentEscape(String src) {
    String r = "";
    bool isInEscape = false;
    for (String i in src.split("")) {
      // エスケープ文字
      if (i == escape) {
        if (isInEscape) {
          isInEscape = false;
          r += i;
        } else {
          isInEscape = true;
        }
      } else {
        // エスケープ文字以外の場合
        isInEscape = false;
        r += i;
      }
    }
    return r;
  }
}
