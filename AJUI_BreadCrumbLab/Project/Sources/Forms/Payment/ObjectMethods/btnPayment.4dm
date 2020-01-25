

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.btnPayment:=New AJUI_Button 
		Form:C1466.btnPayment.Name("btnPayment")
		
		Form:C1466.btnPayment.Type("circle")
		Form:C1466.btnPayment.Composition("picture")
		
		  //box
		Form:C1466.btnPayment.BGColor(AJUI_btn_default;"#4d9ad4")
		Form:C1466.btnPayment.BGColor(AJUI_btn_hover;"#005EA8")
		Form:C1466.btnPayment.BGColor(AJUI_btn_active;"white")
		Form:C1466.btnPayment.Resizable(True:C214)
		Form:C1466.btnPayment.Height(AJUI_btn_default;250)
		Form:C1466.btnPayment.Width(AJUI_btn_default;250)
		
		  //border
		Form:C1466.btnPayment.BorderColor(AJUI_btn_default;"lightgrey")
		Form:C1466.btnPayment.BorderSize(AJUI_btn_default;15)
		
		  // pict
		Form:C1466.btnPayment.ColorToReplace(AJUI_btn_default;"#212121")
		Form:C1466.btnPayment.ReplacingColor(AJUI_btn_active;"gray")
		If (Form:C1466.customerOffers[Form:C1466.offerSelected].payment_date#Null:C1517)
			Form:C1466.btnPayment.PicturePath(AJUI_btn_default;"svg/4DMobileIcons/actions 2/Selected Sell-cashier.svg")
			Form:C1466.btnPayment.ReplacingColor(AJUI_btn_default;"green")
		Else 
			Form:C1466.btnPayment.PicturePath(AJUI_btn_default;"svg/4DMobileIcons/actions 2/Sell-cashier.svg")
			Form:C1466.btnPayment.ReplacingColor(AJUI_btn_default;"red")
		End if 
		Form:C1466.btnPayment.PictureHeight(AJUI_btn_default;180)
		Form:C1466.btnPayment.PictureWidth(AJUI_btn_default;180)
		
	: (Form event code:C388=On Mouse Enter:K2:33)
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		
		
	: (Form event code:C388=On Clicked:K2:4) & (Macintosh option down:C545)  // alt+clic (Mac) OR Option+clic (Windows)
		
	: (Form event code:C388=On Clicked:K2:4)
		If (Form:C1466.customerOffers[Form:C1466.offerSelected].payment_date#Null:C1517)
			Form:C1466.btnPayment.PicturePath(AJUI_btn_default;"svg/4DMobileIcons/actions 2/Sell-cashier.svg")
			OB REMOVE:C1226(Form:C1466.customerOffers[Form:C1466.offerSelected];"payment_date")
			Form:C1466.btnPayment.ReplacingColor(AJUI_btn_default;"red")
		Else 
			Form:C1466.btnPayment.PicturePath(AJUI_btn_default;"svg/4DMobileIcons/actions 2/Selected Sell-cashier.svg")
			Form:C1466.customerOffers[Form:C1466.offerSelected].payment_date:=Current date:C33
			Form:C1466.btnPayment.ReplacingColor(AJUI_btn_default;"green")
		End if 
		
		
End case 

Form:C1466.btnPayment.Draw()