# simple_widget_markup

(en)Japanese ver is [here](https://github.com/MasahideMori-SimpleAppli/simple_widget_markup/blob/main/README_JA.md).  
(ja)この解説の日本語版は[ここ](https://github.com/MasahideMori-SimpleAppli/simple_widget_markup/blob/main/README_JA.md)にあります。

## Overview
This package is a practical Flutter (Dart) implementation of the Simple Widget Markup Language (SpWML).  
SpWML allows for users to create statically flutter layout.
It also reduces the amount of program code required and often speeds up compilation.
Files output in SpWML have the extension .spwml.

## Usage
### Quick Start
Below is detailed documentation.  
[SpWML documentation](https://masahidemori-simpleappli.github.io/spwml_docs/index.html)

You can try how it works on the following sites.  
[SpWML Editor](https://simple-widget-markup-editor.web.app/)

### Sample code
```dart
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
      title: 'SpWML Example',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SpWMLSample(title: 'SpWML Example'),
    );
  }
}

class SpWMLSample extends StatefulWidget {
  const SpWMLSample({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SpWMLSample> createState() => _SpWMLSampleState();
}

class _SpWMLSampleState extends State<SpWMLSample> {

  Widget _getSpWMLWidget(BuildContext context){
    return SpWMLBuilder("(h1)Example text").build(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: _getSpWMLWidget(context)
    );
  }
}

```

### Example of using inline elements
Please rewrite _getSpWMLWidget in Sample code as follows.
```dart
  Widget _getSpWMLWidget(BuildContext context){
    return SpWMLBuilder("(span)\n"
            "+(h1,fontWeight:bold)Example\n"
            "+(h1,textColor:#FF0000)text").build(context);
  }
```

### Cooperation with Widget
Please rewrite _getSpWMLWidget in Sample code as follows.
```dart
  Widget _getSpWMLWidget(BuildContext context) {
    SpWMLBuilder builder = SpWMLBuilder("(h1)Replace below this text.\n"
            "(block, sid:button_name)");
    builder.replace(
            "button_name",
            OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("The button was pressed."),
                        duration: Duration(seconds: 3),
                      ));
                    },
                    child: const Text("Flutter button")));
    return builder.build(context);
  }
```

### Customize basic design
Please rewrite _getSpWMLWidget in Sample code as follows.
```dart
  Widget _getSpWMLWidget(BuildContext context) {
    SpWMLFontStyle fontStyle1 = SpWMLFontStyle();
    SpWMLFontStyle fontStyle2 = fontStyle1.deepCopy();
    fontStyle2.styleMap[EnumSpWMLElementType.h1]!.fontWeight =
            EnumFontWeight.light;
    return Column(
      children: [
        SpWMLBuilder("(h1)Example text1", spWMLStyle: fontStyle1).build(context),
        SpWMLBuilder("(h1)Example text2", spWMLStyle: fontStyle2).build(context),
      ],
    );
  }
```
The style can also be saved as a JSON file.  
You can create a Map with toDict and restore it with fromDict.  
Please consider if necessary.  
```dart
  SpWMLFontStyle test = SpWMLFontStyle.fromDict(fontStyle1.toDict());
```

### If you do not change the internal elements
It can be written more easily using the following wrapper widget.
Please rewrite _getSpWMLWidget in Sample code as follows.
```dart
  Widget _getSpWMLWidget(BuildContext context) {
    return SpWML("(h1)Example text");
  }
```

## Support
If you need paid support for any reason, please contact my company.  
This package is developed by me personally, but may be supported via the company.  
[SimpleAppli Inc.](https://simpleappli.com/en/index_en.html)

## Format name
Simple Widget Markup Language

## Extension
.spwml

## MIME Type (Temporary)
text/x.spwml

## About version control
The C part will be changed at the time of version upgrade.
- Changes such as adding variables, structure change that cause problems when reading previous files.
  - C.X.X
- Adding methods, etc.
  - X.C.X
- Minor changes and bug fixes.
  - X.X.C

## License
This software is released under the MIT License, see LICENSE file.

## Copyright notice
The “Dart” name and “Flutter” name are trademarks of Google LLC.  
*The developer of this package is not Google LLC.