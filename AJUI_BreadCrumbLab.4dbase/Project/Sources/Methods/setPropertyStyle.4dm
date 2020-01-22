//%attributes = {}
  // setPropertyStyle ( $level ) 
  //
  // $1 : (text) current level
  //
  // Set the background style array for the property in the current listbox line

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 13.01.20, 11:27:20
	  // ----------------------------------------------------
	  // Method: setPropertyStyle
	  // Description
	  // 
	  // bold : current value # default value
	  // italic : state exception
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$level;$formula)
C_POINTER:C301($property_ptr)

$level:=$1

$properties_col:=queryPropertiesCol ($level)
$property_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"property_col")
$formula:=$properties_col[$property_ptr->-1].formula

Case of 
	: ($level="global")
		If (Form:C1466.defaultValues[$formula]()=Form:C1466.bc1[$formula]())
			bgStylesValue{$property_ptr->}:=0
		Else 
			bgStylesValue{$property_ptr->}:=Bold:K14:2
		End if 
		
	: ($level="sections")
		If ($property_ptr->{$property_ptr->}="id") | ($property_ptr->{$property_ptr->}="position")
			bgStylesValue{$property_ptr->}:=0
		Else 
			If (Form:C1466.Section_pos>0)
				If (Form:C1466.defaultValues.breadCrumb.sectionList[0][$property_ptr->{$property_ptr->}]=Form:C1466.bc1.breadCrumb.sectionList[Form:C1466.Section_pos-1][$property_ptr->{$property_ptr->}])
					bgStylesValue{$property_ptr->}:=0
				Else 
					bgStylesValue{$property_ptr->}:=Bold:K14:2
				End if 
			End if 
		End if 
		
	: ($level="states")
		
		If (Form:C1466.currentState#AJUI_bc_standard_default)
			If (Form:C1466.bc1[$formula](AJUI_bc_standard_default)#Form:C1466.bc1[$formula](Form:C1466.currentState))
				bgStylesValue{$property_ptr->}:=Bold:K14:2
			Else 
				bgStylesValue{$property_ptr->}:=0
			End if 
		Else 
			If (Form:C1466.defaultValues[$formula](AJUI_bc_standard_default)#Form:C1466.bc1[$formula](Form:C1466.currentState))
				bgStylesValue{$property_ptr->}:=Bold:K14:2
			Else 
				bgStylesValue{$property_ptr->}:=0
			End if 
		End if 
		
End case 