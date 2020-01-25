//%attributes = {}
  // loadPropertiesCollection ( ) -> return
  //
  // $0 : (object) (return) listbox content
  //
  // Init listbox structure and content

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 03.10.19, 09:24:17
	  // ----------------------------------------------------
	  // Method: loadPropertiesCollection
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($0;$lab)

$lab:=New object:C1471
$lab.properties:=New collection:C1472()

  //font name object
ARRAY TEXT:C222($_fontName;0)
FONT LIST:C460($_fontName)
$fontName_obj:=New object:C1471("value";"Arial";"valueType";"text")
OB SET ARRAY:C1227($fontName_obj;"choiceList";$_fontName)

  //font style object
ARRAY TEXT:C222($_textStyle;0)
APPEND TO ARRAY:C911($_textStyle;"none")
APPEND TO ARRAY:C911($_textStyle;"bold")
APPEND TO ARRAY:C911($_textStyle;"italic")
APPEND TO ARRAY:C911($_textStyle;"underline")
APPEND TO ARRAY:C911($_textStyle;"strikethrough")
APPEND TO ARRAY:C911($_textStyle;"bold,underline")
APPEND TO ARRAY:C911($_textStyle;"bold,italic")
APPEND TO ARRAY:C911($_textStyle;"bold,strikethrough")
APPEND TO ARRAY:C911($_textStyle;"italic,underline")
APPEND TO ARRAY:C911($_textStyle;"bold,italic,undeline")
$fontStyle_obj:=New object:C1471("value";"none";"valueType";"text")
OB SET ARRAY:C1227($fontStyle_obj;"requiredList";$_textStyle)

  //model object
ARRAY TEXT:C222($_model;0)
APPEND TO ARRAY:C911($_model;"simple")
APPEND TO ARRAY:C911($_model;"arrow")
APPEND TO ARRAY:C911($_model;"groupedButtons")
$model_obj:=New object:C1471("value";"arrow";"valueType";"text")
OB SET ARRAY:C1227($model_obj;"requiredList";$_model)

  //picture position
ARRAY TEXT:C222($_posPicture;0)
APPEND TO ARRAY:C911($_posPicture;"left")
APPEND TO ARRAY:C911($_posPicture;"right")
$posPicture_obj:=New object:C1471("value";"left";"valueType";"text")
OB SET ARRAY:C1227($posPicture_obj;"requiredList";$_posPicture)

  //type object
ARRAY TEXT:C222($_type;0)
APPEND TO ARRAY:C911($_type;"standard")
APPEND TO ARRAY:C911($_type;"first")
APPEND TO ARRAY:C911($_type;"current")
APPEND TO ARRAY:C911($_type;"next")
APPEND TO ARRAY:C911($_type;"previous")
$type_obj:=New object:C1471("value";"standard";"valueType";"text")
OB SET ARRAY:C1227($type_obj;"requiredList";$_type)


  // ----------------------------------------------------
  // GLOBAL
  // ----------------------------------------------------
$lab.properties.push(New object:C1471("category";"Global";"level";"global";"modelExclusion";"none";"property";"model";"formula";"Model";"value_object";$model_obj))
$lab.properties.push(New object:C1471("category";"Global";"level";"global";"modelExclusion";"none";"property";"maxSectionToDraw";"formula";"MaxSectionToDraw";"value_object";New object:C1471("value";0;"valueType";"integer";"min";-1)))
$lab.properties.push(New object:C1471("category";"Global";"level";"global";"modelExclusion";"none";"property";"rtl";"formula";"RTL";"value_object";New object:C1471("value";False:C215;"valueType";"boolean")))


  // ----------------------------------------------------
  // BOX
  // ----------------------------------------------------
