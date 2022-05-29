import 'package:flutter/material.dart';
import '../../element_params/super/spwml_params.dart';
import '../../enum/enum_spwml_params.dart';
import '../../enum/enum_spwml_element_type.dart';
import '../../spwml_exception.dart';
import '../../util_parser.dart';

import '../spwml_font_style.dart';

///
/// (en)Definition of the basic structure of the element.
/// (ja)要素の基本構造の定義。
///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-30 20:38:20
///
class SpWMLElement extends StatelessWidget {
  final int serial;
  final EnumSpWMLElementType type;
  final Map<EnumSpWMLParams, dynamic> params;
  final SpWMLParamsWrapper spwmlParams;
  final int parentSerial;
  final int lineStart;
  final int lineEnd;
  final SpWMLFontStyle style;

  ///
  /// * [serial] : Array Index.
  /// * [type] : Element type.
  /// * [param] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  ///
  /// Throws [SpWMLException] : ParamException.
  /// Throws [SpWMLException] : ParamValueException.
  SpWMLElement(this.serial, this.type, List<String> param, this.spwmlParams,
      this.parentSerial, this.lineStart, this.lineEnd, this.style)
      : params = _setParam(type, param, lineStart, lineEnd);

  static Map<EnumSpWMLParams, dynamic> _setParam(EnumSpWMLElementType type,
      List<String> param, int lineStart, int lineEnd) {
    Map<EnumSpWMLParams, dynamic> mParam = {};
    for (String i in param) {
      List<String> p = UtilParser.split(i, ":");
      if (p.length == 2) {
        // 変換される時点（パース時）で値の検査も行う。
        EnumSpWMLParams t = EXTEnumSpWMLParams.fromStr(
            p[0].replaceAll(" ", "").replaceAll("　", ""), lineStart, lineEnd);
        if (t == EnumSpWMLParams.alt) {
          mParam[t] = p[1];
        } else {
          mParam[t] = t.parseValue(type,
              p[1].replaceAll(" ", "").replaceAll("　", ""), lineStart, lineEnd);
        }
      } else {
        throw SpWMLException(
            EnumSpWMLExceptionType.paramException, lineStart, lineEnd);
      }
    }
    return mParam;
  }

  // initialize parameters
  SpWMLElement initParams() {
    spwmlParams.p.weight = params.containsKey(EnumSpWMLParams.weight)
        ? params[EnumSpWMLParams.weight]
        : null;
    spwmlParams.p.shiftX = params.containsKey(EnumSpWMLParams.shiftX)
        ? params[EnumSpWMLParams.shiftX]
        : null;
    spwmlParams.p.shiftY = params.containsKey(EnumSpWMLParams.shiftY)
        ? params[EnumSpWMLParams.shiftY]
        : null;
    if (params.containsKey(EnumSpWMLParams.elevation)) {
      spwmlParams.p.material ??= MaterialParams();
      spwmlParams.p.material!.elevation =
          params.containsKey(EnumSpWMLParams.elevation)
              ? params[EnumSpWMLParams.elevation]
              : 0.0;
    }
    if (_isEnableConstrains()) {
      spwmlParams.p.constrains = _getConstraints();
    }
    spwmlParams.p.margin = _getMargin();
    spwmlParams.p.padding = _getPadding();
    spwmlParams.p.width = params.containsKey(EnumSpWMLParams.width)
        ? params[EnumSpWMLParams.width]!
        : null;
    spwmlParams.p.height = params.containsKey(EnumSpWMLParams.height)
        ? params[EnumSpWMLParams.height]!
        : null;
    spwmlParams.p.bgColor = params.containsKey(EnumSpWMLParams.bgColor)
        ? params[EnumSpWMLParams.bgColor]!
        : null;
    return this;
  }

  /// (en)Get shallow copy of this element parameter.
  ///
  /// (ja)このエレメントに現在設定されているパラメーターを取得します。
  SpWMLParams getSpWMLElementParams() {
    return spwmlParams.p;
  }

  /// (en)Set new parameter of this element.
  ///
  /// (ja)このエレメントのパラメーターを上書きします。
  /// * [params] : Parameters.
  void setSpWMLElementParams(SpWMLParams params) {
    spwmlParams.p = params;
  }

  /// Get button shape
  OutlinedBorder? getShape() {
    if (params.containsKey(EnumSpWMLParams.shape)) {
      if (params.containsKey(EnumSpWMLParams.borderRadius)) {
        if (params[EnumSpWMLParams.shape] is RoundedRectangleBorder) {
          return (params[EnumSpWMLParams.shape] as RoundedRectangleBorder)
              .copyWith(
                  borderRadius: BorderRadius.circular(
                      params[EnumSpWMLParams.borderRadius]));
        } else if (params[EnumSpWMLParams.shape] is BeveledRectangleBorder) {
          return (params[EnumSpWMLParams.shape] as BeveledRectangleBorder)
              .copyWith(
                  borderRadius: BorderRadius.circular(
                      params[EnumSpWMLParams.borderRadius]));
        } else {
          return params[EnumSpWMLParams.shape];
        }
      } else {
        return params[EnumSpWMLParams.shape];
      }
    } else {
      return null;
    }
  }

