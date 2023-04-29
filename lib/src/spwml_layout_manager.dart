import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///
/// (en)A manager class for managing SpWML layout files with a singleton.
/// This manager class suppressing unnecessary resource downloads.
///
/// (ja)SpWMLのレイアウトファイルをシングルトンで管理し、不必要なリソースのダウンロードを抑えるためのマネージャークラスです。
///
/// Author Masahide Mori
///
/// First edition creation date 2023-04-28 19:57:59
///
class SpWMLLayoutManager {
  // singleton
  static final SpWMLLayoutManager _instance = SpWMLLayoutManager._internal();

  factory SpWMLLayoutManager() {
    return _instance;
  }

  SpWMLLayoutManager._internal();

  final Map<String, String> _buffLayouts = {};

  /// (en)Clear this class and empty the layout file it maintains.
  ///
  /// (ja)このクラスをリセットし、管理中のレイアウトファイルを空にします。
  void clear() {
    _buffLayouts.clear();
  }

  /// (en)Register your layouts directly in this class.
  ///
  /// (ja)このクラスに直接レイアウトを登録します。
  ///
  /// * [key] : layout key.
  /// * [layout] : layout string.
  void setLayout(String key, String layout) {
    _buffLayouts[key] = layout;
  }

  /// (en)Gets the layouts registered with this class.
  /// Null is returned if an unregistered key is specified.
  ///
  /// (ja)このクラスに登録されたレイアウトを取得します。
  /// 未登録のキーを指定した場合はnullが返されます。
  ///
  /// * [key] : layout key.
  String? getLayout(String key) {
    if (_buffLayouts.containsKey(key)) {
      return _buffLayouts[key];
    } else {
      return null;
    }
  }

  /// (en)Asynchronously retrieves the layout present at the given path and calls back when complete.
  /// If you specify an asset that has already been acquired,
  /// the contents will be returned as is and no callback will occur.
  /// If you specify an asset that has not yet been acquired,
  /// null will be returned, and resource acquisition will start after the current rendering is complete.
  ///
  /// (ja) 指定されたパスに存在するレイアウトを非同期で取得し、完了したらコールバックします。
  /// 既に取得済みのアセットを指定した場合はそのまま内容が返却され、コールバックは発生しません。
  /// まだ取得されていないアセットを指定した場合はnullが返却され、現在のレンダリングの完了後のタイミングでリソースの取得が開始されます。
  ///
  /// * [path] : The layout path in assets directory. e.g. [/layout/en/top/base.spwml]
  /// * [setStateCallback] : Pass the setState of the parent widget in the callback.
  /// If you're using another state management, let the screen refresh.
  String? getAssets(String path, void Function() setStateCallback) {
    if (_buffLayouts.containsKey(path)) {
      return _buffLayouts[path];
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        _buffLayouts[path] = await rootBundle.loadString(path, cache: false);
        setStateCallback();
      });
      return null;
    }
  }

  /// A multi-simultaneous version of getAssets.
  List<String>? getMultiAssets(
      List<String> paths, void Function() setStateCallback) {
    bool isAllContained = true;
    for (String i in paths) {
      if (!_buffLayouts.containsKey(i)) {
        isAllContained = false;
        break;
      }
    }
    if (isAllContained) {
      List<String> r = [];
      for (String i in paths) {
        r.add(_buffLayouts[i]!);
      }
      return r;
    } else {
      // 足りない分をロードした後でコールバックする。
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        for (String i in paths) {
          if (!_buffLayouts.containsKey(i)) {
            _buffLayouts[i] = await rootBundle.loadString(i, cache: false);
          }
        }
        setStateCallback();
      });
      return null;
    }
  }
}
