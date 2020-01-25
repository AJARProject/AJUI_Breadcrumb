$evt:=Form event code:C388


Case of 
	: ($evt=On Load:K2:1)
		
		
		
		
		
	: ($evt=On Clicked:K2:4)
		C_LONGINT:C283($col;$row)
		  // line selected
		LISTBOX GET CELL POSITION:C971(*;"offers_lb";$col;$row)
		If ($row>0)
			Form:C1466.bc1.UpdateSection("delivery";New object:C1471("disable";False:C215;"type";"next"))
			Form:C1466.bc1.UpdateSection("payment";New object:C1471("disable";False:C215;"type";"next"))
			Form:C1466.offerSelected:=$row-1
		End if 
		
		CALL FORM:C1391(Current form window:C827;"HDI_draw")
		
End case 

