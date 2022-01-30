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
  text,
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  img,
  href,
  line,
  vline,
  subtitle1,
  subtitle2,
  body1,
  body2,
  caption,
  overline
}

extension EXTEnumSpWMLElementType on EnumSpWMLElementType {
  String toStr() {
    return toString().split('.').last;
  }

  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumSpWMLElementType fromStr(String s, int lineStart, int lineEnd) {
    if (s == EnumSpWMLElementType.col.toStr()) {
      return EnumSpWMLElementType.col;
    } else if (s == EnumSpWMLElementType.row.toStr()) {
      return EnumSpWMLElementType.row;
    } else if (s == EnumSpWMLElementType.block.toStr()) {
      return EnumSpWMLElementType.block;
    } else if (s == EnumSpWMLElementType.span.toStr()) {
      return EnumSpWMLElementType.span;
    } else if (s == EnumSpWMLElementType.stack.toStr()) {
      return EnumSpWMLElementType.stack;
    } else if (s == EnumSpWMLElementType.scroll.toStr()) {
      return EnumSpWMLElementType.scroll;
    } else if (s == EnumSpWMLElementType.text.toStr()) {
      return EnumSpWMLElementType.text;
    } else if (s == EnumSpWMLElementType.h1.toStr()) {
      return EnumSpWMLElementType.h1;
    } else if (s == EnumSpWMLElementType.h2.toStr()) {
      return EnumSpWMLElementType.h2;
    } else if (s == EnumSpWMLElementType.h3.toStr()) {
      return EnumSpWMLElementType.h3;
    } else if (s == EnumSpWMLElementType.h4.toStr()) {
      return EnumSpWMLElementType.h4;
    } else if (s == EnumSpWMLElementType.h5.toStr()) {
      return EnumSpWMLElementType.h5;
    } else if (s == EnumSpWMLElementType.h6.toStr()) {
      return EnumSpWMLElementType.h6;
    } else if (s == EnumSpWMLElementType.img.toStr()) {
      return EnumSpWMLElementType.img;
    } else if (s == EnumSpWMLElementType.href.toStr()) {
      return EnumSpWMLElementType.href;
    } else if (s == EnumSpWMLElementType.line.toStr()) {
      return EnumSpWMLElementType.line;
    } else if (s == EnumSpWMLElementType.vline.toStr()) {
      return EnumSpWMLElementType.vline;
    } else if (s == EnumSpWMLElementType.subtitle1.toStr()) {
      return EnumSpWMLElementType.subtitle1;
    } else if (s == EnumSpWMLElementType.subtitle2.toStr()) {
      return EnumSpWMLElementType.subtitle2;
    } else if (s == EnumSpWMLElementType.body1.toStr()) {
      return EnumSpWMLElementType.body1;
    } else if (s == EnumSpWMLElementType.body2.toStr()) {
      return EnumSpWMLElementType.body2;
    } else if (s == EnumSpWMLElementType.caption.toStr()) {
      return EnumSpWMLElementType.caption;
    } else if (s == EnumSpWMLElementType.overline.toStr()) {
      return EnumSpWMLElementType.overline;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd);
    }
  }
}
