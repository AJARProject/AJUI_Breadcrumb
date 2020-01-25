//%attributes = {"shared":true}
  // load_delivery (  )
  //
  // Delivery callback for HDI_ex1

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 04.11.19, 15:57:14
	  // ----------------------------------------------------
	  // Method: load_delivery
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


$id:="delivery"

OBJECT SET SUBFORM:C1138(*;"sales_sf";"Delivery")
Form:C1466.currentHDISection:=$id

Form:C1466.bc1.SetCurrentSection($id)