  double _getMarginTop() {
    if (type == EnumSpWMLElementType.text ||
        type == EnumSpWMLElementType.body1 ||
        type == EnumSpWMLElementType.body2 ||
        type == EnumSpWMLElementType.href) {
      return params.containsKey(EnumSpWMLParams.mTop)
          ? params[EnumSpWMLParams.mTop]
          : style.textMTop;
    } else if (type == EnumSpWMLElementType.h1 ||
        type == EnumSpWMLElementType.h2 ||
        type == EnumSpWMLElementType.h3 ||
        type == EnumSpWMLElementType.h4 ||
        type == EnumSpWMLElementType.h5 ||
        type == EnumSpWMLElementType.h6) {
      return params.containsKey(EnumSpWMLParams.mTop)
          ? params[EnumSpWMLParams.mTop]
          : style.hMTop;
    }
    return params.containsKey(EnumSpWMLParams.mTop)
        ? params[EnumSpWMLParams.mTop]
        : 0.0;
  }

  /// get margin from param.
  EdgeInsets _getMargin() {
    final double left = params.containsKey(EnumSpWMLParams.mLeft)
        ? params[EnumSpWMLParams.mLeft]
        : 0.0;
    final double top = _getMarginTop();
    final double right = params.containsKey(EnumSpWMLParams.mRight)
        ? params[EnumSpWMLParams.mRight]
        : 0.0;
    final double bottom = params.containsKey(EnumSpWMLParams.mBottom)
        ? params[EnumSpWMLParams.mBottom]
        : 0.0;
    return EdgeInsets.fromLTRB(left, top, right, bottom);
  }

  /// get padding from param.
  EdgeInsets _getPadding() {
    final double left = params.containsKey(EnumSpWMLParams.pLeft)
        ? params[EnumSpWMLParams.pLeft]
        : 0.0;
    final double top = params.containsKey(EnumSpWMLParams.pTop)
        ? params[EnumSpWMLParams.pTop]
        : 0.0;
    final double right = params.containsKey(EnumSpWMLParams.pRight)
        ? params[EnumSpWMLParams.pRight]
        : 0.0;
    final double bottom = params.containsKey(EnumSpWMLParams.pBottom)
        ? params[EnumSpWMLParams.pBottom]
        : 0.0;
    return EdgeInsets.fromLTRB(left, top, right, bottom);
  }

  /// If true, this widget is constrained.
  bool _isEnableConstrains() {
    return params.containsKey(EnumSpWMLParams.minHeight) ||
        params.containsKey(EnumSpWMLParams.minWidth) ||
        params.containsKey(EnumSpWMLParams.maxHeight) ||
        params.containsKey(EnumSpWMLParams.maxWidth);
  }

  /// get Widget constraints
  BoxConstraints _getConstraints() {
    final double minH = params.containsKey(EnumSpWMLParams.minHeight)
        ? params[EnumSpWMLParams.minHeight]
        : 0.0;
    final double minW = params.containsKey(EnumSpWMLParams.minWidth)
        ? params[EnumSpWMLParams.minWidth]
        : 0.0;
    final double maxH = params.containsKey(EnumSpWMLParams.maxHeight)
        ? params[EnumSpWMLParams.maxHeight]
        : double.infinity;
    final double maxW = params.containsKey(EnumSpWMLParams.maxWidth)
        ? params[EnumSpWMLParams.maxWidth]
        : double.infinity;
    return BoxConstraints(
        minHeight: minH, minWidth: minW, maxHeight: maxH, maxWidth: maxW);
  }

  /// get this element widget.
  Widget getWidget(BuildContext context) {
    throw UnimplementedError();
  }

  /// Wrap if necessary.
  /// * [child] : The child widget.
  Widget _container(Widget child) {
    return Container(
        width: spwmlParams.p.width,
        height: spwmlParams.p.height,
        margin: spwmlParams.p.margin,
        padding: spwmlParams.p.padding,
        color: spwmlParams.p.bgColor,
        child: child);
  }

  /// If true, this widget need transform.
  bool _isEnableTransform() {
    return spwmlParams.p.shiftX != null || spwmlParams.p.shiftX != null;
  }

  /// Wrap if necessary.
  /// * [child] : The child widget.
  Widget _transform(Widget child) {
    if (_isEnableTransform()) {
      return Transform(
          transform: Matrix4.translationValues(
            spwmlParams.p.shiftX ?? 0.0,
            spwmlParams.p.shiftY ?? 0.0,
            0.0,
          ),
          child: child);
    } else {
      return child;
    }
  }

  /// Wrap if necessary.
  /// * [child] : The child widget.
  Widget _constraints(Widget child) {
    if (spwmlParams.p.constrains != null) {
      return ConstrainedBox(
          constraints: spwmlParams.p.constrains!, child: child);
    } else {
      return child;
    }
  }

  /// Wrap if necessary.
  /// * [child] : The child widget.
  Widget _material(Widget child) {
    if (spwmlParams.p.material != null) {
      return Material(
          key: spwmlParams.p.material!.key,
          type: spwmlParams.p.material!.type,
          elevation: spwmlParams.p.material!.elevation,
          color: spwmlParams.p.material!.color,
          shadowColor: spwmlParams.p.material!.shadowColor,
          surfaceTintColor: spwmlParams.p.material!.surfaceTintColor,
          textStyle: spwmlParams.p.material!.textStyle,
          borderRadius: spwmlParams.p.material!.borderRadius,
          shape: spwmlParams.p.material!.shape,
          borderOnForeground: spwmlParams.p.material!.borderOnForeground,
          clipBehavior: spwmlParams.p.material!.clipBehavior,
          animationDuration: spwmlParams.p.material!.animationDuration,
          child: child);
    } else {
      return child;
    }
  }

  /// Wrap if necessary.
  /// * [child] : The child widget.
  Widget _expand(Widget child) {
    if (spwmlParams.p.weight != null) {
      return Expanded(flex: spwmlParams.p.weight!, child: child);
    } else {
      return child;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _expand(
        _transform(_material(_constraints(_container(getWidget(context))))));
  }
}
