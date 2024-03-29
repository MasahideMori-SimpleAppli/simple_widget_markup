///
/// (en)Reference class for hints when SpWML throws an error.
///
/// (ja)SpWMLがエラーをスローする時のヒントの参照用クラスです。
///
class SpWMLInfo {
  /// The hint text added to the error information when SpWML throws an error.
  final String errorHint;

  /// * [errorHint] : The hint text added to the error information
  /// when SpWML throws an error.
  /// Be careful not to include confidential information in this text.
  /// Basically, what should go here is the name of the spwml layout.
  SpWMLInfo({required this.errorHint});
}