$lab.properties.push(New object:C1471("category";"Box";"level";"global";"modelExclusion";"groupedButtons";"property";"bgColor";"formula";"BgColor";"value_object";New object:C1471("value";"black";"valueType";"text";"alternateButton";True:C214)))
$lab.properties.push(New object:C1471("category";"Box";"level";"global";"modelExclusion";"none";"property";"borderColor";"formula";"BorderColor";"value_object";New object:C1471("value";"black";"valueType";"text";"alternateButton";True:C214)))
$lab.properties.push(New object:C1471("category";"Box";"level";"global";"modelExclusion";"none";"property";"borderSize";"formula";"BorderSize";"value_object";New object:C1471("value";0;"valueType";"integer";"min";0)))
$lab.properties.push(New object:C1471("category";"Box";"level";"global";"modelExclusion";"none";"property";"cornerRadiusLeft";"formula";"CornerRadiusLeft";"value_object";New object:C1471("value";0;"valueType";"integer";"min";0)))
$lab.properties.push(New object:C1471("category";"Box";"level";"global";"modelExclusion";"none";"property";"cornerRadiusRight";"formula";"CornerRadiusRight";"value_object";New object:C1471("value";0;"valueType";"integer";"min";0)))
$lab.properties.push(New object:C1471("category";"Box";"level";"global";"modelExclusion";"groupedButtons";"property";"dynamicSize";"formula";"IsDynamicSize";"value_object";New object:C1471("value";False:C215;"valueType";"boolean")))
$lab.properties.push(New object:C1471("category";"Box";"level";"global";"modelExclusion";"none";"property";"centered";"formula";"IsBoxCentered";"value_object";New object:C1471("value";False:C215;"valueType";"boolean")))
$lab.properties.push(New object:C1471("category";"Box";"level";"global";"modelExclusion";"none";"property";"height";"formula";"BoxHeight";"value_object";New object:C1471("value";0;"valueType";"integer";"min";-1)))
$lab.properties.push(New object:C1471("category";"Box";"level";"global";"modelExclusion";"groupedButtons";"property";"width";"formula";"BoxWidth";"value_object";New object:C1471("value";0;"valueType";"integer";"min";-1)))
$lab.properties.push(New object:C1471("category";"Box";"level";"global";"modelExclusion";"groupedButtons";"property";"paddingHorizontal";"formula";"PaddingH";"value_object";New object:C1471("value";0;"valueType";"integer";"min";0)))
$lab.properties.push(New object:C1471("category";"Box";"level";"global";"modelExclusion";"groupedButtons";"property";"paddingVertical";"formula";"PaddingV";"value_object";New object:C1471("value";0;"valueType";"integer";"min";0)))


  // ----------------------------------------------------
  // DIVIDER
  // ----------------------------------------------------
$lab.properties.push(New object:C1471("category";"Divider";"level";"global";"modelExclusion";"groupedButtons,arrow";"property";"divider";"formula";"Divider";"value_object";New object:C1471("value";"black";"valueType";"text")))
$lab.properties.push(New object:C1471("category";"Divider";"level";"global";"modelExclusion";"groupedButtons";"property";"margin";"formula";"DividerMargin";"value_object";New object:C1471("value";0;"valueType";"integer";"min";0)))


  // ----------------------------------------------------
  // DIVIDER - FONT
  // ----------------------------------------------------
$lab.properties.push(New object:C1471("category";"Divider Font";"level";"global";"modelExclusion";"groupedButtons,arrow";"property";"color";"formula";"DividerFontColor";"value_object";New object:C1471("value";"black";"valueType";"text";"alternateButton";True:C214)))
$lab.properties.push(New object:C1471("category";"Divider Font";"level";"global";"modelExclusion";"groupedButtons,arrow";"property";"name";"formula";"DividerFontName";"value_object";$fontName_obj))
$lab.properties.push(New object:C1471("category";"Divider Font";"level";"global";"modelExclusion";"groupedButtons,arrow";"property";"size";"formula";"DividerFontSize";"value_object";New object:C1471("value";0;"valueType";"integer";"min";1)))
$lab.properties.push(New object:C1471("category";"Divider Font";"level";"global";"modelExclusion";"groupedButtons,arrow";"property";"style";"formula";"DividerFontStyle";"value_object";$fontStyle_obj))


  // ----------------------------------------------------
  // DIVIDER - ARROW
  // ----------------------------------------------------
$lab.properties.push(New object:C1471("category";"Divider Arrow";"level";"global";"modelExclusion";"groupedButtons,simple";"property";"borderSize";"formula";"ArrowBorderSize";"value_object";New object:C1471("value";0;"valueType";"integer";"min";0)))
$lab.properties.push(New object:C1471("category";"Divider Arrow";"level";"global";"modelExclusion";"groupedButtons,simple";"property";"color";"formula";"ArrowColor";"value_object";New object:C1471("value";"black";"valueType";"text";"alternateButton";True:C214)))
$lab.properties.push(New object:C1471("category";"Divider Arrow";"level";"global";"modelExclusion";"groupedButtons,simple";"property";"firstSectionWithArrow";"formula";"IsFirstSectionWithArrow";"value_object";New object:C1471("value";False:C215;"valueType";"boolean")))
$lab.properties.push(New object:C1471("category";"Divider Arrow";"level";"global";"modelExclusion";"groupedButtons,simple";"property";"lastSectionWithArrow";"formula";"IsLastSectionWithArrow";"value_object";New object:C1471("value";False:C215;"valueType";"boolean")))
$lab.properties.push(New object:C1471("category";"Divider Arrow";"level";"global";"modelExclusion";"groupedButtons,simple";"property";"paddingH";"formula";"ArrowPaddingH";"value_object";New object:C1471("value";0;"valueType";"integer";"min";0)))
$lab.properties.push(New object:C1471("category";"Divider Arrow";"level";"global";"modelExclusion";"groupedButtons,simple";"property";"width";"formula";"ArrowWidth";"value_object";New object:C1471("value";"0px";"valueType";"text")))


  // ----------------------------------------------------
  // SECTION TYPES (states part)
  // ----------------------------------------------------
