//%attributes = {}
  // refreshArrayColor ( $level ) -> return
  //
  // $1 : (text) current level
  //
  // Set the background color array for the values of the properties in the listbox

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 22.10.19, 16:16:40
	  // ----------------------------------------------------
	  // Method: refreshArrayColor
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
C_TEXT:C284($1;$level;$value)
ARRAY LONGINT:C221(bgColorValue;0)
ARRAY LONGINT:C221(bgFontColorValue;0)
C_COLLECTION:C1488($properties_col)
C_POINTER:C301($property_ptr)

$level:=$1

$properties_col:=queryPropertiesCol ($level)
$property_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"property_col")

For ($i;0;$properties_col.length-1)
	If ($properties_col[$i].property="@color@")
		$value:=""
		Case of 
			: ($level="global")
				$value:=Form:C1466.bc1[$properties_col[$i].formula]()
				
			: ($level="sections")
				If (Form:C1466.Section_pos>0)
					$value:=Form:C1466.bc1.breadCrumb.sectionList[Form:C1466.Section_pos-1][$property_ptr->{$i+1}]
				End if 
				
			: ($level="states")
				$value:=Form:C1466.bc1[$properties_col[$i].formula](Form:C1466.currentState)
		End case 
		
		If ($value="") | ($value="none")
			APPEND TO ARRAY:C911(bgColorValue;16777215)
			APPEND TO ARRAY:C911(bgFontColorValue;0)
		Else 
			
			If (Position:C15("#";$value;1)=1)
				APPEND TO ARRAY:C911(bgColorValue;hexa2dec ($value))
				
				If (getLuminance (hexa2dec ($value))>150)
					APPEND TO ARRAY:C911(bgFontColorValue;0)
				Else 
					APPEND TO ARRAY:C911(bgFontColorValue;12632256)
				End if 
				
			Else 
				If ($value="@:@")  //remove opacity to avoid beep from the SVG method
					$opacity_pos:=Position:C15(":";$value)
					$value:=Substring:C12($value;1;$opacity_pos-1)
				End if 
				
				
				If ($value="rgb@")
					$color_obj:=New object:C1471()
					
					C_COLLECTION:C1488($rgb_col)
					$rgb_col:=New collection:C1472()
					$value:=Replace string:C233($value;"rgb(";"")
					$value:=Replace string:C233($value;")";"")
					$rgb_col:=Split string:C1554($value;",")
					$color_obj.R:=$rgb_col[0]
					$color_obj.G:=$rgb_col[1]
					$color_obj.B:=$rgb_col[2]
					
					  // calc RGB
					$color_l:=(65536*Num:C11($color_obj.R))+(256*Num:C11($color_obj.G))+Num:C11($color_obj.B)
					
					APPEND TO ARRAY:C911(bgColorValue;$color_l)
					
					If (getLuminance ($color_l)>150)
						APPEND TO ARRAY:C911(bgFontColorValue;0)
					Else 
						APPEND TO ARRAY:C911(bgFontColorValue;12632256)
					End if 
					
				Else 
					APPEND TO ARRAY:C911(bgColorValue;SVG_Get_named_color_value ($value))
					
					If (getLuminance (SVG_Get_named_color_value ($value))>150)
						APPEND TO ARRAY:C911(bgFontColorValue;0)
					Else 
						APPEND TO ARRAY:C911(bgFontColorValue;12632256)
					End if 
				End if 
			End if 
		End if 
		
	Else 
		APPEND TO ARRAY:C911(bgColorValue;16777215)
		APPEND TO ARRAY:C911(bgFontColorValue;0)
	End if 
End for 
