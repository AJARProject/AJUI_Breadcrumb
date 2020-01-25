//%attributes = {}
  // stateBreadCrumbVisible ( $visible ) 
  //
  // $1 : (boolean) show/hide
  //
  // Show/hide the four Breadcrumb representing the states in the lab

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 07.10.19, 09:05:51
	  // ----------------------------------------------------
	  // Method: stateBreadCrumbVisible
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_BOOLEAN:C305($1;$visible)

$visible:=$1

OBJECT SET VISIBLE:C603(*;"bc2";$visible)
OBJECT SET VISIBLE:C603(*;"bc3";$visible)
OBJECT SET VISIBLE:C603(*;"bc4";$visible)
OBJECT SET VISIBLE:C603(*;"bc5";$visible)