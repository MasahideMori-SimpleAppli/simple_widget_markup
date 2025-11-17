import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_widget_markup/simple_widget_markup.dart';

void main() {
  test('style export test', () {
    SpWMLFontStyleManager manager = SpWMLFontStyleManager();
    final exported = manager.style.toDict();
    SpWMLFontStyle resumed = SpWMLFontStyle.fromDict(exported);
    resumed.styleMap[EnumSpWMLElementType.h1]!.fontWeight =
        EnumFontWeight.light;
    expect(
      manager.style.styleMap[EnumSpWMLElementType.h1]!.fontWeight !=
          EnumFontWeight.light,
      true,
    );
    manager.changeStyle(resumed);
    expect(
      manager.style.styleMap[EnumSpWMLElementType.h1]!.fontWeight ==
          EnumFontWeight.light,
      true,
    );
    // deep copy check
    expect(
      manager.style.styleMap[EnumSpWMLElementType.h1]!.fontWeight ==
          manager.style
              .deepCopy()
              .styleMap[EnumSpWMLElementType.h1]!
              .fontWeight,
      true,
    );
  });

  test('util_params test', () {
    Color c1 = Color.fromARGB(255, 255, 255, 255);
    Color c2 = Color.fromARGB(255, 0, 255, 128);
    expect(UtilParams.colorToHexString(c1) == "#FFFFFFFF", true);
    expect(UtilParams.colorToHexString(c2) == "#FF00FF80", true);
  });
}
