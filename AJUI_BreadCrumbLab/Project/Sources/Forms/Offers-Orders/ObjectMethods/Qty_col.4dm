$evt:=Form event code:C388

Case of 
	: ($evt=On Data Change:K2:15)
		
		This:C1470.total:=This:C1470.qty*This:C1470.unitPrice
		Form:C1466.customerOffers:=Form:C1466.customerOffers
		
End case 
