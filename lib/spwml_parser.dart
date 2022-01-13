import 'package:flutter/cupertino.dart';
import 'element/enum_spwml_element_type.dart';
import 'element/text_element.dart';
import 'spwml_exception.dart';
import 'element/spwml_element.dart';
import 'element/util_element.dart';
import 'element/spwml_font_style.dart';
import 'util_parser.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-29 18:13:38
///
class SpWMLParser {
  static const lower = "+";
  static const paramStart = "(";
  static const paramEnd = ")";
  static const separate = ":";
  static const paramSeparate = ",";
  static final RegExp indention = RegExp("\r\n|\n|\r");

  /// (en)Returns a list of the results of parsing SpWML.
  /// (ja)SpWMLをパースした結果のリストを返します。
  ///
  /// * [spWML] : SpWML text.
  /// * [spWMLStyle] : Font styles.
  ///
  /// Returns A list of parsed results that are not hierarchical.
  ///
  /// Throws [typeException] : If the type is incorrect.
  /// Throws [paramException] : If the param is incorrect.
  /// Throws [StructuralException] : If the structure is incorrect.
  static List<SpWMLElement> run(String spWML, SpWMLFontStyle spWMLStyle) {
    List<SpWMLElement> r = [];
    try {
      // (と)の対応が正しいかどうかのチェックテスト
      _paramHealthTest(spWML);
      // \(ではない(でエレメント単位に区切る。
      List<String> split1 = UtilParser.split(spWML, paramStart);
      int nextLevel = 0;
      int serial = 0;
      int lineStart = 0;
      int lineEnd = 1;
      // 基底のColのシリアルは-1。
      List<int> nowParentSerial = [-1];
      for (String i in split1) {
        // 現在の行を更新
        lineEnd += indention.allMatches(i).length;
        // 型、パラメータ、テキストを分離する
        List<String> split2 = UtilParser.split(i, paramEnd);
        if (split2.isEmpty) {
          throw SpWMLException(
              EnumSpWMLExceptionType.syntaxException, lineStart, lineEnd);
        } else if (split2.length == 1) {
          // 後続の処理のために配列長を調整。
          split2.add("");
        }
        // パラメータの方は全角、及び半角スペースを全て削除。
        List<String> param = UtilParser.split(split2[0], paramSeparate);
        final String type = param.removeAt(0);
        // パラメータ中のエスケープ文字を処理
        for (int j = 0; j < param.length; j++) {
          param[j] = UtilParser.adjustmentEscape(param[j]);
        }
        List<String> includes =
            UtilParser.split(split2[1], lower, targetCharacterAdd: true);
        String text = includes.isNotEmpty ? includes.removeAt(0) : "";
        text = UtilParser.adjustmentEscape(text);
        if (text == lower) {
          text = "";
          includes.add(lower);
        }
        text = _delLastIndention(text);
        // エレメントを生成して追加
        r.add(UtilElement.create(serial, type, param, text,
            nowParentSerial.last, lineStart, lineEnd, spWMLStyle));
        // 現在のタブ深度を更新
        final int preLevel = nextLevel;
        nextLevel = includes.length;
        if (nextLevel > preLevel) {
          if (nextLevel - preLevel > 1) {
            throw SpWMLException(
                EnumSpWMLExceptionType.levelException, lineStart, lineEnd);
          }
          nowParentSerial.add(serial);
        } else if (nextLevel < preLevel) {
          for (int j = 0; j < preLevel - nextLevel; j++) {
            if (nowParentSerial.isNotEmpty) {
              nowParentSerial.removeLast();
            }
          }
        }
        lineStart = lineEnd;
        serial += 1;
      }
    } catch (e) {
      debugPrint(e.toString());
      r.clear();
      r.add(TextElement(-1, EnumSpWMLElementType.text, const [], e.toString(),
          -1, 0, 0, spWMLStyle));
    }
    return r;
  }

  /// Parameter description health test.
  static void _paramHealthTest(String src) {
    bool isInParamStart = false;
    bool isInEscape = false;
    int indentCount = 1;
    if (src == paramStart) {
      throw SpWMLException(EnumSpWMLExceptionType.paramHealthException,
          indentCount, indentCount + 1);
    }
    for (String i in src.split("")) {
      // エスケープ文字
      if (i == UtilParser.escape) {
        if (isInEscape) {
          isInEscape = false;
        } else {
          isInEscape = true;
        }
      } else {
        // エスケープ文字以外の場合
        if (isInEscape) {
          // 前の文字がエスケープの場合は対象外
          isInEscape = false;
        } else {
          // エスケープでは無い場合
          if (indention.hasMatch(i)) {
            indentCount += 1;
          }
          if (i == paramStart) {
            if (isInParamStart) {
              throw SpWMLException(EnumSpWMLExceptionType.paramHealthException,
                  indentCount, indentCount + 1);
            } else {
              isInParamStart = true;
            }
          } else {
            if (isInParamStart) {
              if (i == paramEnd) {
                isInParamStart = false;
              }
            } else {
              if (i == paramEnd) {
                throw SpWMLException(
                    EnumSpWMLExceptionType.paramHealthException,
                    indentCount,
                    indentCount + 1);
              }
            }
          }
        }
      }
    }
  }

  static String _delLastIndention(String src) {
    if (src.isEmpty) {
      return src;
    }
    final int sLen = src.length;
    if (sLen == 1) {
      final String lastStr = src.substring(sLen - 1, sLen);
      if (indention.hasMatch(lastStr)) {
        // Other
        return src.substring(0, sLen - 1);
      } else {
        return src;
      }
    } else {
      final String lastStrWin = src.substring(sLen - 2, sLen);
      if (lastStrWin == "\r\n") {
        // Windows
        return src.substring(0, sLen - 2);
      } else {
        final String lastStr = src.substring(sLen - 1, sLen);
        if (indention.hasMatch(lastStr)) {
          // Other
          return src.substring(0, sLen - 1);
        } else {
          return src;
        }
      }
    }
  }
}
