//%attributes = {"shared":true}
  // load_offer (  )
  //
  // Offer callback for HDI_ex1

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 04.11.19, 15:58:15
	  // ----------------------------------------------------
	  // Method: load_offer
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 



  // set the section to current
If (Form:C1466.currentHDISection#"offers-orders")
	$id:="offers-orders"
	Form:C1466.bc1.SetCurrentSection($id)
	OBJECT SET SUBFORM:C1138(*;"sales_sf";"Offers-Orders")
	$pos:=This:C1470.breadCrumb.sectionList.extract("id").indexOf($id)
	HDI_setNextDisable ($pos)
	
	Form:C1466.bc1.Draw()
	
	Form:C1466.currentHDISection:=$id
End if 