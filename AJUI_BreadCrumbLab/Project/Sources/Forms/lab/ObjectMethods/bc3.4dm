$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		Form:C1466.bc3:=New AJUI_BreadCrumb 
		Form:C1466.bc3.Name("bc3")
		Form:C1466.bc3.AddSection("ex1";New object:C1471("label";"hover"))
		Form:C1466.bc3.AddSection("ex2";New object:C1471("label";"hover"))
		Form:C1466.bc3.AddSection("ex3";New object:C1471("label";"hover"))
		Form:C1466.bc3.Draw()
End case 