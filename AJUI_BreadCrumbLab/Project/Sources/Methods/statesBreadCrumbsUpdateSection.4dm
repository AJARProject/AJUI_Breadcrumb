//%attributes = {}
  // stateBreadCrumbUpdateSection ( $update_obj ) 
  //
  // $1 : (object) section parameters to update
  //
  // update the sections for the four Breadcrumb representing the states in the lab

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 07.10.19, 13:39:43
	  // ----------------------------------------------------
	  // Method: stateBreadCrumbUpdateSection
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($1;$update_obj)
C_TEXT:C284($type)

$update_obj:=OB Copy:C1225($1)


OB REMOVE:C1226($update_obj;"id")
OB REMOVE:C1226($update_obj;"position")
$type:=$update_obj.type
Form:C1466.trueType:=$type
$update_obj.type:="standard"

Form:C1466.bc2.UpdateSection("ex1";$update_obj)
Form:C1466.bc2.UpdateSection("ex2";$update_obj)
Form:C1466.bc2.UpdateSection("ex3";$update_obj)

Form:C1466.bc3.UpdateSection("ex1";$update_obj)
Form:C1466.bc3.UpdateSection("ex2";$update_obj)
Form:C1466.bc3.UpdateSection("ex3";$update_obj)

Form:C1466.bc4.UpdateSection("ex1";$update_obj)
Form:C1466.bc4.UpdateSection("ex2";$update_obj)
Form:C1466.bc4.UpdateSection("ex3";$update_obj)

Form:C1466.bc5.UpdateSection("ex1";$update_obj)
Form:C1466.bc5.UpdateSection("ex2";$update_obj)
Form:C1466.bc5.UpdateSection("ex3";$update_obj)

StatesSetValues ($type)
