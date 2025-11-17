import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../simple_widget_markup.dart';

///
/// (en)A manager class for managing SpWML layout files with a singleton.
/// This manager class suppressing unnecessary resource downloads.
/// This class can also determine screen orientation and device type.
///
/// (ja)SpWMLのレイアウトファイルをシングルトンで管理し、不必要なリソースのダウンロードを抑えるためのマネージャークラスです。
/// 画面の向きやデバイスの種類の判定も行えます。
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

  /// (en)Removes a layout registered with this class.
  /// Nothing happens if you specify an unregistered key.
  ///
  /// (ja)このクラスに登録されたレイアウトを削除します。
  /// 未登録のキーを指定した場合は何も起こりません。
  ///
  /// * [key] : layout key.
  void removeLayout(String key) {
    if (_buffLayouts.containsKey(key)) {
      _buffLayouts.remove(key);
    }
  }

  /// (en)Asynchronously retrieves the layout present at the given path and calls back when complete.
  /// If you specify an asset that has already been acquired,
  /// the contents will be returned as is and no callback will occur.
  /// If you specify an asset that has not yet been acquired,
  /// null will be returned, and resource acquisition will start after the current rendering is complete.
  /// Asset registration in pubspec.yaml is mandatory.
  ///
  /// (ja) 指定されたパスに存在するレイアウトを非同期で取得し、完了したらコールバックします。
  /// 既に取得済みのアセットを指定した場合はそのまま内容が返却され、コールバックは発生しません。
  /// まだ取得されていないアセットを指定した場合はnullが返却され、現在のレンダリングの完了後のタイミングでリソースの取得が開始されます。
  /// pubspec.yamlにアセットの登録が必須です。
  ///
  /// * [path] : The layout path in assets directory. e.g. [assets/layout/en/top/base.spwml]
  /// * [setStateCallback] : Pass the setState of the parent widget in the callback.
  /// If you're using another state management, let the screen refresh.
  /// The callback will be fired after the current rendering is finished.
  /// * [errorCallback] : The callback in case loading fails.
  /// The callback will be fired after the current rendering is finished.
  String? getAssets(
    String path,
    void Function() setStateCallback,
    void Function(dynamic error) errorCallback,
  ) {
    if (_buffLayouts.containsKey(path)) {
      return _buffLayouts[path];
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        try {
          _buffLayouts[path] = await rootBundle.loadString(path, cache: false);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setStateCallback();
          });
        } catch (e) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            errorCallback(e);
          });
        }
      });
      return null;
    }
  }

  /// The multi-simultaneous version of getAssets.
  /// Asset registration in pubspec.yaml is mandatory.
  ///
  /// * [paths] : The layout path in assets directory. e.g. [assets/layout/en/top/base.spwml]
  /// * [setStateCallback] : Pass the setState of the parent widget in the callback.
  /// If you're using another state management, let the screen refresh.
  /// The callback will be fired after the current rendering is finished.
  /// * [errorCallback] : The callback in case loading fails.
  /// The callback will be fired after the current rendering is finished.
  /// This is fired only once when an asset fails to load.
  /// And the asset loading will stop at that point.
  List<String>? getMultiAssets(
    List<String> paths,
    void Function() setStateCallback,
    void Function(dynamic error) errorCallback,
  ) {
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
        try {
          for (String i in paths) {
            if (!_buffLayouts.containsKey(i)) {
              _buffLayouts[i] = await rootBundle.loadString(i, cache: false);
            }
          }
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setStateCallback();
          });
        } catch (e) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            errorCallback(e);
          });
        }
      });
      return null;
    }
  }

  /// (en)Register with this class and call back when the resource acquisition is complete.
  /// If you specify a URL that has already been acquired,
  /// the content will be returned as is and no callback will occur.
  /// If you specify a URL that has not yet been acquired, null will be returned,
  /// and resource acquisition will start after the current rendering is completed.
  ///
  /// (ja) リソースの取得が完了したらこのクラスに登録してコールバックします。
  /// 既に取得済みのURLを指定した場合はそのまま内容が返却され、コールバックは発生しません。
  /// まだ取得されていないURLを指定した場合はnullが返却され、現在のレンダリングの完了後のタイミングでリソースの取得が開始されます。
  ///
  /// * [url] : The layout url.
  /// * [getDataFunction] : Pass the function that actually gets the resource via https and returns the result.
  /// * [setStateCallback] : Pass the setState of the parent widget in the callback.
  /// If you're using another state management, let the screen refresh.
  /// The callback will be fired after the current rendering is finished.
  /// * [errorCallback] : The callback in case loading fails.
  /// The callback will be fired after the current rendering is finished.
  String? getResource(
    String url,
    Future<String> Function(String url) getDataFunction,
    void Function() setStateCallback,
    void Function(dynamic error) errorCallback,
  ) {
    if (_buffLayouts.containsKey(url)) {
      return _buffLayouts[url];
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        try {
          _buffLayouts[url] = await getDataFunction(url);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setStateCallback();
          });
        } catch (e) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            errorCallback(e);
          });
        }
      });
      return null;
    }
  }

  /// The multi-simultaneous version of getResource.
  ///
  /// Note: The order of the resources returned by getDataFunction must match the urls.
  /// * [urls] : The layout urls.
  /// * [getDataFunction] : Pass the function that actually gets the resource via https and returns the result.
  /// * [setStateCallback] : Pass the setState of the parent widget in the callback.
  /// If you're using another state management, let the screen refresh.
  /// The callback will be fired after the current rendering is finished.
  /// * [errorCallback] : The callback in case loading fails.
  /// The callback will be fired after the current rendering is finished.
  /// This is fired only once when an asset fails to load.
  /// And the asset loading will stop at that point.
  List<String>? getMultiResource(
    List<String> urls,
    Future<List<String>> Function(List<String> urls) getDataFunction,
    void Function() setStateCallback,
    void Function(dynamic error) errorCallback,
  ) {
    bool isAllContained = true;
    for (String i in urls) {
      if (!_buffLayouts.containsKey(i)) {
        isAllContained = false;
        break;
      }
    }
    if (isAllContained) {
      List<String> r = [];
      for (String i in urls) {
        r.add(_buffLayouts[i]!);
      }
      return r;
    } else {
      // ロードした後でコールバックする。こちらはAssetsと異なり常に上書き。
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        try {
          final List<String> result = await getDataFunction(urls);
          int count = 0;
          for (String i in urls) {
            _buffLayouts[i] = result[count];
            count += 1;
          }
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setStateCallback();
          });
        } catch (e) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            errorCallback(e);
          });
        }
      });
      return null;
    }
  }

  /// (en) Gets the current screen height.
  /// However, it does not include the status bar or notch height.
  ///
  /// (ja) 現在の画面の高さを取得します。
  /// ただし、ステータスバーやノッチの高さは含まれません。
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// (en) Gets the current screen width.
  ///
  /// (ja) 現在の画面の幅を取得します。
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// (en) Returns True if the current device is in portrait orientation.
  ///
  /// (ja) 現在のデバイスが縦向きならTrueを返します。
  static bool isVertical(BuildContext context) {
    return getScreenHeight(context) > getScreenWidth(context);
  }

  /// (en) Returns True if the current device is in landscape orientation.
  ///
  /// (ja) 現在のデバイスが横向きならTrueを返します。
  static bool isHorizontal(BuildContext context) {
    return getScreenHeight(context) < getScreenWidth(context);
  }

  /// (en) Returns the current device orientation.
  ///
  /// (ja) 現在のデバイスの向きを返します。
  static EnumOrientation getOrientation(BuildContext context) {
    if (isHorizontal(context)) {
      return EnumOrientation.horizontal;
    } else {
      return EnumOrientation.vertical;
    }
  }

  /// (en) Returns the window class. Classes are determined by width.
  ///
  /// (ja) ウィンドウクラスを返します。クラスは幅を基準として判定されます。
  ///
  /// (reference) https://developer.android.com/guide/topics/large-screens/support-different-screen-sizes?hl=ja#window_size_classes
  static EnumWindowClass getWindowClass(BuildContext context) {
    return EXTEnumWindowClass.getWindowClass(getScreenWidth(context));
  }
}
