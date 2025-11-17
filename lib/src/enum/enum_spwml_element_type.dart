import '../element_params/spwml_info.dart';
import '../spwml_exception.dart';

///
/// (en) SpWML element type definition.
///
/// (ja) SpWMLのエレメントタイプの定義です。
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
  tooltip,
  split,
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
  colorPalette,
  // super and subscript.
  superscript,
  subscript,
  // flavors
  dropdownBtn2,
  popupMenuBtn2,
  checkbox2,
  radioBtn2,
  segmentedBtn2,
}

/// 重複を避けて高速化するために、短縮系だけをまとめたもの。
enum _EnumSpWMLElementTypeShort { tf, tr }

/// EnumSpWMLElementType extension.
extension EXTEnumSpWMLElementType on EnumSpWMLElementType {
  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumSpWMLElementType fromStr(
    String s,
    int lineStart,
    int lineEnd,
    SpWMLInfo? info,
  ) {
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
          EnumSpWMLExceptionType.typeException,
          lineStart,
          lineEnd,
          info,
        );
      }
    }
  }
}
