import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';
import '../../../../simple_widget_markup.dart';

///
/// (en) The split.
/// This is an SpWML-specific class that creates a block with two children that can be dragged
/// around the screen to change its proportions.
///
/// (ja) splitの実装。
/// これはSpWML固有のクラスで、画面上でドラッグすると比率を変更できる、２つの子を持つブロックを作成します。
///
class SplitElement extends MultiChildElement {
  final SplitParamsWrapper elParams;

  ///
  /// * [serial] : Array Index.
  /// * [params] : Element parameters.
  /// * [spwmlParams] : The spwml element parameters.
  /// * [parentSerial] : Parent Element serial.
  /// * [lineStart] : line info for the Error handling.
  /// * [lineEnd] : line info for the Error handling.
  /// * [style] : Font styles.
  /// * [info] : SpWML info.
  /// * [children] : This element children.
  /// * [elParams] : This element parameters.
  ///
  /// Throws [SpWMLException] : ParamException.
  ///
  /// Throws [SpWMLException] : ParamValueException.
  SplitElement(
    int serial,
    Map<String, String> params,
    SpWMLParamsWrapper spwmlParams,
    int parentSerial,
    int lineStart,
    int lineEnd,
    SpWMLFontStyle style,
    SpWMLInfo? info,
    StructureElementChildren children,
    this.elParams, {
    super.key,
  }) : super(
          serial,
          EnumSpWMLElementType.split,
          params,
          spwmlParams,
          parentSerial,
          lineStart,
          lineEnd,
          style,
          info,
          children,
        );

  /// Get this class name.
  @override
  String getClassName() {
    return "SplitElement";
  }

  /// Initialize the parameters.
  @override
  SplitElement initParams() {
    super.initParams();
    elParams.p.axis = params.containsKey(EnumSpWMLParams.axis)
        ? params[EnumSpWMLParams.axis]!
        : Axis.horizontal;
    elParams.p.color = params.containsKey(EnumSpWMLParams.color)
        ? params[EnumSpWMLParams.color]
        : Colors.grey;
    elParams.p.barSize = params.containsKey(EnumSpWMLParams.barSize)
        ? params[EnumSpWMLParams.barSize]!
        : SplitParams.defBarSize;
    elParams.p.clampMin = params.containsKey(EnumSpWMLParams.clampMin)
        ? params[EnumSpWMLParams.clampMin]!
        : SplitParams.defClampMin;
    elParams.p.clampMax = params.containsKey(EnumSpWMLParams.clampMax)
        ? params[EnumSpWMLParams.clampMax]!
        : SplitParams.defClampMax;
    elParams.p.splitPane1MinPx =
        params.containsKey(EnumSpWMLParams.splitPane1MinPx)
            ? params[EnumSpWMLParams.splitPane1MinPx]!
            : null;
    elParams.p.splitPane2MinPx =
        params.containsKey(EnumSpWMLParams.splitPane2MinPx)
            ? params[EnumSpWMLParams.splitPane2MinPx]!
            : null;
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
    return _SplitElementWidget(
      sid: getSID()!,
      elParams: elParams,
      children: children,
      key: elParams.p.key,
    );
  }

  /// (en) Set a left or top widget ratio.
  ///
  /// (ja) 左、または上側のウィジェットの比率を設定します。
  ///
  /// * [ratio]: The split bar position (0.0 ~ 1.0).
  void setRatio(double ratio) {
    String? sid = getSID();
    if (sid != null && elParams.p.manager != null) {
      elParams.p.manager!.setValue(sid, ratio);
    }
  }

  /// (en) Specifies the open/close range of the center bar.
  ///
  /// (ja) 中央のバーの開閉範囲を指定します。
  ///
  /// * [min]: The ratio of minimum clamp (0.0 ~ 1.0).
  /// * [min]: The ratio of maximum clamp (0.0 ~ 1.0).
  void setClamp(double min, double max) {
    elParams.p.clampMin = min;
    elParams.p.clampMax = max;
  }

  /// (en) Specify the minimum size of the left and right or top and
  /// bottom areas.
  ///
  /// (ja) 左右または上下の領域の最小のサイズを指定します。
  ///
  /// * [splitPane1MinPx] : The minimum size of the left or top area (px).
  /// Entering null will disable the correction.
  /// * [splitPane2MinPx] : The minimum size of the right or bottom area (px).
  /// Entering null will disable the correction.
  void setSplitPaneMinPx(double? splitPane1MinPx, double? splitPane2MinPx) {
    elParams.p.splitPane1MinPx = splitPane1MinPx;
    elParams.p.splitPane2MinPx = splitPane2MinPx;
  }

  /// (en) Sets a callback for when the center bar position changes.
  ///
  /// (ja) 中央のバーの位置が変化した時のコールバックを設定します。
  /// * [onChanged] : callback.
  void setOnChanged(void Function(double) onChanged) {
    elParams.p.onChanged = onChanged;
  }

  /// (en) Sets the manager class that manages the state.
  ///
  /// (ja) 状態を管理するマネージャクラスを設定します。
  /// * [m] : Manager class.
  /// * [sid] : This element sid.
  void setManager(ValueManager m, String sid) {
    elParams.p.manager = m;
    elParams.p.manager!.getValue(sid, initialValue: SplitParams.defSplitRatio);
  }
}

