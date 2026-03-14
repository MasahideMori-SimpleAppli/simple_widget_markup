import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';
import 'package:simple_widget_markup/simple_widget_markup.dart';

/// (en)This defines a callback for initializing the StateManager.
/// This can be used to set initial values for a view (for example,
/// the initial values for radio buttons).
///
/// (ja) StateManagerの初期化用コールバックの定義。
/// これを用いてビューの初期値（例えばラジオボタンの初期値）などを設定できます。
typedef SpWMLViewOnInitCallback = void Function(
  StateManager sm,
);

/// (en) Definition of callbacks for setting up buttons and other elements
/// within SpWML.
///
/// (ja) SpWML内部のボタンなどのセットアップ用コールバックの定義。
typedef SpWMLViewSetupCallback = void Function(
  BuildContext context,
  SpWMLBuilder builder,
  SpWMLViewScope scope,
);

/// (en) Definition of a callback for error handling during asset loading.
///
/// (ja) アセットロード時のエラーハンドリング用コールバックの定義。
typedef SpWMLViewLoadAssetsErrorCallback = void Function(
  BuildContext context,
  Object error,
);

/// (en) A scope object that bundles useful functions available within onSetup.
///
/// (ja) onSetup内で利用できる便利な機能をまとめたスコープオブジェクト。
class SpWMLViewScope {
  final void Function(bool) setIsProcessing;
  final void Function(VoidCallback) setState;
  final StateManager sm;

  /// * [setIsProcessing] : Calling this method with true will overlap the
  /// loading indicator. Calling it with false will remove the overlap.
  /// * [setState] : This is a function that calls the setState method of
  /// SpWMLView.
  /// * [sm] : A reference to the StateManager used within the view.
  /// This can be used when you want to serialize the view.
  SpWMLViewScope({
    required this.setIsProcessing,
    required this.setState,
    required this.sm,
  });
}

/// (en) A SpWML widget that supports state management and asynchronous loading.
///
/// (ja) 状態管理と非同期ロードをサポートする SpWML ウィジェット。
class SpWMLView extends StatefulWidget {
  final String? spWML;
  final String Function(BuildContext context)? pathBuilder;
  final SpWMLViewOnInitCallback? onInit;
  final SpWMLViewSetupCallback? onSetup;
  final SpWMLViewLoadAssetsErrorCallback? onLoadAssetsError;

  // Layout & Styles
  final MainAxisAlignment mainAA;
  final CrossAxisAlignment crossAA;
  final MainAxisSize mainAS;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final SpWMLFontStyle? spWMLStyle;
  final SpWMLInfo? info;

  /// * [spWML] : SpWML text. Either spWML or pathBuilder is required.
  /// * [pathBuilder] : If you want to load a layout from assets,
  /// set spWML to null and pass a function to calculate the layout path to it.
  /// Using this, the layout will be loaded internally from the assets using
  /// SpWMLLayoutManager().getAssets.
  /// * [onInit] : This defines a callback for initializing the StateManager.
  /// This can be used to set initial values for a view (for example,
  /// the initial values for radio buttons).
  /// * [onSetup] : This is a callback for initializing the view.
  /// You can set callbacks for buttons within SpWML, etc.
  /// * [onLoadAssetsError] : Handling what to do if asset loading fails.
  /// * [mainAA] : Top level Column MainAxisAlignment.
  /// * [crossAA] : Top level Column CrossAxisAlignment.
  /// * [mainAS] : The MainAxisSize of wrap column.
  /// * [margin] : Top level Column Margin.
  /// * [padding] : Top level Column Padding.
  /// * [spWMLStyle] : Font styles. If you want to change the default style,
  /// you can change the contents of the singleton SpWMLFontManager class.
  /// * [info] : This is information object. e.g. A hint when an error occurs.
  /// It is convenient to set when nesting multiple SpWMLs.
  const SpWMLView({
    super.key,
    this.spWML,
    this.pathBuilder,
    this.onInit,
    this.onSetup,
    this.onLoadAssetsError,
    this.mainAA = MainAxisAlignment.start,
    this.crossAA = CrossAxisAlignment.start,
    this.mainAS = MainAxisSize.max,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    this.spWMLStyle,
    this.info,
  }) : assert(spWML != null || pathBuilder != null,
            'Either spWML or pathBuilder must be provided.');

  @override
  State<SpWMLView> createState() => _SpWMLViewState();
}

class _SpWMLViewState extends State<SpWMLView> {
  final StateManager _sm = StateManager();
  bool _isProcessing = false;

  void _setIsProcessing(bool v) {
    if (mounted) setState(() => _isProcessing = v);
  }

  @override
  void initState() {
    super.initState();
    if (widget.onInit != null) {
      widget.onInit!(_sm);
    }
  }

  @override
  void dispose() {
    _sm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? content;

    if (widget.spWML != null) {
      content = widget.spWML;
    } else if (widget.pathBuilder != null) {
      final path = widget.pathBuilder!(context);
      // SpWMLLayoutManager を利用してアセットを取得
      content = SpWMLLayoutManager().getAssets(
        path,
        () {
          if (mounted) setState(() {});
        },
        (e) {
          // エラーのデバッグ表示を含めて、ここではユーザーに処理を任せる。
          if (widget.onLoadAssetsError != null) {
            widget.onLoadAssetsError!(context, e);
          }
        },
      );
    }

    // ロード中の表示
    if (content == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // Builderの構築
    final builder = SpWMLBuilder(
      content,
      mainAA: widget.mainAA,
      crossAA: widget.crossAA,
      mainAS: widget.mainAS,
      margin: widget.margin,
      padding: widget.padding,
      spWMLStyle: widget.spWMLStyle,
      info: widget.info,
    );
    builder.setStateManager(_sm);

    // セットアップ処理の実行
    if (widget.onSetup != null) {
      widget.onSetup!(
        context,
        builder,
        SpWMLViewScope(
            setIsProcessing: _setIsProcessing,
            setState: (fn) {
              if (mounted) setState(fn);
            },
            sm: _sm),
      );
    }

    // ロード待機インジケータも組み込んだウィジェットツリー
    return Stack(
      children: [
        builder.build(context),
        if (_isProcessing) ...[
          const ModalBarrier(
            dismissible: false,
            color: Colors.black12,
          ),
          const Center(child: CircularProgressIndicator()),
        ],
      ],
    );
  }
}
