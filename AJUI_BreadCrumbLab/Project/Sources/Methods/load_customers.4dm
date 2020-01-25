//%attributes = {"shared":true}
  // load_customers (  )
  //
  // Customers callback for HDI_ex1

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 04.11.19, 15:56:42
	  // ----------------------------------------------------
	  // Method: load_customers
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


$id:="customers"


OBJECT SET SUBFORM:C1138(*;"sales_sf";"Customers")
Form:C1466.currentHDISection:=$id
  //End if 
Form:C1466.bc1.SetCurrentSection($id)

$pos:=This:C1470.breadCrumb.sectionList.extract("id").indexOf($id)
HDI_setNextDisable ($pos)

Form:C1466.bc1.Draw()