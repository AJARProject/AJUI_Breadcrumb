$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		Form:C1466.bc5:=New AJUI_BreadCrumb 
		Form:C1466.bc5.Name("bc5")
		Form:C1466.bc5.AddSection("ex1";New object:C1471("label";"disable"))
		Form:C1466.bc5.AddSection("ex2";New object:C1471("label";"disable"))
		Form:C1466.bc5.AddSection("ex3";New object:C1471("label";"disable"))
		Form:C1466.bc5.Draw()
End case 