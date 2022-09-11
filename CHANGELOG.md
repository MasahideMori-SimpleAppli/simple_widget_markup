## 10.0.2
* Updated README_JA file.

## 10.0.1
* Updated README files. Added links to documentation with detailed specifications.

## 10.0.0
* The button color setting method has been changed.
  From now on color and btnBGColor have the same effect. A new fgColor (foreground color) parameter has been added.
* Changed to support Flutter 3.1.0 or later.

## 9.1.0
* Added functions to easily set commonly used variables to TextFieldElement.

## 9.0.0
* The parent class of some classes has changed.
* Fixed some documentation content.
* Added BtnElement support to replaceID method in SpWMLBuilder.
* Added SpanElement support to replaceUnderStructure method in SpWMLBuilder.

## 8.0.3
* Added setSwitchValue method to SwitchBtnElement.
* Added some documentation content.

## 8.0.2
* Fixed a bug where vertical alignment of WrapElements did not work.

## 8.0.1
* Fixed an issue where the CardElement parameters borderWidth and borderColor were invalid.
* Fixed an issue where touch animations were not clipped when changing card element content or borders.

## 8.0.0
* Optimized the internal structure of the program. This made importing easier.

## 7.2.1
* The SBML library has been updated so the relevant I ran the update.

## 7.2.0
* The content of RubyTextElement is now selectable.
* Fixed an issue where selectable text was misaligned relative to normal text.

## 7.1.0
* Added RubyTextElement.
* Fixed bug with TextElement parameters.
* All elements can now be child element of a SpanElement.

## 7.0.0
* Changed the parser to the versatile simple_block_markup_language package.

## 6.0.1
* Fixed bug that alt parameter is disabled in hrefElement.

## 6.0.0
* The language parser has been changed to a new one. Along with this, some bugs have been fixed.
* Escapes are no longer required for parentheses in the text. However, it is still required within the parameters.
* Line breaks now have meaning on the code. For this reason, it is no longer possible to list multiple types in one line.
* Added enableTapLabel parameter to radio buttons and checkboxes. The default is false, and if set to true, can tap child view.

## 5.0.1
* Fixed function name for RadioBtnElement and CheckboxElement.

## 5.0.0
* Fixed an issue with radio button callback specifications.
* Checkbox callback specifications have been improved.

## 4.0.2
* Fixed a bug that comment lines are not converted properly depending on the condition.
* Improved parser.

## 4.0.1
* Fixed readme files.
* Fixed bug related to borderRadius variations.

## 4.0.0
* The outlineColor parameter has been deprecated and integrated into borderColor.
* Box decorations are now available. Related parameters have been added.
* RadioBtnElement has been added.
* CheckboxElement has been added.
* TableElement and TableRowElement have been added.

## 3.0.4
* Fixed color parser.

## 3.0.3
* Fixed white color parser.
* Added underlineColor and underlineHeight parameter to DropdownBtnElement.

## 3.0.2
* Fixed onTap control in hrefElement.
* Fixed iconNum param of textFieldElement.
* Fixed a bug where the SpWML parser did not properly handle pre-check errors and just crashed.

## 3.0.1
* Fixed WrapElement parameter bug.

## 3.0.0

* The structure has been significantly revised and changed so that many parameters can be accessed from the program code.
  Element parameters can now be freely changed by calling getID to get the element and converting it to the appropriate class with as.
  The class name is basically TextElement for text type, and type name + Element for others.
* SwitchBtn, Icon, Card have been added.
* Abbreviation notation is enabled for some parameters. Example, w: 360 (width: 360).

## 2.0.0

* Added setInitialIndex method to DropdownBtnElement.
* Fix textAlign parameter in TextFieldElement.
* Remove isUseSpWMLParams flag in TextFieldParams class. 
  TextFieldParams are now always initialized with SpWML parameters.
  getTextFieldParams now always returns an overridden non copy value. 
  The isOverrideSpWMLParams argument is gone and is always true.

## 1.4.1

* Fixed TextElement variation of menu type. 
  Fixed the text selectable attribute to be off by default when used in a menu.

## 1.4.0

* Added BtnElement.
* Added TextFieldElement.
* Added WrapElement.
* Added ExpTileElement.
* Added DropdownBtnElement.
* Added PopupMenuBtnElement.
* Added TextElement variation of menu type.
* Added setText method to Text type Elements.
* Added replaceUnderStructure method to SpWMLBuilder.
* Added comment line function. 
  Double slash at the beginning of the line it convert line to comment line.
* Removed resetStructure method in SpWMLBuilder.

## 1.3.1

* Added isPrimary parameter to ScrollElement.

## 1.3.0

* Supported the color notation similar to the color specification
  on the Flutter code. (e.g. bgColor: orange)

## 1.2.0

* Added ScrollElement.
* Added VLineElement.
* Added constructor parameter of key to SpWMLBuilder.
* Added some constructor parameters to SpWML widget. 

## 1.1.0

* Improved the conversion speed of the parser.
* Added getElement, getAllElement, getElementByID, length, resetStructure method to SpWMLBuilder.
* Changed parsedWidgets var to private in SpWMLBuilder.
* Added buttonWeight, buttonSize, buttonLetterSpacing optional var to SpWMLFontStyle and 
  SpWMLFontStyleMaterial.
* Added maxWidth, minWidth, maxHeight and minHeight Parameter to Containers(e.g. BlockElement).

## 1.0.1

* Fixed a bug where blanks were removed in the HrefElement's alt parameter.

## 1.0.0

* Fixed parameter typo bug in LineElement, Fixed chickness to thickness.
* Fixed some bugs in the language parser.
* Fixed a bug that sometimes caused unnecessary warnings in BlockElement.

## 0.1.0

* Added SpWML widget.
* Added StackElement.
* Fixed bug at replaceID function in SpWMLBuilder.

## 0.0.2

* Update README.

## 0.0.1

* Initial release.
