//%attributes = {}
  // formulasGetValues ( $level ; $properties ) -> return
  //
  // $1 : (text) level
  // $2 : (collection) properties 
  //
  // Add the values linked to the properties in the listbox

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 04.10.19, 13:59:38
	  // ----------------------------------------------------
	  // Method: formulasGetValues
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$level)
C_COLLECTION:C1488($2;$properties_col)
C_POINTER:C301($value_ptr;$property_ptr)
C_COLLECTION:C1488($properties_col)

$level:=$1

If (Count parameters:C259=2)
	$properties_col:=$2
Else 
	$properties_col:=queryPropertiesCol ($level)
End if 

$value_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"value_col")
$property_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"property_col")

ARRAY OBJECT:C1221($value_ptr->;0)
COLLECTION TO ARRAY:C1562($properties_col;$value_ptr->;"value_object")


  //Loop and execute the Getter
For ($i;0;$properties_col.length-1)
	
	
	Case of 
		: ($level="global")
			$value_ptr->{$i+1}.value:=Form:C1466.bc1[$properties_col[$i].formula]()
			
		: ($level="sections")
			If (Form:C1466.Section_pos>0)
				$value_ptr->{$i+1}.value:=Form:C1466.bc1.breadCrumb.sectionList[Form:C1466.Section_pos-1][$property_ptr->{$i+1}]
			End if 
			
		: ($level="states")
			$value_ptr->{$i+1}.value:=Form:C1466.bc1[$properties_col[$i].formula](Form:C1466.currentState)
	End case 
	
	
End for 

refreshArrayColor ($level)
refreshPropertiesStyle ($level)