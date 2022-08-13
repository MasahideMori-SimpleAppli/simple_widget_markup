import 'package:flutter/material.dart';
import 'element/super/spwml_element.dart';
import 'element_params/sub/text/text_params.dart';
import 'element_params/super/spwml_params.dart';
import 'enum/enum_spwml_element_type.dart';
import 'element/sub/text/text_element.dart';
import 'element/util_element.dart';
import 'style/spwml_font_style.dart';
import 'package:simple_block_markup_language/simple_block_markup_language.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-29 18:13:38
///
class SpWMLParser {
  /// (en)Returns a list of the results of parsing SpWML.
  /// (ja)SpWMLをパースした結果のリストを返します。
  ///
  /// * [spWML] : SpWML text.
  /// * [spWMLStyle] : Font styles.
  ///
  /// Returns A list of parsed results that are not hierarchical.
  ///
  /// Throws [SpWMLException] : Throw If the type is incorrect or the param is incorrect or the structure is incorrect.
  static List<SpWMLElement> run(String spWML, SpWMLFontStyle spWMLStyle) {
    List<SpWMLElement> r = [];
    try {
      // 一旦汎用のSBMLに変換。
      List<SBMLBlock> blocks = SBMLParser.run(spWML);
      for (SBMLBlock i in blocks) {
        // エレメントを生成して追加
        r.add(UtilElement.create(i.serial, i.type, i.params, i.content,
            i.parentSerial, i.lineStart!, i.lineEnd!, spWMLStyle));
      }
    } catch (e) {
      debugPrint(e.toString());
      r.clear();
      r.add(TextElement(
              -1,
              EnumSpWMLElementType.text,
              const {},
              SpWMLParamsWrapper(SpWMLParams(e.toString())),
              -1,
              0,
              0,
              spWMLStyle,
              TextParamsWrapper(TextParams()))
          .initParams());
    }
    return r;
  }
}
