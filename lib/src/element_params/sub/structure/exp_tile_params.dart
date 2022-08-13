import 'package:flutter/material.dart';

class ExpTileParamsWrapper {
  ExpTileParams p;

  /// * [p] : The parameter set.
  ExpTileParamsWrapper(this.p);
}

class ExpTileParams {
  Key? key;
  Widget? leading;
  Widget? title;
  Widget? subtitle;
  void Function(bool)? onExpansionChanged;
  List<Widget>? children;
  Widget? trailing;
  bool initiallyExpanded = false;
  bool maintainState = false;
  EdgeInsetsGeometry? tilePadding;
  CrossAxisAlignment? expandedCrossAxisAlignment;
  Alignment? expandedAlignment;
  EdgeInsetsGeometry? childrenPadding;
  Color? backgroundColor;
  Color? collapsedBackgroundColor;
  Color? textColor;
  Color? collapsedTextColor;
  Color? iconColor;
  Color? collapsedIconColor;
  ListTileControlAffinity? controlAffinity;
}
