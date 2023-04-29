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
        true);
    manager.changeStyle(resumed);
    expect(
        manager.style.styleMap[EnumSpWMLElementType.h1]!.fontWeight ==
            EnumFontWeight.light,
        true);
    // deep copy check
    expect(
        manager.style.styleMap[EnumSpWMLElementType.h1]!.fontWeight ==
            manager.style
                .deepCopy()
                .styleMap[EnumSpWMLElementType.h1]!
                .fontWeight,
        true);
  });
}
