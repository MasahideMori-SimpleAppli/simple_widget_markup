import 'package:flutter/material.dart';

///
/// (en) Class for storing a single child of a block.
///
/// (ja) ブロックの単一の子を格納するためのクラス。
///
class BlockElementChild {
  /// The child element.
  Widget? child;

  /// return child or container.
  Widget getChild() {
    return child ?? Container();
  }
}

///
/// (en) Class for storing multiple children of a struct.
///
/// (ja) 構造体の複数の子を格納するためのクラス。
///
class StructureElementChildren {
  /// List of child elements of this class.
  List<Widget> children = [];

  /// return children or empty list.
  List<Widget> getChildren() {
    return children;
  }
}
