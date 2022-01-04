# simple_widget_markup

(en)Japanese ver is [here](https://github.com/MasahideMori-SimpleAppli/simple_widget_markup/blob/main/README_JA.md).  
(ja)この解説の日本語版は[ここ](https://github.com/MasahideMori-SimpleAppli/simple_widget_markup/blob/main/README_JA.md)にあります。

## Overview
This package is a practical Flutter (Dart) implementation of the Simple Widget Markup Language (SpWML).  
SpWML is a markup language that makes it easy to handle widgets (a block of certain elements).  
Files output in this format have the extension .spwml.  
This specification is mainly intended to be able to describe the contents easily and lightly when new information is delivered in the application.  
It also focuses on ease of learning.  
The essential requirement for this language is to be able to explain to ordinary clerks how to use it within two sheets of A4 paper.  

## Usage
### Quick Start
in preparation

### Description method
The basic form is as follows.
```
(type, parameter1:value1, parameter2:value2,...)letter body
```
type is required and parameters are optional.  

Currently, the types are as follows.
・ Container system (Container is a container for elements)
- block (basic container. Can also be used for temporary placement for replacement)
- col (The inside is a row container)
- row (container with columns inside)
- span (Container with text or href inside. Different parameters can be set for each element in the line)
・ Elements in the container
- text system
  - h1-h6 (header text. 6 types of h1-h6)
  - subtitle1
  - subtitle2
  - body1 (It works even if you write "text". Normal text)
  - body2
  - caption
  - overline (text to display above the line)
- Other than text
  - img (image. URL is described in the text part)
  - href (Hyperlinks are written in the text part. The appearance can be changed with the alt parameter)
  - line (horizontal delimiter)

Currently, the parameters are:
・ Valid for all
- height
- width
- bgColor (#AARRGGBB)
- mLeft (px. Margin)
- mTop (px)
- mRight (px)
- mBottom (px)
- pLeft (px. Padding)
- pTop (px)
- pRight (px)
- pBottom (px)
- weight (ratio of elements on the screen. Vertical in col, horizontal in row)

・ For block only
- id (replacement ID in Flutter widget linkage)

・ For col and row only
- hAlign (left, center, right. Horizontal alignment)
- vAlign (top, center, bottom. Vertical alignment)

・ For text and href only
- fontName
- fontSize (px)
- fontWeight (normal, regular, bold, thin, light, medium, black, w100-w900)
- fontStyle (normal, italic)
- textColor (#AARRGGBB)
- textDeco (none, underline, overline, lineThrough)
- textDecoStyle (solid, dotted, dashed, double, wavy)
- textDecoColor (#AARRGGBB)
- textDecoThickness (px)
- letterSpacing (px)
- wordSpacing (px)
- textAlign (left, center, right, justify. Text alignment)
- textHeight (text size magnification, such as 1.0 or 1.3)

・ For text and span only
- isSelectable (true, false. If false, it cannot be selected.)

・ Href only
- alt (alternative text)

・ For img only
- fit (none, contain, cover, fitHeight, fitWidth)
- repeat (noRepeat, repeat, repeatX, repeatY. If repeat is enabled, it will be repeated at the original image size.)

・ Line only
- chickness (px, line thickness)
- color (#AARRGGBB)
- lineStyle (Currently unavailable. Multiple styles may be added in the future.)


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
//in preparation
```

### Example of using inline elements
```dart
//in preparation
```

### Cooperation with Widget
```dart
//in preparation
```

### Customize basic design
```dart
//in preparation
```

## Support
If you need paid support, please contact my company.  
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