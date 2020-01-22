$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		Form:C1466.bc2:=New AJUI_BreadCrumb 
		Form:C1466.bc2.Name("bc2")
		Form:C1466.bc2.AddSection("ex1";New object:C1471("label";"default"))
		Form:C1466.bc2.AddSection("ex2";New object:C1471("label";"default"))
		Form:C1466.bc2.AddSection("ex3";New object:C1471("label";"default"))
		Form:C1466.bc2.Draw()
End case 