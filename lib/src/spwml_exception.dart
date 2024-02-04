import 'element_params/spwml_info.dart';

///
/// (en)An exception class for SpWML.
/// Returns the type and line number of the exception that occurred.
///
/// (ja)SpWMLの例外クラスです。発生した例外の種類と行番号を返します。
///
class SpWMLException implements Exception {
  final EnumSpWMLExceptionType type;
  final int lineStart;
  final int lineEnd;
  final SpWMLInfo? info;

  /// Constructor
  /// * [type] : Exception type.
  /// * [lineStart] : Exception occurred line start.
  /// * [lineEnd] : Exception occurred line end.
  /// * [info] : A hint when an error occurs.
  /// It is convenient to set when nesting multiple SpWMLs.
  SpWMLException(this.type, this.lineStart, this.lineEnd, this.info);

  String _getHint() {
    if (info == null) {
      return "";
    } else {
      return ", Hint:${info!.errorHint}";
    }
  }

  @override
  String toString() =>
      "SpWMLException, Type:${type.name}, Line:$lineStart-$lineEnd, ${type.toErrorText()}${_getHint()}";
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
  sidDoesNotExistException,
  noManagerException
}

extension EXTEnumSpWMLExceptionType on EnumSpWMLExceptionType {
  String toErrorText() {
    switch (this) {
      case EnumSpWMLExceptionType.typeException:
        return "It is an invalid type.";
      case EnumSpWMLExceptionType.paramException:
        return "The parameter length is invalid.";
      case EnumSpWMLExceptionType.paramValueException:
        return "It is an invalid parameter value.";
      case EnumSpWMLExceptionType.nullException:
        return "The target did not exist.";
      case EnumSpWMLExceptionType.levelException:
        return "The number of indent mark is invalid.";
      case EnumSpWMLExceptionType.replaceException:
        return "Only the child elements of the block element can be replaced.";
      case EnumSpWMLExceptionType.syntaxException:
        return 'Syntax Error.';
      case EnumSpWMLExceptionType.elementException:
        return 'The specified position contains an element that cannot be placed.';
      case EnumSpWMLExceptionType.tableParamException:
        return 'Please set hNum parameter.';
      case EnumSpWMLExceptionType.sidDoesNotExistException:
        return 'Please set sid parameter.';
      case EnumSpWMLExceptionType.noManagerException:
        return 'Please set the required manager class.';
    }
  }
}
