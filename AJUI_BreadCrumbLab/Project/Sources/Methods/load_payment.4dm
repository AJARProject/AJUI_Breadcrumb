//%attributes = {"shared":true}
  // load_payment (  )
  //
  // Payment callback for HDI_ex1

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 04.11.19, 15:58:33
	  // ----------------------------------------------------
	  // Method: load_payment
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


$id:="payment"

OBJECT SET SUBFORM:C1138(*;"sales_sf";"Payment")
Form:C1466.currentHDISection:=$id

Form:C1466.bc1.SetCurrentSection($id)