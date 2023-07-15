import 'package:flutter/material.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-31 23:41:16
///
class BlockElementChild {
  /// The child element.
  Widget? child;

  /// return child or container.
  Widget getChild() {
    return child ?? Container();
  }
}

class StructureElementChildren {
  /// List of child elements of this class.
  List<Widget> children = [];

  /// return children or empty list.
  List<Widget> getChildren() {
    return children;
  }
}
