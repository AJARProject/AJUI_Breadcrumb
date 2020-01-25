$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		Form:C1466.bc1:=New AJUI_BreadCrumb 
		Form:C1466.bc1.AddSection("sect1")
		Form:C1466.bc1.AddSection("sect2")
		Form:C1466.bc1.Name("bc1")
End case 
Form:C1466.bc1.Draw()
