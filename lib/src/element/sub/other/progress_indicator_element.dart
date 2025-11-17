import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';

import '../../../../simple_widget_markup.dart';

///
/// (en) The progressIndicator.
///
/// (ja) progressIndicatorの実装。
///
class ProgressIndicatorElement extends SpWMLElement {
  final ProgressIndicatorParamsWrapper elParams;

  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [info] : SpWML info.
  /// * [elParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  ProgressIndicatorElement(
    int serial,
    Map<String, String> params,
    SpWMLParamsWrapper spwmlParams,
    int parentSerial,
    int lineStart,
    int lineEnd,
    SpWMLFontStyle style,
    SpWMLInfo? info,
    this.elParams, {
    super.key,
  }) : super(
          serial,
          EnumSpWMLElementType.progressIndicator,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
        );

  /// Get this class name.
  @override
  String getClassName() {
    return "ProgressIndicatorElement";
  }

  /// Initialize the parameters.
  @override
  ProgressIndicatorElement initParams() {
    super.initParams();
    elParams.p.indicatorType = params.containsKey(EnumSpWMLParams.type)
        ? params[EnumSpWMLParams.type]
        : EnumIndicatorType.circular;
    if (elParams.p.indicatorType == EnumIndicatorType.circular) {
      elParams.p.circularProgressIndicatorParams =
          CircularProgressIndicatorParams();
      elParams.p.circularProgressIndicatorParams!.color =
          params.containsKey(EnumSpWMLParams.indicatorColor)
              ? params[EnumSpWMLParams.indicatorColor]
              : null;
      elParams.p.circularProgressIndicatorParams!.backgroundColor =
          params.containsKey(EnumSpWMLParams.indicatorBGColor)
              ? params[EnumSpWMLParams.indicatorBGColor]
              : null;
    } else {
      elParams.p.linearProgressIndicatorParams =
          LinearProgressIndicatorParams();
      elParams.p.linearProgressIndicatorParams!.color =
          params.containsKey(EnumSpWMLParams.indicatorColor)
              ? params[EnumSpWMLParams.indicatorColor]
              : null;
      elParams.p.linearProgressIndicatorParams!.backgroundColor =
          params.containsKey(EnumSpWMLParams.indicatorBGColor)
              ? params[EnumSpWMLParams.indicatorBGColor]
              : null;
    }
    // SIDが設定されていなければエラー。
    if (getSID() == null) {
      throw SpWMLException(
        EnumSpWMLExceptionType.sidDoesNotExistException,
        lineStart,
        lineEnd,
        info,
      );
    }
    return this;
  }

  /// Assemble and return the widget.
  @override
  Widget getWidget(BuildContext context) {
    if (elParams.p.indicatorType == EnumIndicatorType.circular) {
      return CircularProgressIndicator(
        key: elParams.p.circularProgressIndicatorParams!.key,
        value: elParams.p.circularProgressIndicatorParams!.manager!.getValue(
          getSID()!,
        ),
        backgroundColor:
            elParams.p.circularProgressIndicatorParams!.backgroundColor,
        color: elParams.p.circularProgressIndicatorParams!.color,
        valueColor: elParams.p.circularProgressIndicatorParams!.valueColor,
        strokeWidth: elParams.p.circularProgressIndicatorParams!.strokeWidth,
        semanticsLabel:
            elParams.p.circularProgressIndicatorParams!.semanticsLabel,
        semanticsValue:
            elParams.p.circularProgressIndicatorParams!.semanticsValue,
      );
    } else {
      return LinearProgressIndicator(
        key: elParams.p.linearProgressIndicatorParams!.key,
        value: elParams.p.linearProgressIndicatorParams!.manager!.getValue(
          getSID()!,
        ),
        backgroundColor:
            elParams.p.linearProgressIndicatorParams!.backgroundColor,
        color: elParams.p.linearProgressIndicatorParams!.color,
        valueColor: elParams.p.linearProgressIndicatorParams!.valueColor,
        minHeight: elParams.p.linearProgressIndicatorParams!.minHeight,
        semanticsLabel:
            elParams.p.linearProgressIndicatorParams!.semanticsLabel,
        semanticsValue:
            elParams.p.linearProgressIndicatorParams!.semanticsValue,
      );
    }
  }

  /// (en)Set progress. Invalid if the manager class is not set.
  ///
  /// (ja)進捗具合を設定します。マネージャークラスが未設定の場合は無効です。
  /// nullを設定するとアニメーションになります。
  ///
  /// * [v] The progress value. null or the value between 0.0 and 1.0.
  /// If null, set loading animation.
  void setValue(double? v) {
    final String? sid = getSID();
    if (sid != null) {
      if (elParams.p.indicatorType == EnumIndicatorType.circular) {
        if (elParams.p.circularProgressIndicatorParams!.manager != null) {
          elParams.p.circularProgressIndicatorParams!.manager!.setValue(sid, v);
        }
      } else {
        if (elParams.p.linearProgressIndicatorParams!.manager != null) {
          elParams.p.linearProgressIndicatorParams!.manager!.setValue(sid, v);
        }
      }
    }
  }

  /// (en) Get the value.
  /// If the manager class has not been set or there is no value,
  /// null is returned.
  ///
  /// (ja) 値を取得します。
  /// マネージャークラスが未設定の場合や、値が無い場合はnullが返ります。
  double? getValue() {
    final String? sid = getSID();
    if (sid != null) {
      if (elParams.p.indicatorType == EnumIndicatorType.circular) {
        if (elParams.p.circularProgressIndicatorParams!.manager != null) {
          return elParams.p.circularProgressIndicatorParams!.manager!.getValue(
            sid,
          );
        }
      } else {
        if (elParams.p.linearProgressIndicatorParams!.manager != null) {
          return elParams.p.linearProgressIndicatorParams!.manager!.getValue(
            sid,
          );
        }
      }
    }
    return null;
  }

  /// (en) Sets the manager class that manages the state.
  ///
  /// (ja) 状態を管理するマネージャクラスを設定します。
  /// * [m] : Manager class.
  /// * [sid] : This element sid.
  void setManager(ValueManager m, String sid) {
    if (elParams.p.indicatorType == EnumIndicatorType.circular) {
      elParams.p.circularProgressIndicatorParams!.manager = m;
      elParams.p.circularProgressIndicatorParams!.manager!.getValue(
        sid,
        initialValue: null,
      );
    } else {
      elParams.p.linearProgressIndicatorParams!.manager = m;
      elParams.p.linearProgressIndicatorParams!.manager!.getValue(
        sid,
        initialValue: null,
      );
    }
  }
}
