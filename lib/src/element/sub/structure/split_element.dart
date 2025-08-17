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
      this.elParams,
      {super.key})
      : super(serial, EnumSpWMLElementType.split, params, spwmlParams,
            parentSerial, lineStart, lineEnd, style, info, children);

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
    // SIDが設定されていなければエラー。
    if (getSID() == null) {
      throw SpWMLException(EnumSpWMLExceptionType.sidDoesNotExistException,
          lineStart, lineEnd, info);
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
  void setRatio(double ratio) {
    String? sid = getSID();
    if (sid != null && elParams.p.manager != null) {
      elParams.p.manager!.setValue(sid, ratio);
    }
  }

  /// (en) Specifies the open/close range of the center bar.
  ///
  /// (ja) 中央のバーの開閉範囲を指定します。
  void setClamp(double min, double max) {
    elParams.p.clampMin = min;
    elParams.p.clampMax = max;
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

  const _SplitElementWidget(
      {required this.sid,
      required this.elParams,
      required this.children,
      super.key});

  @override
  State<_SplitElementWidget> createState() => _SplitElementWidgetState();
}

class _SplitElementWidgetState extends State<_SplitElementWidget> {
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
        return LayoutBuilder(builder: (context, constraints) {
          final double availableWidth =
              constraints.maxWidth - widget.elParams.p.barSize;
          final double leftW = availableWidth * ratio;
          final double rightW = availableWidth * (1 - ratio);
          return Row(key: widget.key, children: [
            SizedBox(width: leftW, child: children[0]),
            _getSplitBarHorizontal(availableWidth, ratio),
            SizedBox(width: rightW, child: children[1])
          ]);
        });
      } else {
        return LayoutBuilder(builder: (context, constraints) {
          final double availableHeight =
              constraints.maxHeight - widget.elParams.p.barSize;
          final double topH = availableHeight * ratio;
          final double bottomH = availableHeight * (1 - ratio);
          return Column(key: widget.key, children: [
            SizedBox(height: topH, child: children[0]),
            _getSplitBarVertical(availableHeight, ratio),
            SizedBox(height: bottomH, child: children[1])
          ]);
        });
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
                  widget.elParams.p.clampMin, widget.elParams.p.clampMax);
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
        ));
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
                  widget.elParams.p.clampMin, widget.elParams.p.clampMax);
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
        ));
  }
}
