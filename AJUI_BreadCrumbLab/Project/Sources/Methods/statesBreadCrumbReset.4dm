//%attributes = {}
  // statesBreadCrumbReset (  ) 
  //
  // Reset the four Breadcrumb representing the states in the lab

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.10.19, 09:43:06
	  // ----------------------------------------------------
	  // Method: statesBreadCrumbReset
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

Form:C1466.bc2:=OB Copy:C1225(Form:C1466.bc1)
Form:C1466.bc2.RemoveAllSections()
Form:C1466.bc2.ResetAllStates()
Form:C1466.bc2.Name("bc2")
Form:C1466.bc2.AddSection("ex1";New object:C1471("label";"default"))
Form:C1466.bc2.AddSection("ex2";New object:C1471("label";"default"))
Form:C1466.bc2.AddSection("ex3";New object:C1471("label";"default"))
Form:C1466.bc3:=OB Copy:C1225(Form:C1466.bc1)
Form:C1466.bc3.RemoveAllSections()
Form:C1466.bc3.ResetAllStates()
Form:C1466.bc3.Name("bc3")
Form:C1466.bc3.AddSection("ex1";New object:C1471("label";"hover"))
Form:C1466.bc3.AddSection("ex2";New object:C1471("label";"hover"))
Form:C1466.bc3.AddSection("ex3";New object:C1471("label";"hover"))
Form:C1466.bc4:=OB Copy:C1225(Form:C1466.bc1)
Form:C1466.bc4.RemoveAllSections()
Form:C1466.bc4.ResetAllStates()
Form:C1466.bc4.Name("bc4")
Form:C1466.bc4.AddSection("ex1";New object:C1471("label";"active"))
Form:C1466.bc4.AddSection("ex2";New object:C1471("label";"active"))
Form:C1466.bc4.AddSection("ex3";New object:C1471("label";"active"))
Form:C1466.bc5:=OB Copy:C1225(Form:C1466.bc1)
Form:C1466.bc5.RemoveAllSections()
Form:C1466.bc5.ResetAllStates()
Form:C1466.bc5.Name("bc5")
Form:C1466.bc5.AddSection("ex1";New object:C1471("label";"disable"))
Form:C1466.bc5.AddSection("ex2";New object:C1471("label";"disable"))
Form:C1466.bc5.AddSection("ex3";New object:C1471("label";"disable"))