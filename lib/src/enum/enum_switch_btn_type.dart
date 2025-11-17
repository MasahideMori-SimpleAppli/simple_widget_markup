import '../../simple_widget_markup.dart';

/// (en) The switch btn state.
///
/// (ja) スイッチボタンの状態の定義。
enum EnumSwitchBtnType { normal, check }

/// EnumSwitchBtnType extension.
extension EXTEnumSwitchBtnType on EnumSwitchBtnType {
  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumSwitchBtnType fromStr(
    String s,
    int lineStart,
    int lineEnd,
    SpWMLInfo? info,
  ) {
    try {
      return EnumSwitchBtnType.values.byName(s);
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
