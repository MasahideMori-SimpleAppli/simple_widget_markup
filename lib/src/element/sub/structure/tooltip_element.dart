import 'package:flutter/material.dart';
import '../../../../simple_widget_markup.dart';
import '../../../element_params/sub/structure/tooltip_params.dart';

///
/// (en) The tooltip.
///
/// (ja) Tooltipの実装。
///
class TooltipElement extends SingleChildTextElement {
  final TooltipParamsWrapper elParams;

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
  TooltipElement(
      int serial,
      Map<String, String> params,
      SpWMLParamsWrapper spwmlParams,
      int parentSerial,
      int lineStart,
      int lineEnd,
      SpWMLFontStyle style,
      SpWMLInfo? info,
      BlockElementChild child,
      TextParamsWrapper textParams,
      this.elParams)
      : super(serial, EnumSpWMLElementType.tooltip, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, child, textParams);

  /// Get this class name.
  @override
  String getClassName() {
    return "TooltipElement";
  }

  /// Initialize the parameters.
  @override
  TooltipElement initParams() {
    super.initParams();
    elParams.p.verticalOffset = params.containsKey(EnumSpWMLParams.offsetY)
        ? params[EnumSpWMLParams.offsetY]
        : null;
    elParams.p.triggerMode = params.containsKey(EnumSpWMLParams.triggerMode)
        ? params[EnumSpWMLParams.triggerMode]
        : null;
    return this;
  }

  /// (en) Set the message.
  ///
  /// (ja) メッセージを設定します。
  ///
  /// * [message] : The message.
  void setMessage(String message) {
    elParams.p.message = message;
  }

  /// (en)Sets the callback when triggered.
  ///
  /// (ja)トリガーされた時のコールバックを設定します。
  /// * [callback] : The callback.
  void setOnTriggered(void Function()? callback) {
    elParams.p.onTriggered = callback;
  }

  /// (en)Sets the trigger mode.
  ///
  /// (ja)トリガーモードを設定します。
  /// * [mode] : The trigger mode.
  void setTriggerMode(TooltipTriggerMode mode) {
    elParams.p.triggerMode = mode;
  }

  /// (en) Set the vertical offset.
  /// This will overwrite the offset specified by offsetY in SpWML.
  ///
  /// (ja) 垂直方向のオフセットを設定します。
  /// SpWML上でoffsetYで指定したオフセットが上書きされます。
  ///
  /// * [offset] : The vertical offset.
  void setVerticalOffset(double offset) {
    elParams.p.verticalOffset = offset;
  }

  /// (en)Sets the key for the tooltip.
  ///
  /// (ja)ツールチップ用のキーを設定します。
  /// * [key] : The key.
  void setKey(GlobalKey<TooltipState> key) {
    elParams.p.key = key;
  }

  /// (en)Activates the tooltip programmatically.
  /// Only effective if the tooltip has a key set.
  ///
  /// (ja)ツールチップをプログラムから起動します。
  /// ツールチップにキーが設定してある場合のみ有効です。
  void ensureVisible() {
    if (elParams.p.key != null) {
      if (elParams.p.key is GlobalKey<TooltipState>) {
        (elParams.p.key as GlobalKey<TooltipState>)
            .currentState
            ?.ensureTooltipVisible();
      }
    }
  }

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    return Tooltip(
      key: elParams.p.key,
      message: elParams.p.richMessage == null
          ? (elParams.p.message ?? spwmlParams.p.text)
          : null,
      richMessage: elParams.p.richMessage,
      height: elParams.p.height ?? spwmlParams.p.containerParams!.height,
      padding: elParams.p.padding ?? spwmlParams.p.containerParams!.padding,
      margin: elParams.p.margin ?? spwmlParams.p.containerParams!.margin,
      verticalOffset: elParams.p.verticalOffset,
      preferBelow: elParams.p.preferBelow,
      excludeFromSemantics: elParams.p.excludeFromSemantics,
      decoration:
          elParams.p.decoration ?? spwmlParams.p.containerParams!.decoration,
      textStyle: elParams.p.textStyle ?? getStyle(context),
      textAlign: elParams.p.textAlign ?? getTextAlign(),
      waitDuration: elParams.p.waitDuration,
      showDuration: elParams.p.showDuration,
      exitDuration: elParams.p.exitDuration,
      enableTapToDismiss: elParams.p.enableTapToDismiss,
      triggerMode: elParams.p.triggerMode,
      enableFeedback: elParams.p.enableFeedback,
      onTriggered: elParams.p.onTriggered,
      child: elParams.p.child ?? child.child,
    );
  }
}
