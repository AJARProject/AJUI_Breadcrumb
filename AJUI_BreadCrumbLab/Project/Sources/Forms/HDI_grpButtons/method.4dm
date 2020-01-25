$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		Form:C1466.notes:=New collection:C1472
		
		For ($i;1;3)
			Form:C1466.notes.push(0)
		End for 
		
End case 
