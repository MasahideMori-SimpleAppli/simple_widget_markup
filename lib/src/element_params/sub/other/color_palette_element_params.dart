import 'package:flutter/material.dart';
import 'package:simple_managers/simple_managers.dart';

///
/// (en) A wrapper class for parameters used in classes with the same prefix name (XXXParamsWrapper of X).
///
/// (ja) 接頭名(XXXParamsWrapper of X)が同じクラスで利用するパラメータ用ラッパークラス。
///
class ColorPaletteParamsWrapper {
  ColorPaletteParams p;

  /// * [p] : The parameter set.
  ColorPaletteParamsWrapper(this.p);
}

///
/// (en) A class for holding parameters that are used in classes with the same prefix name (XXXParams of X).
///
/// (ja) 接頭名(XXXParams of X)が同じクラスで利用するパラメータを保持するためのクラス。
///
class ColorPaletteParams {
  Key? key;
  TextFieldManager? manager;
  // default color
  Color defColor = Colors.black;
  double colorCellWidth = 24;
  double colorCellHeight = 24;
  double colorCellMargin = 2;
  BoxDecoration colorCellDecoration = BoxDecoration(
    border: Border.all(
      color: Colors.black,
      width: 1.0,
      style: BorderStyle.solid,
    ),
    shape: BoxShape.rectangle,
  );
  List<Color> colorLine1 = [
    Colors.black,
    Colors.grey[300]!,
    Colors.white,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
  ];
  List<Color> colorLine2 = [
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
  ];
  void Function(Color c)? colorChangeCallback;

  /// (en) Sets the Color. Disabled if the manager class is not set.
  /// The manager class is assigned values from 0 to 255 using
  /// four namespaces: "SID:A", "SID:R", "SID:G", and "SID:B".
  ///
  /// (ja) Colorを設定します。マネージャークラスが未設定の場合は無効です。
  /// マネージャークラスには、"SID:A"、"SID:R"、"SID:G"、"SID:B"として
  /// ４つの名前空間を使用して0~255の値が代入されます。
  /// * [sid] : Serial ID.
  /// * [c] : The color.
  void setColor(String sid, Color c) {
    if (manager == null) {
      return;
    } else {
      manager!.setText("$sid:A", c.alpha.toString());
      manager!.setText("$sid:R", c.red.toString());
      manager!.setText("$sid:G", c.green.toString());
      manager!.setText("$sid:B", c.blue.toString());
    }
  }

  /// (en) Sets a color value for the specified manager according to
  /// the color palette specifications.
  /// The manager class is assigned values from 0 to 255 using
  /// four namespaces: "SID:A", "SID:R", "SID:G", and "SID:B".
  ///
  /// (ja) 指定されたマネージャーに対して、カラーパレットの仕様に沿ったカラー値を設定します。
  /// マネージャークラスには、"SID:A"、"SID:R"、"SID:G"、"SID:B"として
  /// ４つの名前空間を使用して0~255の値が代入されます。
  /// * [manager] : TextFieldManager.
  /// * [sid] : Serial ID.
  /// * [c] : The color.
  static void setColorToTFM(TextFieldManager manager, String sid, Color c) {
    manager.setText("$sid:A", c.alpha.toString());
    manager.setText("$sid:R", c.red.toString());
    manager.setText("$sid:G", c.green.toString());
    manager.setText("$sid:B", c.blue.toString());
  }
}
