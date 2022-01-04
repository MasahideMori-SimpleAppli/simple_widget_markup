import 'package:flutter/material.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-29 18:13:38
///
class UtilParser {
  static const escape = "\\";

  /// ARGB to Color
  static Color convertColor(String argbStr) {
    String c = argbStr.toUpperCase().replaceAll('#', '');
    if (c.length == 6) {
      c = 'FF' + c;
    }
    return Color(
        int.tryParse(c, radix: 16) ?? int.parse("FFFFFFFF", radix: 16));
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
  /// * [targetCharacter] : The length must be 1.
  /// * [targetCharacterAdd] : If true, Add target character to return list.
  static List<String> split(String src, String targetCharacter,
      {bool targetCharacterAdd = false}) {
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
          if (i == targetCharacter) {
            // 対象がターゲット文字列
            if (buf.isNotEmpty) {
              r.add(buf);
            }
            if (targetCharacterAdd) {
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
