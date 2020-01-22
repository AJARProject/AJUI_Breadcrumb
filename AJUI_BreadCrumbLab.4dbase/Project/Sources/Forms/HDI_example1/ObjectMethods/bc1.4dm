
Case of 
	: (Form event code:C388=On Load:K2:1)
		C_OBJECT:C1216($bc)
		$bc:=New object:C1471()
		$bc.templateName:="sales_bc.json"
		
		
		Form:C1466.bc1:=New AJUI_BreadCrumb ($bc)
		Form:C1466.bc1.Name("bc1")
		
		  //add callback
		$section_obj:=New object:C1471
		$section_obj.onClickCB:="load_customers"
		Form:C1466.bc1.UpdateSection("customers";$section_obj)
		$section_obj.onClickCB:="load_customer"
		Form:C1466.bc1.UpdateSection("customer";$section_obj)
		$section_obj.onClickCB:="load_offer"
		Form:C1466.bc1.UpdateSection("offers-orders";$section_obj)
		$section_obj.onClickCB:="load_delivery"
		Form:C1466.bc1.UpdateSection("delivery";$section_obj)
		$section_obj.onClickCB:="load_payment"
		Form:C1466.bc1.UpdateSection("payment";$section_obj)
		
		  // disable all the sections
		C_OBJECT:C1216($section)
		For each ($section;Form:C1466.bc1.breadCrumb.sectionList)
			$section.disable:=True:C214
		End for each 
		  // enable section "Customers"
		Form:C1466.bc1.breadCrumb.sectionList[0].disable:=False:C215
		
		
	: (Form event code:C388=On Clicked:K2:4)
		
		
		
End case 

Form:C1466.bc1.Draw()