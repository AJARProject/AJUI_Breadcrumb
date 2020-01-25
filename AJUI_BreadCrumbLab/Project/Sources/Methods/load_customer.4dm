//%attributes = {"shared":true}
  // load_customer () 
  //
  // Customer callback for HDI_ex1

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 04.11.19, 15:55:53
	  // ----------------------------------------------------
	  // Method: load_customer
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


  // set the section to current
If (Form:C1466.currentHDISection#"customer")
	$id:="customer"
	Form:C1466.bc1.SetCurrentSection($id)
	$id2:="offers-orders"
	$pos:=This:C1470.breadCrumb.sectionList.extract("id").indexOf($id2)
	HDI_setNextDisable ($pos)
	
	OBJECT SET SUBFORM:C1138(*;"sales_sf";"Customer")
	Form:C1466.bc1.Draw()
	
	Form:C1466.currentHDISection:=$id
End if 