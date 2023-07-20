import 'package:flutter/material.dart';
import 'package:simple_widget_markup/simple_widget_markup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // This is how it is used when embedding SpWML.
  // Since SpWML is text, you can also load what you have saved as an asset.
  // It can also be downloaded from the server and displayed.
  static const String _layout =
      "(h3)Hello SpWML!\n(row, hAlign:right, mT:20)\n+(overline)2023/07/20 (Thu.)\n(line)\n(h5)*Language specifications and latest version information\n(text)The core of this project, Simple Widget Markup Language, is open source.\nThe latest information and source code can be found at the following URL.\nAlso, the Flutter package is available.\n(h6)Flutter package\n(href)https://pub.dev/packages/simple_widget_markup\n(h6)Github\n(href)https://github.com/MasahideMori-SimpleAppli/simple_widget_markup\n(h5, mT:48)*Below is some practice code for first-time users.\n(h6)The button operation sample\n// Sample to make a button work with Dart code\n(btn, sid:show_dialog, mT:20, type: elevated, textColor:white, h:32, w:180) Show dialog";

  @override
  Widget build(BuildContext context) {
    SpWMLBuilder builder = SpWMLBuilder(_layout);
    BtnElement btnElement = builder.getElement("show_dialog") as BtnElement;
    btnElement.setCallback(() {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
                title:
                    SizedBox(height: 64, child: SpWML('(h2, mT:0)Good job!')),
                content: SizedBox(
                  height: 196,
                  child: SpWML(
                      "(h4, mT:0)Achievement\n(text)* You have mastered basic SpWML usage.\n* You learned how to access SpWML programmatically.\n(text)Please use SpWML for your wonderful work!\nThank you!"),
                ));
          });
    });
    return Scaffold(body: SafeArea(child: builder.build(context)));
  }
}
