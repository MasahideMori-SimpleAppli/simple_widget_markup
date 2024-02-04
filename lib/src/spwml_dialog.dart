import 'package:flutter/material.dart';

import '../simple_widget_markup.dart';

///
/// (en) A class for creating dialogs using SpWML.
///
/// (ja) SpWMLを使ってダイアログを作成するためのクラスです。
///
class SpWMLDialog extends StatefulWidget {
  final SpWMLBuilder b;
  final Widget title;
  final double width;
  final Widget? cancelBtnText;
  final Widget? okBtnText;
  final void Function(Function dialogClose)? cancelBtnCallback;
  final void Function(Function dialogClose)? okBtnCallback;

  /// * [b] : Dialog content.
  /// * [title] : Dialog title. e.g. text widget.
  /// * [width] : Dialog width.
  /// * [cancelBtnText] : Cancel button text. if this and cancelBtnCallback is null, not create cancel button.
  /// if this is null and cancelBtnCallback is not null, auto set Text('Cancel').
  /// * [okBtnText] : OK button text. if this and okBtnCallback is null, not create ok button.
  /// if this is null and okBtnCallback is not null, auto set Text('OK').
  /// * [cancelBtnCallback] : Cancel button callback function. if this and cancelBtnText is null, not create cancel button.
  /// * [okBtnCallback] : OK button callback function. if this and okBtnText is null, not create ok button.
  const SpWMLDialog(this.b, this.title, this.width,
      {this.cancelBtnText,
      this.okBtnText,
      this.cancelBtnCallback,
      this.okBtnCallback,
      super.key});

  @override
  SpWMLDialogState createState() => SpWMLDialogState();
}

class SpWMLDialogState extends State<SpWMLDialog> {
  // get action buttons
  List<Widget> _getActions(BuildContext context) {
    List<Widget> r = [];
    if (widget.cancelBtnCallback != null || widget.cancelBtnText != null) {
      r.add(TextButton(
        child: widget.cancelBtnText ?? const Text('Cancel'),
        onPressed: () {
          if (widget.cancelBtnCallback != null) {
            widget.cancelBtnCallback!(() {
              Navigator.pop(context);
            });
          }
        },
      ));
    }
    if (widget.okBtnCallback != null || widget.okBtnText != null) {
      r.add(TextButton(
        child: widget.okBtnText ?? const Text('OK'),
        onPressed: () {
          if (widget.okBtnCallback != null) {
            widget.okBtnCallback!(() {
              Navigator.pop(context);
            });
          }
        },
      ));
    }
    return r;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: widget.title,
      content: SizedBox(width: widget.width, child: widget.b.build(context)),
      actions: _getActions(context),
    );
  }
}