import 'dart:convert';

import 'package:simple_widget_markup/sbml_exception.dart';

///
/// Block of Simple Block Markup Language.
///
/// Author Masahide Mori
///
/// First edition creation date 2022-7-10 12:57:46
///
class SBMLBlock {
  final int serial;
  final int parentSerial;
  final int nestLevel;
  final int lineStart;
  final String type;
  final Map<String, String> params;
  String content;

  // lineEndは計算途中で確定する。
  int? lineEnd;

  SBMLBlock(this.serial, this.parentSerial, this.nestLevel, this.lineStart,
      this.type, this.params, this.content);
}

///
///
/// Author Masahide Mori
///
/// First edition creation date 2022-7-10 13:25:00
///
class SBMLParser {
  static const _paramStart = "(";
  static const _paramEnd = ")";
  static const _separate = ":";
  static const _paramSeparate = ",";
  static const _indentionCode = "\n";
  static const _commentCode = "//";
  static const _escapeCode = "\\";

  // プラス記号以外でネストしたい場合はここの変更が必要。
  static final RegExp _paramStartRE = RegExp(r'^\+*\(.*$');

  /// (en)Returns a list of the results of parsing SBML.
  /// (ja)SBMLをパースした結果のリストを返します。
  ///
  /// * [src] : SBML text.
  ///
  /// Returns A list of parsed results.
  ///
  /// Throws [SBMLException] : If the structure is incorrect.
  static List<SBMLBlock> run(String src) {
    // 改行単位で区切り、コメント行を除去してエレメント行を汎用クラスで返す。
    List<String> splited = const LineSplitter().convert(src);
    List<SBMLBlock> r = [];
    int nowLine = 0;
    int serial = 0;
    // 基底のColのシリアルは-1。
    List<int> nowParentSerial = [-1];
    for (String line in splited) {
      nowLine += 1;
      if (line.startsWith(_commentCode)) {
        continue;
      }
      if (line.startsWith(_paramStartRE)) {
        // 前のブロックの終了位置が確定
        if (r.isNotEmpty) {
          r.last.lineEnd = nowLine;
        }
        // パラメータを取得。
        final List<String> prePreParams =
            _split(line, _paramStart, targetCharAdd: true);
        // ネストレベルの操作
        final bool isNested = prePreParams[0] != _paramStart;
        int nowNestLevel = 0;
        if (isNested) {
          nowNestLevel = prePreParams[0].length;
        }
        final int preNestLevel = r.isNotEmpty ? r.last.nestLevel : 0;
        if (nowNestLevel > preNestLevel) {
          if (nowNestLevel - preNestLevel > 1) {
            throw SBMLException(EnumSBMLExceptionType.levelException, nowLine);
          }
          // ネストレベルが今回から深くなっているならば、前回の要素が親。
          nowParentSerial.add(r.last.serial);
        } else if (nowNestLevel < preNestLevel) {
          // ネストレベルが今回から浅くなっているならば、ネスト位置を適切な階層まで移動。
          for (int j = 0; j < preNestLevel - nowNestLevel; j++) {
            if (nowParentSerial.isNotEmpty) {
              nowParentSerial.removeLast();
            }
          }
        }
        // パラメータの抽出
        String preParams = isNested ? prePreParams[2] : prePreParams[1];
        List<String> paramsAndContent =
            _split(preParams, _paramEnd, targetCharAdd: true);
        if (paramsAndContent.length == 2) {
          // 長さ2の場合は空のコンテンツ配列を追加する。
          paramsAndContent.add("");
        } else if (paramsAndContent.length < 2) {
          throw SBMLException(EnumSBMLExceptionType.syntaxException, nowLine);
        }
        String? type;
        Map<String, String> params = {};
        bool isFirstParam = true;
        for (String p
            in _split(paramsAndContent[0], _paramSeparate, isSplitOne: false)) {
          // エスケープされていない半角、および全角スペースを除去。
          p = _replaceAll(p, " ", "");
          p = _replaceAll(p, "　", "");
          //　エスケープのエスケープを元に戻す。
          p = _adjustmentEscape(p);
          if (p == "") {
            throw SBMLException(EnumSBMLExceptionType.syntaxException, nowLine);
          }
          if (isFirstParam) {
            type = p;
            isFirstParam = false;
          } else {
            List<String> keyValue = _split(p, _separate);
            if (keyValue.length < 2) {
              throw SBMLException(
                  EnumSBMLExceptionType.syntaxException, nowLine);
            } else {
              params[keyValue[0]] = keyValue[1];
            }
          }
        }
        if (type == null) {
          throw SBMLException(EnumSBMLExceptionType.typeNullException, nowLine);
        }
        // ブロック要素が確定するので要素を生成
        r.add(SBMLBlock(serial, nowParentSerial.last, nowNestLevel, nowLine,
            type, params, paramsAndContent[2]));
        serial += 1;
      } else {
        if (r.isNotEmpty) {
          // コンテンツ文字列の行
          r.last.content += (_indentionCode + line);
        }
      }
    }
    // 最後が1行で終わる場合はlineEndをlineStartと合わせる。
    if (r.isNotEmpty) {
      r.last.lineEnd ??= r.last.lineStart;
    }
    return r;
  }

  /// Escape-enabled split. Target character is always contain in return list.
  /// * [targetChar] : The length must be 1.
  /// * [targetCharAdd] : If true, Add target character to return list.
  /// * [isSplitOne] : If true, split only once.
  static List<String> _split(String src, String targetChar,
      {bool targetCharAdd = false, bool isSplitOne = true}) {
    List<String> r = [];
    String buf = "";
    bool isInEscape = false;
    bool splitCompleted = false;
    for (String i in src.split("")) {
      if (splitCompleted) {
        buf += i;
        continue;
      }
      // エスケープ文字
      if (i == _escapeCode) {
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
            if (isSplitOne) {
              splitCompleted = true;
            }
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

  /// Escape-enabled replaceAll.
  /// * [targetChar] : The length must be 1.
  /// * [replaced] : The replaced character.
  static String _replaceAll(String src, String targetChar, String replaced) {
    List<String> r = [];
    String buf = "";
    bool isInEscape = false;
    for (String i in src.split("")) {
      // エスケープ文字
      if (i == _escapeCode) {
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
            r.add(replaced);
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
    return r.join("");
  }

  /// Escaped escape convert to escape character,
  /// and delete non escaped escape.
  static String _adjustmentEscape(String src) {
    String r = "";
    bool isInEscape = false;
    for (String i in src.split("")) {
      // エスケープ文字
      if (i == _escapeCode) {
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
