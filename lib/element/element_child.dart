import 'package:flutter/material.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-31 23:41:16
///
class BlockElementChild {
  Widget? child;

  /// return child or container.
  Widget getChild() {
    return child ?? Container();
  }
}

class StructureElementChildren {
  List<Widget> children = [];

  /// return children or empty list.
  List<Widget> getChildren() {
    return children;
  }
}
