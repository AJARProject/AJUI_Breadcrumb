$evt:=Form event code:C388


Case of 
	: ($evt=On Load:K2:1)
		
		If (Form:C1466.customerSelected#Null:C1517)
			LISTBOX SELECT ROW:C912(*;"companies_lb";Form:C1466.customerSelected+1;lk replace selection:K53:1)
			
		End if 
		
		
		
	: ($evt=On Clicked:K2:4)
		C_LONGINT:C283($col;$row)
		  // line selected
		LISTBOX GET CELL POSITION:C971(*;"companies_lb";$col;$row)
		If ($row>0)
			Form:C1466.bc1.UpdateSection("customer";New object:C1471("disable";False:C215;"type";"next"))
			Form:C1466.bc1.UpdateSection("offers-orders";New object:C1471("disable";False:C215;"type";"next"))
			Form:C1466.customerSelected:=$row-1
			
			Form:C1466.customerOffers:=New collection:C1472()
			Form:C1466.customerOffers:=Form:C1466.offers.query("nameCompany = :1";Form:C1466.companies[Form:C1466.customerSelected].name)
			
		End if 
		
		CALL FORM:C1391(Current form window:C827;"HDI_draw")
		
End case 

