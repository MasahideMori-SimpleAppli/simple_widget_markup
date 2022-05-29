import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_widget_markup/element/sub/button/btn_element.dart';
import 'package:simple_widget_markup/spwml_builder.dart';
import 'package:url_launcher/url_launcher.dart';

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
  String? _layout;

  // for directly in the code.
  // String _layout = SpWMLLayout.layout;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    // This sample describes a flexible pattern for fast development.
    // However, it is also possible to embed SpWML code directly in the code.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final String layoutData =
          await rootBundle.loadString('/layout/layout_name.spwml');
      setState(() {
        _layout = layoutData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_layout == null) {
      return const Scaffold(
          body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ));
    } else {
      SpWMLBuilder builder = SpWMLBuilder(_layout);
      BtnElement btnElement = builder.getElementByID(1) as BtnElement;
      btnElement.setBtnCallback(() async {
        final Uri uri =
            Uri.parse("https://simple-widget-markup-editor.web.app/");
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("The specified URL could not be opened."),
            duration: Duration(seconds: 3),
          ));
        }
      });
      return Scaffold(body: SafeArea(child: builder.build(context)));
    }
  }
}
