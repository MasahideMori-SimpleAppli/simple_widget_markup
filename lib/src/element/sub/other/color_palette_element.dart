import 'package:flutter/material.dart';
import 'package:simple_block_markup_language/simple_block_markup_language.dart';
import 'package:simple_managers/simple_managers.dart';
import '../../../../simple_widget_markup.dart';

///
/// (en) The ColorPalette.
///
/// (ja) ColorPaletteの実装。
///
class ColorPaletteElement extends SpWMLElement {
  final ColorPaletteParamsWrapper elParams;

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
  ColorPaletteElement(
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
          EnumSpWMLElementType.colorPalette,
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
    return "ColorPaletteElement";
  }

  /// initialize parameters
  @override
  ColorPaletteElement initParams() {
    super.initParams();
    elParams.p.type = params.containsKey(EnumSpWMLParams.type)
        ? params[EnumSpWMLParams.type]
        : EnumColorPaletteType.normal;
    elParams.p.hAlign = params.containsKey(EnumSpWMLParams.hAlign)
        ? params[EnumSpWMLParams.hAlign]
        : MainAxisAlignment.start;
    elParams.p.vAlign = params.containsKey(EnumSpWMLParams.vAlign)
        ? params[EnumSpWMLParams.vAlign]
        : MainAxisAlignment.start;
    elParams.p.cellHeight = params.containsKey(EnumSpWMLParams.cellHeight)
        ? params[EnumSpWMLParams.cellHeight]
        : 24.0;
    elParams.p.cellWidth = params.containsKey(EnumSpWMLParams.cellWidth)
        ? params[EnumSpWMLParams.cellWidth]
        : 24.0;
    elParams.p.cellMargin = params.containsKey(EnumSpWMLParams.cellMargin)
        ? params[EnumSpWMLParams.cellMargin]
        : 2;
    elParams.p.vMargin = params.containsKey(EnumSpWMLParams.vMargin)
        ? params[EnumSpWMLParams.vMargin]
        : 12;
    elParams.p.defColor = params.containsKey(EnumSpWMLParams.color)
        ? params[EnumSpWMLParams.color]
        : Colors.black;
    final double? cellBorderWidth =
        params.containsKey(EnumSpWMLParams.cellBorderWidth)
            ? params[EnumSpWMLParams.cellBorderWidth]
            : null;
    final Color? cellBorderColor =
        params.containsKey(EnumSpWMLParams.cellBorderColor)
            ? params[EnumSpWMLParams.cellBorderColor]
            : null;
    elParams.p.colorCellDecoration = elParams.p.colorCellDecoration.copyWith(
      border: Border.all(
        color: cellBorderColor ?? Colors.black,
        width: cellBorderWidth ?? 1.0,
        style: BorderStyle.solid,
      ),
    );
    if ((elParams.p.type == EnumColorPaletteType.circle ||
        elParams.p.type == EnumColorPaletteType.simpleCircle)) {
      elParams.p.colorCellDecoration = elParams.p.colorCellDecoration.copyWith(
        shape: BoxShape.circle,
      );
    }
    // コンテンツテキストが存在する場合、カンマ区切りでカラーに変換。
    if (spwmlParams.p.text != "") {
      List<String> lines = UtilSpBMLLine.split(spwmlParams.p.text);
      List<List<Color>> tiles = [];
      for (String i in lines) {
        List<Color> c = [];
        for (String j in i.split(",")) {
          if (j != "") {
            String t = j.replaceAll(" ", ""); // 半角スペース除去
            t = t.replaceAll("　", ""); // 全角スペース除去
            c.add(
              UtilParams.convertColor(t, lineStart, lineEnd, info) ??
                  Colors.transparent,
            );
          }
        }
        tiles.add(c);
      }
      elParams.p.colorTiles = tiles;
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
    return _ColorPaletteElementWidget(this, elParams.p);
  }

  /// (en) Sets the manager class that manages the state.
  /// Please note that this widget uses
  /// four different namespaces: "SID:A", "SID:R", "SID:G", and "SID:B".
  ///
  /// (ja) 状態を管理するマネージャクラスを設定します。
  /// このウィジェットは、"SID:A"、"SID:R"、"SID:G"、"SID:B"の４種類の名前空間を使用する
  /// ことに注意してください。
  /// * [m] : Manager class.
  /// * [sid] : This element sid.
  void setManager(TextFieldManager m, String sid) {
    elParams.p.manager = m;
    if (elParams.p.manager!.getText("$sid:A") == "") {
      setColor(elParams.p.defColor);
    }
  }

  /// (en) Sets the value. Disabled if the manager class is not set.
  /// The manager class is assigned values from 0 to 255 using
  /// four namespaces: "SID:A", "SID:R", "SID:G", and "SID:B".
  ///
  /// (ja) 値を設定します。マネージャークラスが未設定の場合は無効です。
  /// マネージャークラスには、"SID:A"、"SID:R"、"SID:G"、"SID:B"として
  /// ４つの名前空間を使用して0~255の値が代入されます。
  /// * [v] : Material color name or #AARRGGBB.
  void setValue(String v) {
    final String? sid = getSID();
    if (sid == null || elParams.p.manager == null) {
      return;
    } else {
      final Color? c = UtilParams.convertColor(
        v,
        -1,
        -1,
        SpWMLInfo(
          errorHint:
              "${getClassName()}: The specified color format is invalid.",
        ),
      );
      if (c != null) {
        setColor(c);
      }
    }
  }

  /// (en) Gets the hexadecimal color value.
  /// If the manager class has not been set or there is no value,
  /// null is returned.
  ///
  /// (ja) 16進数のカラーの値を取得します。
  /// マネージャークラスが未設定の場合や、値が無い場合はnullが返ります。
  String? getValue() {
    final String? sid = getSID();
    if (sid == null || elParams.p.manager == null) {
      return null;
    } else {
      return UtilParams.colorToHexString(getColor()!);
    }
  }

  /// (en) Sets the Color. Disabled if the manager class is not set.
  /// The manager class is assigned values from 0 to 255 using
  /// four namespaces: "SID:A", "SID:R", "SID:G", and "SID:B".
  ///
  /// (ja) Colorを設定します。マネージャークラスが未設定の場合は無効です。
  /// マネージャークラスには、"SID:A"、"SID:R"、"SID:G"、"SID:B"として
  /// ４つの名前空間を使用して0~255の値が代入されます。
  /// * [c] : The color.
  void setColor(Color c) {
    final String? sid = getSID();
    if (sid == null || elParams.p.manager == null) {
      return;
    } else {
      elParams.p.setColor(sid, c);
    }
  }

  /// (en) Get the Color.
  /// If the manager class has not been set or there is no value,
  /// null is returned.
  ///
  /// (ja) Colorを取得します。
  /// マネージャークラスが未設定の場合や、値が無い場合はnullが返ります。
  Color? getColor() {
    final String? sid = getSID();
    if (sid == null || elParams.p.manager == null) {
      return null;
    } else {
      final int a = int.tryParse(elParams.p.manager!.getText("$sid:A")) ?? 255;
      final int r = int.tryParse(elParams.p.manager!.getText("$sid:R")) ?? 0;
      final int g = int.tryParse(elParams.p.manager!.getText("$sid:G")) ?? 0;
      final int b = int.tryParse(elParams.p.manager!.getText("$sid:B")) ?? 0;
      return Color.fromARGB(a, r, g, b);
    }
  }

  /// (en) Sets a callback for when the color is changed.
  /// This does not work when changing with setColor etc.
  /// The callback will be triggered when the button or manual text input
  /// is completed (when focus is lost).
  ///
  /// (ja) カラーが変更された際のコールバックを設定します。
  /// コールバックは、ボタンか、テキストの直接入力の完了時（フォーカスが外れた時）に作動します。
  /// * [callback] : The callback.
  void setCallback(void Function(Color c) callback) {
    elParams.p.colorChangeCallback = callback;
  }
}

class _ColorPaletteElementWidget extends StatefulWidget {
  final ColorPaletteElement parent;
  final ColorPaletteParams params;

