import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../element/super/single_child_element.dart';
import '../../../element_params/element_child.dart';
import '../../../element_params/spwml_info.dart';
import '../../../element_params/sub/structure/scroll_params.dart';
import '../../../element_params/super/spwml_params.dart';
import '../../../enum/enum_spwml_params.dart';
import '../../../enum/enum_spwml_element_type.dart';
import '../../../style/spwml_font_style.dart';

///
/// (en) The scroll.
///
/// (ja) scrollの実装。
///
class ScrollElement extends SingleChildElement {
  final ScrollParamsWrapper elParams;

  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [info] : SpWML info.
  /// * [child] : This element child.
  /// * [elParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  ScrollElement(
    int serial,
    Map<String, String> params,
    SpWMLParamsWrapper spwmlParams,
    int parentSerial,
    int lineStart,
    int lineEnd,
    SpWMLFontStyle style,
    SpWMLInfo? info,
    BlockElementChild child,
    this.elParams, {
    super.key,
  }) : super(
          serial,
          EnumSpWMLElementType.scroll,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          child,
        );

  /// Get this class name.
  @override
  String getClassName() {
    return "ScrollElement";
  }

  /// Initialize the parameters.
  @override
  ScrollElement initParams() {
    super.initParams();
    elParams.p.primary = params.containsKey(EnumSpWMLParams.isPrimary)
        ? params[EnumSpWMLParams.isPrimary]!
        : null;
    elParams.p.scrollDirection = params.containsKey(EnumSpWMLParams.axis)
        ? params[EnumSpWMLParams.axis]!
        : Axis.vertical;
    elParams.p.scrollBehavior =
        params.containsKey(EnumSpWMLParams.scrollBehavior)
            ? params[EnumSpWMLParams.scrollBehavior]!
            : null;
    if (elParams.p.scrollDirection == Axis.horizontal &&
        elParams.p.scrollBehavior == null) {
      elParams.p.scrollBehavior = const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
      );
    }
    elParams.p.alignCenter = params.containsKey(EnumSpWMLParams.alignCenter)
        ? params[EnumSpWMLParams.alignCenter]!
        : false;
    return this;
  }

  /// (en) Sets the scroll controller.
  /// This can be used to adjust the scroll position programmatically.
  ///
  /// (ja)スクロールコントローラーをセットします。
  /// これはプログラムからスクロール位置を調整したい場合に利用できます。
  ///
  /// * [scCtrl] : The ScrollController.
  void setScrollController(ScrollController scCtrl) {
    elParams.p.controller = scCtrl;
  }

  /// (en) Sets the scroll controller and
  /// changes it to a mode that always displays the scrollbar.
  ///
  /// (ja)スクロールコントローラーをセットし、常にスクロールバーを表示するモードに変更します。
  ///
  /// * [scCtrl] : The ScrollController.
  void changeToAlwaysShownScrollBar(ScrollController scCtrl) {
    elParams.p.controller = scCtrl;
    elParams.p.isAlwaysShownScrollbar = true;
  }

  /// フラグに応じて、必要な場合はCenterでラップするメソッド。
  Widget _wrapCenter(Widget child) {
    if (elParams.p.alignCenter) {
      return Center(child: child);
    } else {
      return child;
    }
  }

  /// フラグに応じて、必要な場合はScrollConfigurationでラップするメソッド。
  Widget _wrapScrollConfiguration(Widget child) {
    if (elParams.p.scrollBehavior != null) {
      return ScrollConfiguration(
        behavior: elParams.p.scrollBehavior!,
        child: child,
      );
    } else {
      return child;
    }
  }

  /// フラグに応じて、必要な場合はScrollBarでラップし、常にバーを表示する設定を行うメソッド。
  Widget _wrapScrollBar(Widget child) {
    if (elParams.p.isAlwaysShownScrollbar && elParams.p.controller != null) {
      return Scrollbar(
        thumbVisibility: true,
        controller: elParams.p.controller,
        child: child,
      );
    } else {
      return child;
    }
  }

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    return _wrapCenter(
      _wrapScrollConfiguration(
        _wrapScrollBar(
          SingleChildScrollView(
            key: elParams.p.key,
            scrollDirection: elParams.p.scrollDirection,
            reverse: elParams.p.reverse,
            padding: elParams.p.padding,
            primary: elParams.p.primary,
            physics: elParams.p.physics,
            controller: elParams.p.controller,
            dragStartBehavior: elParams.p.dragStartBehavior,
            clipBehavior: elParams.p.clipBehavior,
            restorationId: elParams.p.restorationId,
            keyboardDismissBehavior: elParams.p.keyboardDismissBehavior,
            child: child.getChild(),
          ),
        ),
      ),
    );
  }
}
