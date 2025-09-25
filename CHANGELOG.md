## 45.1.0

* The flexFit parameter has been added to the base class SpWMLElement, allowing you to choose the fitting method when wt is specified.
* textAlign and rubyAlign now support start and end parameters.
* Refactoring was performed.

## 45.0.4

* Fixed a bug that caused the splitPane2MinPx value to be invalid in SplitElement.

## 45.0.3

* Due to an issue that caused pub.dev score calculations to drop, the activeThumbColor of switchBtn has been temporarily fixed to be treated as an assignment to the activeColor argument.

## 45.0.2

* Fixed a bug that could cause a SplitElement's inner view size to overflow under certain conditions.

## 45.0.1

* Bug fix of splitPane1MinPx and splitPane2MinPx params of SplitElement.

## 45.0.0

* Added setSplitPaneMinPx method to SplitElement.
* Added splitPane1MinPx and splitPane2MinPx params to split block.
* Replaced activeColor to activeThumbColor in SwitchBtnParams.

## 44.1.0

* Added setOnChanged method to SplitElement.

## 44.0.0

* The spec has been changed so that SplitElement requires a ValueManager and a sid.
* With this change, the ratio parameter has been removed from SplitParams and the ratio is now
  managed by the manager on a SID basis.

## 43.1.1

* Added clampMin and clampMax params to split.

## 43.1.0

* Added SplitElement.

## 43.0.3

* Several variables have been added to ExpTileParams, a parameter of ExpTileElement.

## 43.0.2

* Updates associated with base library updates.

## 43.0.1

* The key specification for SpWML and SpWMLBuilder has been changed from GlobalKey to Key.

## 43.0.0

* visiblePassword has been added as a parameter that can be used with TextFieldElement.
* The keyboard type of TextInputType.visiblePassword has now been automatically set even in password
  mode of TextFieldElement.
* In noSuggestAndAutoCorrect, noAutoCorrect, password, and passwordPrefix modes of TextFieldElement,
  the value of enableIMEPersonalizedLearning is now false. The newly added visiblePassword is also
  false.
* A missing parameter has been added to TextFieldElementParams.

## 42.0.0

* Due to a change in the Flutter specifications, constraints have been added to the parameters of
  TooltipElement, and the height parameter has been migrated.
* Due to this change, the target SDK required by the package has also changed.
* In addition, I have reorganized dependencies that are no longer necessary.
* Other minor fixes have been made.

## 41.0.0

* When the input mode is changed using TextFieldParams's changeNormalMode, autofillHints is now
  always initialized to an empty array.
* The noSuggestAndAutofill mode of TextFieldElement has been renamed to noSuggestAndAutoCorrect
  mode.
* The noAutoCorrect mode has been added to TextFieldElement. Unlike the noSuggestAndAutoCorrect
  mode, this mode allows conversion using IME, such as for Japanese input.

## 40.0.0

* The TextFieldElement mode noSuggestAndAutofill has been added. This is the second most secure mode
  after password mode and is ideal for apps on shared devices.
* The changePasswordMode of TextFieldParams has been changed so that autofillHints is always
  initialized with an empty array.

## 39.0.1

* The ParseErrorTextElement, which has the same functionality as TextElement, is now returned only
  when SpWMLParser fails to parse SpWML.
* This change makes parsing errors easier to track down.

## 39.0.0

* The default value of the fontFamily argument in the SpWMLFontStyleParams class has been changed to
  null. With this change, the default font family set in MaterialApp will always be used.
* If you do not want to be affected by this change, you can override the style in
  SpWMLFontStyleManager and set the fontFamily to Roboto to get the same behavior as before.

## 38.0.3

* Fixed an issue where the ColorPaletteElement was not compatible with the new color specifications.

## 38.0.2

* The initial value of heroTag in FAButtonParams has been changed to null.

## 38.0.1

* Downgrading intl to 0.19.0 due to localization compatibility issues.

## 38.0.0

* Updated to accommodate Flutter 3.29.0.
* The TextFieldElement's scribbleEnabled parameter has been removed and replaced with
  stylusHandwritingEnabled.

## 37.0.0

* Updates associated with base library updates.
* Modified to fit newer Flutter versions. This update changes how some colors are handled.
* The UtilParams colorToHexString method has been changed to always return the value converted to
  uppercase.

## 36.2.0

* Added setScrollController and changeToAlwaysShownScrollBar method to ScrollElement.

## 36.1.0

* The scroll now has an alignCenter flag, which when set to true will center the scroll within its
  parent element.

## 36.0.3

* Fixed an issue where new attributes on the color palette were not being properly applied.

## 36.0.2