  const _ColorPaletteElementWidget(this.parent, this.params);

  @override
  State<_ColorPaletteElementWidget> createState() =>
      _ColorPaletteElementWidgetState();
}

class _ColorPaletteElementWidgetState
    extends State<_ColorPaletteElementWidget> {
  //　フォーカスが外れた時のコールバックを設定します。これは値が確定した場合に反映されます。
  void _setFocusOutCallback(String argb) {
    final String? sid = widget.parent.getSID();
    final TextFieldManager? tfm = widget.parent.elParams.p.manager;
    if (sid == null || tfm == null) {
      return;
    } else {
      final String target = "$sid:$argb";
      final FocusNode node = tfm.getFocus(target);
      node.addListener(() {
        if (mounted) {
          if (!node.hasFocus) {
            setState(() {
              if (argb == "A") {
                final int? newV = int.tryParse(tfm.getText(target));
                if (newV == null) {
                  tfm.setText(target, "255");
                }
              } else {
                final int? newV = int.tryParse(tfm.getText(target));
                if (newV == null) {
                  tfm.setText(target, "0");
                }
              }
              final Color? c = widget.parent.getColor();
              if (c != null) {
                if (widget.params.colorChangeCallback != null) {
                  widget.params.colorChangeCallback!(c);
                }
              }
            });
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String? sid = widget.parent.getSID();
    final TextFieldManager? tfm = widget.parent.elParams.p.manager;
    if (sid == null || tfm == null) {
      return const SizedBox();
    } else {
      for (String i in ["A", "R", "G", "B"]) {
        _setFocusOutCallback(i);
      }
      final Color c = widget.parent.getColor()!;
      List<Widget> palletWidget = [];
      switch (widget.params.type) {
        case EnumColorPaletteType.normal:
        case EnumColorPaletteType.circle:
          palletWidget.addAll(_getARGBEditField(tfm, c, sid));
          palletWidget.add(SizedBox(height: widget.params.vMargin));
          palletWidget.addAll(_getColorTiles());
          return Column(
            mainAxisAlignment: widget.params.vAlign,
            children: palletWidget,
          );
        case EnumColorPaletteType.simple:
        case EnumColorPaletteType.simpleCircle:
          palletWidget.addAll(_getColorTiles());
          return Column(
            mainAxisAlignment: widget.params.vAlign,
            children: palletWidget,
          );
        case EnumColorPaletteType.text:
          palletWidget.addAll(_getARGBEditField(tfm, c, sid));
          return Column(
            mainAxisAlignment: widget.params.vAlign,
            children: palletWidget,
          );
      }
    }
  }

  List<Widget> _getColorTiles() {
    List<Widget> r = [];
    for (List<Color> i in widget.params.colorTiles) {
      r.add(
        Container(
          margin: EdgeInsets.fromLTRB(
            0,
            r.isEmpty ? 0 : widget.params.cellMargin,
            0,
            0,
          ),
          child: Row(
            mainAxisAlignment: widget.params.hAlign,
            children: _getColorBtns(i),
          ),
        ),
      );
    }
    return r;
  }

  List<Widget> _getARGBEditField(TextFieldManager tfm, Color c, String sid) {
    return [
      // カラーパレットの色確認と入力ゾーン
      Row(
        mainAxisAlignment: widget.params.hAlign,
        children: [
          Container(
            width: 56,
            height: 30,
            margin: const EdgeInsets.fromLTRB(0, 20, 12, 0),
            decoration: BoxDecoration(
              color: c,
              border: Border.all(
                color: Colors.black,
                width: 1.0,
                // solid only
                style: BorderStyle.solid,
              ),
              shape: BoxShape.rectangle,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            width: 48,
            child: TextField(
              controller: tfm.getCtrl("$sid:A"),
              focusNode: tfm.getFocus("$sid:A"),
              maxLines: 1,
              keyboardType: TextInputType.number,
              inputFormatters: EnumTextFieldInputType.intOnly
                  .toTextInputFormatter(null, 255),
              style: const TextStyle(fontSize: 14),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 12, 0, 8),
                labelText: "A",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            width: 48,
            child: TextField(
              controller: tfm.getCtrl("$sid:R"),
              focusNode: tfm.getFocus("$sid:R"),
              maxLines: 1,
              keyboardType: TextInputType.number,
              inputFormatters: EnumTextFieldInputType.intOnly
                  .toTextInputFormatter(null, 255),
              style: const TextStyle(fontSize: 14),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 12, 0, 8),
                labelText: "R",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            width: 48,
            child: TextField(
              controller: tfm.getCtrl("$sid:G"),
              focusNode: tfm.getFocus("$sid:G"),
              maxLines: 1,
              keyboardType: TextInputType.number,
              inputFormatters: EnumTextFieldInputType.intOnly
                  .toTextInputFormatter(null, 255),
              style: const TextStyle(fontSize: 14),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 12, 0, 8),
                labelText: "G",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            width: 48,
            child: TextField(
              controller: tfm.getCtrl("$sid:B"),
              focusNode: tfm.getFocus("$sid:B"),
              maxLines: 1,
              keyboardType: TextInputType.number,
              inputFormatters: EnumTextFieldInputType.intOnly
                  .toTextInputFormatter(null, 255),
              style: const TextStyle(fontSize: 14),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 12, 0, 8),
                labelText: "B",
              ),
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> _getColorBtns(List<Color> colors) {
    List<Widget> r = [];
    for (Color i in colors) {
      r.add(_getColorBtn(i, i == colors.last));
    }
    return r;
  }

  Widget _getColorBtn(Color c, bool isLast) {
    return GestureDetector(
      onTap: () {
        if (mounted) {
          setState(() {
            widget.parent.setColor(c);
            if (widget.params.colorChangeCallback != null) {
              widget.params.colorChangeCallback!(c);
            }
          });
        }
      },
      child: Container(
        width: widget.params.cellWidth,
        height: widget.params.cellHeight,
        margin: isLast
            ? const EdgeInsets.fromLTRB(0, 0, 0, 0)
            : EdgeInsets.fromLTRB(0, 0, widget.params.cellMargin, 0),
        decoration: widget.params.colorCellDecoration.copyWith(color: c),
      ),
    );
  }
}
