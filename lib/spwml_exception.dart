///
/// (en)An exception class for SpWML.
/// Returns the type and line number of the exception that occurred.
/// (ja)SpWMLの例外クラスです。発生した例外の種類と行番号を返します。
///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-29 18:24:30
///
class SpWMLException implements Exception {
  final EnumSpWMLExceptionType type;
  final int lineStart;
  final int lineEnd;

  /// Constructor
  /// * [type] : Exception type.
  /// * [lineStart] : Exception occurred line start.
  /// * [lineEnd] : Exception occurred line end.
  SpWMLException(this.type, this.lineStart, this.lineEnd);

  @override
  String toString() =>
      "SpWMLException, Type:" +
      type.toStr() +
      ", Line:" +
      lineStart.toString() +
      "-" +
      lineEnd.toString() +
      ", " +
      type.toErrorText();
}

enum EnumSpWMLExceptionType {
  typeException,
  paramException,
  paramValueException,
  nullException,
  levelException,
  replaceException,
  syntaxException,
  elementException,
  tableParamException,
}

extension EXTEnumSpWMLExceptionType on EnumSpWMLExceptionType {
  String toStr() {
    return toString().split('.').last;
  }

  String toErrorText() {
    if (this == EnumSpWMLExceptionType.typeException) {
      return "It is an invalid type.";
    } else if (this == EnumSpWMLExceptionType.paramException) {
      return "The parameter length is invalid.";
    } else if (this == EnumSpWMLExceptionType.paramValueException) {
      return "It is an invalid parameter value.";
    } else if (this == EnumSpWMLExceptionType.nullException) {
      return "The target did not exist.";
    } else if (this == EnumSpWMLExceptionType.levelException) {
      return "The number of indent mark is invalid.";
    } else if (this == EnumSpWMLExceptionType.replaceException) {
      return "Only the child elements of the block element can be replaced.";
    } else if (this == EnumSpWMLExceptionType.syntaxException) {
      return 'Syntax Error.';
    } else if (this == EnumSpWMLExceptionType.elementException) {
      return 'The specified position contains an element that cannot be placed.';
    } else if (this == EnumSpWMLExceptionType.tableParamException) {
      return 'Please set hNum parameter.';
    } else {
      return "An unknown exception.";
    }
  }
}
