import 'package:flutter/material.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2021-12-31 23:41:16
///
class BlockElementChild {
  Widget? child;
  Widget getChild() {
    return child ?? Container();
  }
}

class StructureElementChildren {
  List<Widget> children = [];
  List<Widget> getChildren() {
    return children;
  }
}
