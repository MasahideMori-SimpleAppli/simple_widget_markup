import '../element_params/spwml_info.dart';
import '../spwml_exception.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-30 14:40:09
///
enum EnumSpWMLElementType {
  col,
  row,
  block,
  span,
  stack,
  scroll,
  wrap,
  expTile,
  dropdownBtn,
  popupMenuBtn,
  circleAvatar,
  badge,
  // common
  text,
  menu,
  href,
  ruby,
  textField,
  // v2
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  subtitle1,
  subtitle2,
  body1,
  body2,
  caption,
  overline,
  // v3
  displayL,
  displayM,
  displayS,
  headlineL,
  headlineM,
  headlineS,
  titleL,
  titleM,
  titleS,
  labelL,
  labelM,
  labelS,
  bodyL,
  bodyM,
  bodyS,
  //
  img,
  line,
  vline,
  btn,
  switchBtn,
  icon,
  card,
  checkbox,
  radioBtn,
  segmentedBtn,
  table,
  tableRow,
  progressIndicator,
  slider,
  // super and subscript.
  superscript,
  subscript,
}

/// 重複を避けて高速化するために、短縮系だけをまとめたもの。
enum _EnumSpWMLElementTypeShort {
  tf,
  tr,
}

extension EXTEnumSpWMLElementType on EnumSpWMLElementType {
  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumSpWMLElementType fromStr(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    // 短縮系だけ先にチェック。後は自動チェック。
    if (s == _EnumSpWMLElementTypeShort.tf.name) {
      return EnumSpWMLElementType.textField;
    } else if (s == _EnumSpWMLElementTypeShort.tr.name) {
      return EnumSpWMLElementType.tableRow;
    } else {
      // 短縮系以外の変換。
      try {
        return EnumSpWMLElementType.values.byName(s);
      } catch (e) {
        throw SpWMLException(
            EnumSpWMLExceptionType.typeException, lineStart, lineEnd, info);
      }
    }
  }
}
