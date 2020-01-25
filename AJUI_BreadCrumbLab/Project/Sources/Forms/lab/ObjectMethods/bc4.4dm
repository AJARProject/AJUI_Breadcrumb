$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		Form:C1466.bc4:=New AJUI_BreadCrumb 
		Form:C1466.bc4.Name("bc4")
		Form:C1466.bc4.AddSection("ex1";New object:C1471("label";"active"))
		Form:C1466.bc4.AddSection("ex2";New object:C1471("label";"active"))
		Form:C1466.bc4.AddSection("ex3";New object:C1471("label";"active"))
		Form:C1466.bc4.Draw()
End case 