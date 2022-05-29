# simple_widget_markup

(en)Japanese ver is [here](https://github.com/MasahideMori-SimpleAppli/simple_widget_markup/blob/main/README_JA.md).  
(ja)この解説の日本語版は[ここ](https://github.com/MasahideMori-SimpleAppli/simple_widget_markup/blob/main/README_JA.md)にあります。

## Overview
This package is a practical Flutter (Dart) implementation of the Simple Widget Markup Language (SpWML).  
SpWML is a markup language that makes it easy to handle widgets (a block of certain elements).  
Files output in this format have the extension .spwml.  
This specification is mainly intended to be able to describe the contents easily and lightly when new information is delivered in the application.  
It also focuses on ease of learning.  

## Usage
### Quick Start
You can try how it works on the following sites.  
[SpWML Editor](https://simple-widget-markup-editor.web.app/)

### Description method
The basic form is as follows.
```
(type, parameter1:value1, parameter2:value2,...)letter body
```

The comment line is as follows.
```
// comment text
```

type is required and parameters are optional.  
The parameters are explained in detail on the SpWML editor page in the quickstart above.  

Currently, the types are as follows.

- Container system (Container is a container for elements.)
  - Only one element inside.
    - block (basic container. Can also be used for temporary placement for replacement.)
    - scroll (A container that can be scrolled inside.)
    - card
  - Multiple elements inside.
    - col (The Container with rows inside.)
    - row (The Container with columns inside.)
    - span (The Container with text or href inside. Different parameters can be set for each element in the line.)
    - stack(The Container that can be superposed inside.)
    - wrap(The container whose inside is a so-called grid view.)
    - expTile(The container whose inside is a so-called accordion menu.)
    - dropdownBtn(The container whose inside is a so-called dropdown menu. Callback is set by DropdownBtnElement.setCallback from the program code side.)
    - popupMenuBtn(The container whose inside is a so-called popup menu. Callback is set by PopupMenuBtnElement.setCallback from the program code side.)

- Elements in the container
  - text system
    - h1-h6 (header text. 6 types of h1-h6.)
    - subtitle1
    - subtitle2
    - body1 (It works even if you write "text". Normal text.)
    - body2
    - caption
    - overline (Text to display above the line.)
    - menu(Plane text for dropdownBtn and popupMenuBtn.)
  - Other than text
    - img (Image. URL is described in the text part.)
    - href (Hyperlinks are written in the text part. The appearance can be changed with the alt parameter.)
    - line (Horizontal divider)
    - vline(Vertical divider)
    - btn
    - icon
    - switchBtn

### new line
Start a new line with a normal line feed code.  
Line breaks at the end of the sentence are ignored.

### Nested structure
Elements with a + mark at the beginning are nested elements.  
Which element is a child element depends on the position of the element and the number of + marks.

### Escape sequence
To include the + sign, parentheses, commas, and backslash in the text, put one backslash in front of it.  
Note that if you write directly as text in the code instead of reading the file,  
the backslash itself will be you will need one extra to receive the Dart escape.

### Sample code
```dart
import 'package:flutter/material.dart';
import 'package:simple_widget_markup/spwml_builder.dart';

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
            "(block, id:1)");
    builder.replaceID(
            1,
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
  SpWMLFontStyle fontStyle2 = SpWMLFontStyleMaterial();
  SpWMLFontStyle userCustomFontStyle = SpWMLFontStyle(h1Size: 48);
  return Column(
    children: [
      SpWMLBuilder("(h1)Example text", spWMLStyle: fontStyle1).build(context),
      SpWMLBuilder("(h1)Example text", spWMLStyle: fontStyle2).build(context),
      SpWMLBuilder("(h1)Example text", spWMLStyle: userCustomFontStyle)
              .build(context),
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

## What this object is useful for
It is suitable for things that need to be created frequently and the layout is not so complicated,
such as new information of apps.

## What this object is not useful
Not suitable for direct coding of complex app layouts.  
However, it is possible to create a wire frame that is premised on replacement.

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