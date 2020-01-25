//%attributes = {}
  // refreshPropertiesStyle ( $level ) 
  //
  // $1 : (text) current level

  //
  // Set the background style array for the properties in the listbox

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 13.01.20, 10:37:07
	  // ----------------------------------------------------
	  // Method: refreshPropertiesStyle
	  // Description
	  // 
	  // bold : current value # default value
	  // italic : state exception
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$level;$property)
C_LONGINT:C283($style)
C_POINTER:C301($property_ptr)
ARRAY LONGINT:C221(bgStylesValue;0)

$level:=$1

$properties_col:=queryPropertiesCol ($level)
$property_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"property_col")

For ($i;0;$properties_col.length-1)
	
	Case of 
		: ($level="global")
			If (Form:C1466.defaultValues[$properties_col[$i].formula]()=Form:C1466.bc1[$properties_col[$i].formula]())
				APPEND TO ARRAY:C911(bgStylesValue;0)
			Else 
				APPEND TO ARRAY:C911(bgStylesValue;Bold:K14:2)
			End if 
			
		: ($level="sections")
			$property:=$property_ptr->{$i+1}
			
			If ($property="id") | ($property="position")
				APPEND TO ARRAY:C911(bgStylesValue;0)
			Else 
				If (Form:C1466.Section_pos>0)
					If (Form:C1466.defaultValues.breadCrumb.sectionList[0][$property_ptr->{$i+1}]=Form:C1466.bc1.breadCrumb.sectionList[Form:C1466.Section_pos-1][$property_ptr->{$i+1}])
						APPEND TO ARRAY:C911(bgStylesValue;0)
					Else 
						APPEND TO ARRAY:C911(bgStylesValue;Bold:K14:2)
					End if 
				End if 
			End if 
			
		: ($level="states")
			$style:=0
			
			If (Form:C1466.currentState#AJUI_bc_standard_default)
				If (Form:C1466.bc1[$properties_col[$i].formula](AJUI_bc_standard_default)#Form:C1466.bc1[$properties_col[$i].formula](Form:C1466.currentState))
					APPEND TO ARRAY:C911(bgStylesValue;Bold:K14:2)
				Else 
					APPEND TO ARRAY:C911(bgStylesValue;0)
				End if 
			Else 
				If (Form:C1466.defaultValues[$properties_col[$i].formula](AJUI_bc_standard_default)#Form:C1466.bc1[$properties_col[$i].formula](Form:C1466.currentState))
					APPEND TO ARRAY:C911(bgStylesValue;Bold:K14:2)
				Else 
					APPEND TO ARRAY:C911(bgStylesValue;0)
				End if 
			End if 
			
	End case 
End for 