///
/// (en)An exception class for SBML.
/// Returns the type and line number of the exception that occurred.
/// (ja)SBMLの例外クラスです。発生した例外の種類と行番号を返します。
///
/// Author Masahide Mori
///
/// First edition creation date 2022-07-10 15:03:19
///
class SBMLException implements Exception {
  final EnumSBMLExceptionType type;
  final int nowLine;

  /// Constructor
  /// * [type] : Exception type.
  /// * [nowLine] : Exception occurred line.
  SBMLException(this.type, this.nowLine);

  @override
  String toString() =>
      "SBMLException, Type:" +
      type.toStr() +
      ", Line:" +
      nowLine.toString() +
      ", " +
      type.toErrorText();
}

enum EnumSBMLExceptionType {
  typeNullException,
  levelException,
  syntaxException,
  paramHealthException,
}

extension EXTEnumSBMLExceptionType on EnumSBMLExceptionType {
  String toStr() {
    return toString().split('.').last;
  }

  String toErrorText() {
    if (this == EnumSBMLExceptionType.typeNullException) {
      return "There is no type.";
    } else if (this == EnumSBMLExceptionType.levelException) {
      return "The number of indent mark is invalid.";
    } else if (this == EnumSBMLExceptionType.syntaxException) {
      return 'Syntax Error.';
    } else if (this == EnumSBMLExceptionType.paramHealthException) {
      return 'The correspondence between the "(" symbol and ")" symbol is incorrect.';
    } else {
      return "An unknown exception.";
    }
  }
}
