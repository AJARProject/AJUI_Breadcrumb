//%attributes = {}
  // StatesSetValues ( $type ) -> return
  //
  // $1 : (text) $type
  //
  // Set the properties for the four Breadcrumb representing the states in the lab

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 09.10.19, 14:51:12
	  // ----------------------------------------------------
	  // Method: StatesSetValues
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
C_TEXT:C284($1;$type)
C_COLLECTION:C1488($properties_col)

$type:=$1
$properties_col:=Form:C1466.properties.query("level = :1";"states")

For ($i;0;$properties_col.length-1)
	
	Form:C1466.bc2[$properties_col[$i].formula](AJUI_bc_standard_default;Form:C1466.bc1[$properties_col[$i].formula]($type+"-default"))
	Form:C1466.bc3[$properties_col[$i].formula](AJUI_bc_standard_default;Form:C1466.bc1[$properties_col[$i].formula]($type+"-hover"))
	Form:C1466.bc4[$properties_col[$i].formula](AJUI_bc_standard_default;Form:C1466.bc1[$properties_col[$i].formula]($type+"-active"))
	Form:C1466.bc5[$properties_col[$i].formula](AJUI_bc_standard_default;Form:C1466.bc1[$properties_col[$i].formula]($type+"-disable"))
	
End for 
