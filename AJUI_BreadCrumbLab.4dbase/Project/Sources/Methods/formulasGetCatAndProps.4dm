//%attributes = {}
  // formulasGetCatAndProps ( $level ) 
  //
  // $1 : (text) level
  //
  // Load the categories and properties in the listbox for the current level

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 04.10.19, 14:02:35
	  // ----------------------------------------------------
	  // Method: formulasGetCatAndProps
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
C_TEXT:C284($1;$level)
C_COLLECTION:C1488($properties_col)

$level:=$1

$properties_col:=queryPropertiesCol ($level)


C_POINTER:C301($property_ptr;$value_ptr;$category_ptr)

$category_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"category_col")
ARRAY TEXT:C222($category_ptr->;0)
COLLECTION TO ARRAY:C1562($properties_col;$category_ptr->;"category")

$property_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"property_col")
ARRAY TEXT:C222($property_ptr->;0)
COLLECTION TO ARRAY:C1562($properties_col;$property_ptr->;"property")

formulasGetValues ($level;$properties_col)



