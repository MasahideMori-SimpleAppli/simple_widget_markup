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
  // common
  text,
  menu,
  href,
  ruby,
  textField,
  tf,
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
  table,
  tableRow,
  tr,
  progressIndicator,
  // super and subscript.
  superscript,
  subscript
}

extension EXTEnumSpWMLElementType on EnumSpWMLElementType {
  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumSpWMLElementType fromStr(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    if (s == EnumSpWMLElementType.col.name) {
      return EnumSpWMLElementType.col;
    } else if (s == EnumSpWMLElementType.row.name) {
      return EnumSpWMLElementType.row;
    } else if (s == EnumSpWMLElementType.block.name) {
      return EnumSpWMLElementType.block;
    } else if (s == EnumSpWMLElementType.span.name) {
      return EnumSpWMLElementType.span;
    } else if (s == EnumSpWMLElementType.stack.name) {
      return EnumSpWMLElementType.stack;
    } else if (s == EnumSpWMLElementType.scroll.name) {
      return EnumSpWMLElementType.scroll;
    } else if (s == EnumSpWMLElementType.wrap.name) {
      return EnumSpWMLElementType.wrap;
    } else if (s == EnumSpWMLElementType.expTile.name) {
      return EnumSpWMLElementType.expTile;
    } else if (s == EnumSpWMLElementType.dropdownBtn.name) {
      return EnumSpWMLElementType.dropdownBtn;
    } else if (s == EnumSpWMLElementType.popupMenuBtn.name) {
      return EnumSpWMLElementType.popupMenuBtn;
    }
    // common
    else if (s == EnumSpWMLElementType.text.name) {
      return EnumSpWMLElementType.text;
    } else if (s == EnumSpWMLElementType.menu.name) {
      return EnumSpWMLElementType.menu;
    } else if (s == EnumSpWMLElementType.ruby.name) {
      return EnumSpWMLElementType.ruby;
    } else if (s == EnumSpWMLElementType.textField.name) {
      return EnumSpWMLElementType.textField;
    } else if (s == EnumSpWMLElementType.tf.name) {
      return EnumSpWMLElementType.textField;
    }
    // v2
    else if (s == EnumSpWMLElementType.h1.name) {
      return EnumSpWMLElementType.h1;
    } else if (s == EnumSpWMLElementType.h2.name) {
      return EnumSpWMLElementType.h2;
    } else if (s == EnumSpWMLElementType.h3.name) {
      return EnumSpWMLElementType.h3;
    } else if (s == EnumSpWMLElementType.h4.name) {
      return EnumSpWMLElementType.h4;
    } else if (s == EnumSpWMLElementType.h5.name) {
      return EnumSpWMLElementType.h5;
    } else if (s == EnumSpWMLElementType.h6.name) {
      return EnumSpWMLElementType.h6;
    } else if (s == EnumSpWMLElementType.subtitle1.name) {
      return EnumSpWMLElementType.subtitle1;
    } else if (s == EnumSpWMLElementType.subtitle2.name) {
      return EnumSpWMLElementType.subtitle2;
    } else if (s == EnumSpWMLElementType.body1.name) {
      return EnumSpWMLElementType.body1;
    } else if (s == EnumSpWMLElementType.body2.name) {
      return EnumSpWMLElementType.body2;
    } else if (s == EnumSpWMLElementType.caption.name) {
      return EnumSpWMLElementType.caption;
    } else if (s == EnumSpWMLElementType.overline.name) {
      return EnumSpWMLElementType.overline;
    }
    // v3
    else if (s == EnumSpWMLElementType.displayL.name) {
      return EnumSpWMLElementType.displayL;
    } else if (s == EnumSpWMLElementType.displayM.name) {
      return EnumSpWMLElementType.displayM;
    } else if (s == EnumSpWMLElementType.displayS.name) {
      return EnumSpWMLElementType.displayS;
    } else if (s == EnumSpWMLElementType.headlineL.name) {
      return EnumSpWMLElementType.headlineL;
    } else if (s == EnumSpWMLElementType.headlineM.name) {
      return EnumSpWMLElementType.headlineM;
    } else if (s == EnumSpWMLElementType.headlineS.name) {
      return EnumSpWMLElementType.headlineS;
    } else if (s == EnumSpWMLElementType.titleL.name) {
      return EnumSpWMLElementType.titleL;
    } else if (s == EnumSpWMLElementType.titleM.name) {
      return EnumSpWMLElementType.titleM;
    } else if (s == EnumSpWMLElementType.titleS.name) {
      return EnumSpWMLElementType.titleS;
    } else if (s == EnumSpWMLElementType.labelL.name) {
      return EnumSpWMLElementType.labelL;
    } else if (s == EnumSpWMLElementType.labelM.name) {
      return EnumSpWMLElementType.labelM;
    } else if (s == EnumSpWMLElementType.labelS.name) {
      return EnumSpWMLElementType.labelS;
    } else if (s == EnumSpWMLElementType.bodyL.name) {
      return EnumSpWMLElementType.bodyL;
    } else if (s == EnumSpWMLElementType.bodyM.name) {
      return EnumSpWMLElementType.bodyM;
    } else if (s == EnumSpWMLElementType.bodyS.name) {
      return EnumSpWMLElementType.bodyS;
    }
    //
    else if (s == EnumSpWMLElementType.img.name) {
      return EnumSpWMLElementType.img;
    } else if (s == EnumSpWMLElementType.href.name) {
      return EnumSpWMLElementType.href;
    } else if (s == EnumSpWMLElementType.line.name) {
      return EnumSpWMLElementType.line;
    } else if (s == EnumSpWMLElementType.vline.name) {
      return EnumSpWMLElementType.vline;
    } else if (s == EnumSpWMLElementType.btn.name) {
      return EnumSpWMLElementType.btn;
    } else if (s == EnumSpWMLElementType.switchBtn.name) {
      return EnumSpWMLElementType.switchBtn;
    } else if (s == EnumSpWMLElementType.icon.name) {
      return EnumSpWMLElementType.icon;
    } else if (s == EnumSpWMLElementType.card.name) {
      return EnumSpWMLElementType.card;
    } else if (s == EnumSpWMLElementType.checkbox.name) {
      return EnumSpWMLElementType.checkbox;
    } else if (s == EnumSpWMLElementType.radioBtn.name) {
      return EnumSpWMLElementType.radioBtn;
    } else if (s == EnumSpWMLElementType.table.name) {
      return EnumSpWMLElementType.table;
    } else if (s == EnumSpWMLElementType.tableRow.name) {
      return EnumSpWMLElementType.tableRow;
    } else if (s == EnumSpWMLElementType.tr.name) {
      return EnumSpWMLElementType.tableRow;
    } else if (s == EnumSpWMLElementType.progressIndicator.name) {
      return EnumSpWMLElementType.progressIndicator;
    }
    // super and subscript
    else if (s == EnumSpWMLElementType.superscript.name) {
      return EnumSpWMLElementType.superscript;
    } else if (s == EnumSpWMLElementType.subscript.name) {
      return EnumSpWMLElementType.subscript;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd, info);
    }
  }
}