* Fixed an issue where the colorPalette type could not be changed from SpWML. The previous fix was
  not applied due to a parsing order issue.
* The circle and simpleCircle type has been added to the colorPalette.
* Added cellBorderWidth and cellBorderColor params to colorPalette.

## 36.0.1

* Fixed an issue where the colorPalette type could not be changed from SpWML.
* The text type has been added to the colorPalette.

## 36.0.0

* You can now edit the color tiles in the colorPalette.
* In addition to the existing "normal" color palette type, "simple" has been added.
* Added alignment option to colorPalette.
* For SpWMLDialog, option values can now be set in the callback.

## 35.1.0

* Added colorPalette type.

## 35.0.0

* Updates associated with base library updates.
* The names of some manager classes have changed in the base library, which has resulted in changes
  to the classes name used by some classes.
* Please see the [simple_managers](https://pub.dev/packages/simple_managers) package for detailed
  changes.

## 34.0.1

* Fixed a bug that prevented decimal points from being entered when min or max was enabled in the tf
  type.

## 34.0.0

* The specification for TextField Element has been changed to use TextFieldManager rather than using
  TextEditingController and FocusNode directly.
* Added getFocusNode, getController, setOnEditingComplete and setFocusCallback method to
  TextFieldElement.
* Removed setController and setFocusNode method from TextFieldElement.
* The specification of the setManager method of TextFieldElement has been changed.
* As an experiment, I have added a formatter that allows you to set the value range when the input
  value of a text field is a number.
* Added min and max parameters to tf type.

## 33.3.1

* Fixed a bug in color conversion where blueGrey was not recognized correctly.

## 33.3.0

* For clarity of API, both setValue and getValue are now available for classes that use manager
  classes.

## 33.2.2

* Added an enumeration element named "dialog" to EnumWindowClass.

## 33.2.1

* Added leadingDistribution and forceStrutHeight params to text type element.

## 33.2.0

* Added setFontSize method to TextElement.
* Added setWidth, getWidth, setHeight, getHeight, setMargin, getMargin, setPadding, getPadding,
  setElementKey method to SpWMLElement.

## 33.1.0

* Fixed cursor position bug of money and moneyWithDecimal inputType param in TextFieldElement.
* Added intOnlyAllowNegative, numOnlyAllowNegative, moneyAllowNegative and
  moneyWithDecimalAllowNegative inputType params to TextFieldElement.

## 33.0.3

* Updates associated with base library updates.

## 33.0.2

* Fixed argument of setFunctions in checkbox2.
* Fixed description and argument variable name for checkbox2, dropdownBtn2, popupMenu2, radioBtn2,
  and segmentedBtn2.

## 33.0.1

* Fixed bug in segmentedBtn2.

## 33.0.0

* The specifications for checkbox2, dropdownBtn2, popupMenu2, radioBtn2, and segmentedBtn2 types
  have changed. From now on, you must set the tag for these children instead of the sid.
* All SpWML elements can now have a tag parameter.
* The performance of the numOnly and moneyWithDecimal inputTypes of TextFieldElement has been
  improved, making it easier for users to input data.

## 32.0.0

* Added checkbox2, dropdownBtn2, popupMenu2, radioBtn2 and segmentedBtn2 types. These are the
  flavors that allow you to manage selections using the SID of the child view.
* Added moneyWithDecimal inputType param to TextFieldElement.
* Refactoring for CheckboxElement adn RadioBtnElement has been carried out.
* SpWML and SpWMLBuilder now support SelectionManager and MultiSelectionManager.

## 31.2.0

* Added keyboardType and inputType params to TextFieldElement.

## 31.1.0

* Updates associated with base library updates.
* Added isEnabled and readOnly params to TextFieldElement.

## 31.0.1

* Fixed an issue where the initial value of the DropdownButtonElement was different from before.

## 31.0.0

* Updates associated with base library updates.
* When the view is displayed, the values of each SID in the manager class are now properly
  initialized. This means that when serialized manager, if the screen has been displayed at least
  once, the SID name and its value are always saved.

## 30.2.1

* Fixed lints dependency.

## 30.2.0

* Added TooltipElement.

## 30.1.1

* Updates associated with base library updates.

## 30.1.0

* Added buildNonWrap method to SpWMLBuilder.

## 30.0.0

* In line with Flutter updates, MaterialState has been replaced with WidgetState. Properties are
  also changed in the same way.

## 29.1.0

* Added setDisabledIndexes method to RadioBtnElement and CheckboxElement.

## 29.0.0

* Added error handling to SpWMLLayoutManager.

## 28.2.0

* Added isLabelVisible parameter and setVisibility method to BadgeElement.

## 28.1.0

* Updates associated with base library updates.
* StateManager can now be used in SpWML widgets and SpWMLBuilder.

## 28.0.1

* Fixed a bug related to font size.

## 28.0.0

* Added a check for the mounted flags of each widget to improve error tolerance.
* Added flags to text types to accept user's font settings and determine relative actual font size.
* Added leading parameter to text type.
* Added setText and getText method to TextFieldElement.

## 27.0.0

* Changed SpWMLDialog to be easier to use.

## 26.0.2

* Tweaked SpWMLDialog to make it more useful.

## 26.0.1

* Fixed a bug where the default height of SpWMLDialog was incorrect.

## 26.0.0

* Changed SpWMLDialog to be easier to use.

## 25.0.1

* Fixed a bug in PopupMenuBtnElement.

## 25.0.0

* Updates associated with base library updates.
* Appropriate manager class settings are now required when using SpWML widgets.
* Error handling has been strengthened, making it easier to understand errors when the manager class
  is not set.

## 24.1.1

* Updated readme file.

## 24.1.0

* Added EXTEnumWindowClass extension. This will return the appropriate Window class from the screen
  width.
* Adjusted some class descriptions.

## 24.0.0

* The setEnabled method and isEnabled flag have been added to various button elements.
* BtnElement's setDisabled method has been deprecated.
* Variables in some classes have been changed to textScaler variables due to the deprecation of
  textScaleFactor in Flutter.

## 23.0.0

* Updates associated with base library updates.

## 22.1.1

* Updates associated with base library updates.

## 22.1.0

* Added getNonResizedFontSize method to SuperAndSubscriptElement.
* Added getNonResizedStyle method to SuperAndSubscriptElement.

## 22.0.1

* Changed some private methods of SuperAndSubscriptElement to public methods.

## 22.0.0

* ClipRRect's borderRadius no longer accepts null values, so fixed related arguments. ImgElement is
  affected by this.

## 21.0.2

* Updated SpWMLLayoutManager description.

## 21.0.1

* For some elements, the temporary manager class is no longer set when the manager class is null.

## 21.0.0

* Added SpWMLDialog class.
* Added getClassName method to SpWMLElement.
* It is now mandatory to set the sid in the textfield.
* Other minor fixes.

## 20.0.5

* Fixed Change log format.
* Added some documentation comments.

## 20.0.4

* Added useMaterial3 parameter to SpWMLFontStyleManager.
  When true, TextFieldElement's StrutStyle will always be initialized with null to avoid Japanese
  input bugs.

## 20.0.3

* Fixed update timing issue for manager class values set in DropdownBtnElement.
* Updated simple_managers to the latest version. Along with this, the default behavior of
  ProgressIndicatorElement is improved.

## 20.0.2

* Manager can now be set automatically from SpWMLBuilder for ProgressIndicatorElement and
  SliderElement.

## 20.0.1

* Fixed a bug that the initial value of SliderElement when value were not set was 0 instead of the
  minimum value.

## 20.0.0

* There are major specification changes in this version.
* The id parameter has been removed and changed to sid only.
* Changed to set a manager class for state management for multiple widgets with state.
* Manager classes can now be collectively set in SpWMLBuilder. With this, if the element has a sid
  set, state management will be performed automatically.
* Changed to issue an error if sid is not set for elements that require sid.
* Some methods have been renamed to simpler ones.
* Value parameters for indicator, slider and switch buttons have been removed. This is a change with
  the use of the manager class and must now be specified from the Dart code.

## 19.0.0

* Fixed bug progressIndicator and slider bool value conversion.
* Added param of mainAxisSize to SpWMLBuilder and SpWML.
* Added getSID and getID method to SpWMLElement.
* Removed setText method from TextElement.
* Added getContentText and setContentText method to TextElement.
* Added mainAxisSize param to col and row.
* Added useAutoLabel and isIntValue param to SliderElement.

## 18.3.1

* Fixed an issue where the initial value of SegmentedBtnElement was broken.

## 18.3.0

* Added SegmentedBtnElement.
* Added CircleAvatarElement.
* Added SliderElement.
* Added BadgeElement.

## 18.2.0

* Added useMaterial param to SpWMLElement.
* Added setBtnColor method to BtnElement.

## 18.1.0

* Added scrollBehavior param to ScrollElement.

## 18.0.0

* SpWMLBuilder and SpWML widget default padding changed to zero.

## 17.0.0

* Removed EnumDeviceType and change only use window class.
* Fixed flutter version dependencies.
* Added any to EnumWindowClass.
* Fixed miss addition of EnumWindowClass reference.
* Fixed of SpWMLLayoutManager window class judgement.
* Fixed BtnElement setCallback method.
* Added btn type faSmall, faExtended, fa, faLarge. These are floating action buttons.

## 16.0.0

* Supported Dart 3.
* Added btn type of filled, filledTonal, iconFilled, iconFilledTonal, iconOutlined.
* super and subscript default mag change. Support parameter of mag, mag is changing display
  magnification of super and subscript.
* Added windows class breakpoint support to SpWMLLayoutManager.
* Added autoConfigureTextFieldManager method to SpWMLBuilder.
* Some minor fixes and addition of missing parameters.

## 15.0.0

* Added passwordPrefix and searchPrefix type to tf.
* Default fill color change to null in tf.
* Added setDisabled method to BtnElement.
* Added searchAndClear mode of tf.
* Added isPrefixIcon param to checkbox and radioBtn.
* Added isV3 param to checkbox and radioBtn.
* Fixed text lineHeight parameter not enable bug.
* Added baseLine params to row, and some Align type added.
* Added superscript and subscript type.
* Removed textSpanParamsList param in SpanParams.
* Removed TextSpanParams class.
* Added isLayoutStrictMode param to span.

## 14.1.0

* Resources that can be managed by SpWMLLayoutManager are now more flexible.
* SpWMLLayoutManager can now determine screen orientation and device type.

## 14.0.0

* Fixed an issue where padding was also enabled for block background colors. This fix may affect
  existing layouts if they use background colors.
* Added isBtnColorModeV3 flag to SpWMLFontStyle.
* Added pAll and mAll params to SpWMLElement.

## 13.0.1

* The null can now be specified for color parameters.
* Added missing parameter for text.

## 13.0.0

* The fontName and textHeight parameters have been deprecated. Use fontFamily and lineHeight
  instead.
* Speed up parsing.
* Added SpWMLLayoutManager class. This class simplifies layout management.
* Update style management system.
* All types of buttons can now have single child blocks.

## 12.0.0

* Removed toolbarOptions from textfield, ruby and more.
* Added missing parameters to text type elements.
* Added clipType parameter to ImgElement.
* Added ProgressIndicatorElement.
* Added memory type and setByteImage method to imgElement.
* Added setBGColor method to SpWMLElement.

## 11.3.0

* Updated textfield_manager package.
* The setManager method of TextFieldElement has been updated according to the package update.

## 11.2.2

* Added maxLines and maxLength parameter to TextFieldElement.

## 11.2.1

* Added wt parameter. wt works as an abbreviation for weight.

## 11.2.0

* Added setIsGone method to SpWMLElement.
* Added overflow parameter on SpWML to TextElement. This parameter is valid only when isSelectable
  is false.
* Added maxLines parameter on SpWML to TextElement.

## 11.1.0

* Added setEnabled method to TextFieldElement.
* Added setManager method to TextFieldElement. This addition added textfield_manager to the
  dependencies.

## 11.0.0

* An optional argument SpWMLInfo has been added to SpWMLBuilder.
  Setting this makes it easier to track where the error occurred when it occurs.
* Added setOnChanged method to TextFieldElement.

## 10.2.1

* Updated simple_block_markup_language package.

## 10.2.0

* Added isGone parameter to SpWMLElement.
* Added cpL, cpT, cpR, and cpB parameters to TextFieldElement. These are the "content padding"
  parameters.

## 10.1.1

* Fixed a bug where margins were not valid for background colors.

## 10.1.0

* Fixed a bug, When the background color and border are enabled, the border color becomes white on
  elevation.
* Added sid parameter. From SpWMLBuilder it can now search for widgets by String ID as well as by
  id.

## 10.0.3

* Fixed ink animations being disabled on block-type btnElement when the parent block has a
  background color.

## 10.0.2

* Updated README_JA file.

## 10.0.1

* Updated README files. Added links to documentation with detailed specifications.

## 10.0.0

* The button color setting method has been changed.
  From now on color and btnBGColor have the same effect. A new fgColor (foreground color) parameter
  has been added.
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
* Fixed an issue where touch animations were not clipped when changing card element content or
  borders.

## 8.0.0

* Optimized the internal structure of the program. This made importing easier.

## 7.2.1

* The SBML(SpBML) library has been updated so the relevant I ran the update.

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
* Escapes are no longer required for parentheses in the text. However, it is still required within
  the parameters.
* Line breaks now have meaning on the code. For this reason, it is no longer possible to list
  multiple types in one line.
* Added enableTapLabel parameter to radio buttons and checkboxes. The default is false, and if set
  to true, can tap child view.

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

* The structure has been significantly revised and changed so that many parameters can be accessed
  from the program code.
  Element parameters can now be freely changed by calling getID to get the element and converting it
  to the appropriate class with as.
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
