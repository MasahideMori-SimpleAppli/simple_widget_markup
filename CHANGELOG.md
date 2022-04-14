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
* Added comment line function. Double slash at the beginning of the line it convert line to comment line.
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