$lab.properties.push(New object:C1471("category";"section";"level";"states";"modelExclusion";"none";"property";"bgColor";"formula";"SectionBgColor";"value_object";New object:C1471("value";"black";"valueType";"text";"alternateButton";True:C214)))
$lab.properties.push(New object:C1471("category";"section";"level";"states";"modelExclusion";"groupedButtons,simple";"property";"borderColor";"formula";"SectionBorderColor";"value_object";New object:C1471("value";"black";"valueType";"text";"alternateButton";True:C214)))
$lab.properties.push(New object:C1471("category";"section";"level";"states";"modelExclusion";"groupedButtons,simple";"property";"borderSize";"formula";"SectionBorderSize";"value_object";New object:C1471("value";0;"valueType";"integer";"min";0)))
$lab.properties.push(New object:C1471("category";"section";"level";"states";"modelExclusion";"none";"property";"fontColor";"formula";"SectionFontColor";"value_object";New object:C1471("value";"black";"valueType";"text";"alternateButton";True:C214)))
$lab.properties.push(New object:C1471("category";"section";"level";"states";"modelExclusion";"none";"property";"fontName";"formula";"SectionFontName";"value_object";$fontName_obj))
$lab.properties.push(New object:C1471("category";"section";"level";"states";"modelExclusion";"none";"property";"fontSize";"formula";"SectionFontSize";"value_object";New object:C1471("value";0;"valueType";"integer";"min";0)))
$lab.properties.push(New object:C1471("category";"section";"level";"states";"modelExclusion";"none";"property";"fontStyle";"formula";"SectionFontStyle";"value_object";$fontStyle_obj))
$lab.properties.push(New object:C1471("category";"section";"level";"states";"modelExclusion";"none";"property";"pictureOpacity";"formula";"PictureOpacity";"value_object";New object:C1471("value";100;"valueType";"integer";"min";0;"max";100)))
$lab.properties.push(New object:C1471("category";"section";"level";"states";"modelExclusion";"none";"property";"replacingColor";"formula";"ReplacingColor";"value_object";New object:C1471("value";"black";"valueType";"text";"alternateButton";True:C214)))


  // ----------------------------------------------------
  // SECTION LIST 
  // ----------------------------------------------------
  //callback
$lab.properties.push(New object:C1471("category";"Callback";"level";"sections";"modelExclusion";"none";"property";"onClickCB";"formula";"UpdateSection";"value_object";New object:C1471("value";"";"valueType";"text")))
$lab.properties.push(New object:C1471("category";"Callback";"level";"sections";"modelExclusion";"none";"property";"onDoubleClickCB";"formula";"UpdateSection";"value_object";New object:C1471("value";"";"valueType";"text")))
  //content
$lab.properties.push(New object:C1471("category";"Content";"level";"sections";"modelExclusion";"none";"property";"id";"formula";"UpdateSection";"value_object";New object:C1471("value";"";"valueType";"text")))
$lab.properties.push(New object:C1471("category";"Content";"level";"sections";"modelExclusion";"none";"property";"disable";"formula";"UpdateSection";"value_object";New object:C1471("value";False:C215;"valueType";"boolean")))
$lab.properties.push(New object:C1471("category";"Content";"level";"sections";"modelExclusion";"none";"property";"label";"formula";"UpdateSection";"value_object";New object:C1471("value";"";"valueType";"text")))
$lab.properties.push(New object:C1471("category";"Content";"level";"sections";"modelExclusion";"none";"property";"position";"formula";"UpdateSection";"value_object";New object:C1471("value";0;"valueType";"integer")))
$lab.properties.push(New object:C1471("category";"Content";"level";"sections";"modelExclusion";"none";"property";"type";"formula";"UpdateSection";"value_object";$type_obj))
  //picture
$lab.properties.push(New object:C1471("category";"Picture";"level";"sections";"modelExclusion";"none";"property";"colorToReplace";"formula";"UpdateSection";"value_object";New object:C1471("value";"";"valueType";"text";"alternateButton";True:C214)))
$lab.properties.push(New object:C1471("category";"Picture";"level";"sections";"modelExclusion";"none";"property";"pictureHeight";"formula";"UpdateSection";"value_object";New object:C1471("value";"";"valueType";"text")))
$lab.properties.push(New object:C1471("category";"Picture";"level";"sections";"modelExclusion";"none";"property";"pictureMargin";"formula";"UpdateSection";"value_object";New object:C1471("value";0;"valueType";"integer";"min";0)))
$lab.properties.push(New object:C1471("category";"Picture";"level";"sections";"modelExclusion";"none";"property";"picturePath";"formula";"UpdateSection";"value_object";New object:C1471("value";"";"valueType";"text";"alternateButton";True:C214)))
$lab.properties.push(New object:C1471("category";"Picture";"level";"sections";"modelExclusion";"none";"property";"picturePosition";"formula";"UpdateSection";"value_object";$posPicture_obj))


  //States collection
$lab.states:=New collection:C1472()
$lab.states.push("default")
$lab.states.push("hover")
$lab.states.push("active")
$lab.states.push("disable")

$lab.defaultValues:=New AJUI_BreadCrumb 
$lab.defaultValues.AddSection("sect1")


$0:=$lab