class _SplitElementWidget extends StatefulWidget {
  final String sid;
  final SplitParamsWrapper elParams;
  final StructureElementChildren children;

  const _SplitElementWidget({
    required this.sid,
    required this.elParams,
    required this.children,
    super.key,
  });

  @override
  State<_SplitElementWidget> createState() => _SplitElementWidgetState();
}

class _SplitElementWidgetState extends State<_SplitElementWidget> {
  /// ウィジェットのサイズ計算のための共通処理。
  /// 最小サイズはレイアウト方向を基準とし、size1がsize2よりも優先されます。
  ///
  /// * [available]: 利用可能な全体のサイズ（幅 or 高さ）
  /// * [ratio]: 分割比率（0.0～1.0）
  /// * [min1]: 上/左の最小サイズ
  /// * [min2]: 下/右の最小サイズ
  ///
  /// Returns : [size1, size2].
  List<double> _adjustSplitSizes({
    required double available,
    required double ratio,
    double? min1,
    double? min2,
  }) {
    double size1 = available * ratio;
    double size2 = available - size1;
    // 条件分岐。基本的にsize1が優先されるよう計算する。
    if (min1 != null && min2 != null) {
      if (min2 > size2) {
        size1 = available - min2;
        size2 = min2;
      }
      if (min1 > size1) {
        size1 = min1;
        size2 = available - size1;
      }
    } else if (min1 != null && min2 == null) {
      if (min1 > size1) {
        size1 = min1;
        size2 = available - size1;
      }
    } else if (min1 == null && min2 != null) {
      if (min2 > size2) {
        size1 = available - min2;
        size2 = min2;
      }
    }
    if (size1 < 0) size1 = 0;
    if (size2 < 0) size2 = 0;
    return [size1, size2];
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = widget.children.getChildren();
    final double ratio = widget.elParams.p.manager!.getValue(widget.sid) ??
        SplitParams.defSplitRatio;
    if (children.length < 2) {
      if (children.isEmpty) {
        return Container(key: widget.key);
      } else {
        return Container(key: widget.key, child: children.first);
      }
    } else {
      if (widget.elParams.p.axis == Axis.horizontal) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final double availableWidth =
                constraints.maxWidth - widget.elParams.p.barSize;
            final sizes = _adjustSplitSizes(
              available: availableWidth,
              ratio: ratio,
              min1: widget.elParams.p.splitPane1MinPx,
              min2: widget.elParams.p.splitPane2MinPx,
            );
            final leftW = sizes[0];
            final rightW = sizes[1];
            return Row(
              key: widget.key,
              children: [
                SizedBox(width: leftW, child: children[0]),
                _getSplitBarHorizontal(availableWidth, ratio),
                SizedBox(width: rightW, child: children[1]),
              ],
            );
          },
        );
      } else {
        return LayoutBuilder(
          builder: (context, constraints) {
            final double availableHeight =
                constraints.maxHeight - widget.elParams.p.barSize;
            final sizes = _adjustSplitSizes(
              available: availableHeight,
              ratio: ratio,
              min1: widget.elParams.p.splitPane1MinPx,
              min2: widget.elParams.p.splitPane2MinPx,
            );
            final topH = sizes[0];
            final bottomH = sizes[1];
            return Column(
              key: widget.key,
              children: [
                SizedBox(height: topH, child: children[0]),
                _getSplitBarVertical(availableHeight, ratio),
                SizedBox(height: bottomH, child: children[1]),
              ],
            );
          },
        );
      }
    }
  }

  /// 子ビューが水平方向に配置される場合。
  Widget _getSplitBarHorizontal(double maxSize, double ratio) {
    return MouseRegion(
      cursor: widget.elParams.p.cursor,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onHorizontalDragUpdate: (details) {
          setState(() {
            ratio += details.delta.dx / maxSize;
            ratio = ratio.clamp(
              widget.elParams.p.clampMin,
              widget.elParams.p.clampMax,
            );
            if (widget.elParams.p.manager != null) {
              widget.elParams.p.manager!.setValue(widget.sid, ratio);
            }
            widget.elParams.p.onChanged(ratio);
          });
        },
        child: Container(
          width: widget.elParams.p.barSize,
          color: widget.elParams.p.color,
        ),
      ),
    );
  }

  Widget _getSplitBarVertical(double maxSize, double ratio) {
    return MouseRegion(
      cursor: widget.elParams.p.cursor,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onVerticalDragUpdate: (details) {
          setState(() {
            ratio += details.delta.dy / maxSize;
            ratio = ratio.clamp(
              widget.elParams.p.clampMin,
              widget.elParams.p.clampMax,
            );
            if (widget.elParams.p.manager != null) {
              widget.elParams.p.manager!.setValue(widget.sid, ratio);
            }
            widget.elParams.p.onChanged(ratio);
          });
        },
        child: Container(
          height: widget.elParams.p.barSize,
          color: widget.elParams.p.color,
        ),
      ),
    );
  }
}
