/// (en) A utility for input formatter.
///
/// (ja) インプットフォーマッター用のユーティリティクラス。
class UtilInputFormatter {
  /// 指定されたインデックスまで（インデックスを含まない）のテキストを取得する関数。
  static String getIndexBeforeString(String t, int index) {
    // indexが範囲外の場合
    if (index > t.length) {
      return t;
    } else {
      return t.substring(0, index);
    }
  }
}
