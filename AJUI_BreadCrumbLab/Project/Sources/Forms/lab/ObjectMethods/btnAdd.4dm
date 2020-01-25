C_POINTER:C301($templates_ptr)

Case of 
	: (Form event code:C388=On Load:K2:1)
		Form:C1466.btnAdd:=newTemplateButton 
		Form:C1466.btnAdd.Name("btnAdd")
		Form:C1466.btnAdd.Type("rectangle")
		Form:C1466.btnAdd.Label(AJUI_btn_default;"Add")
		Form:C1466.btnAdd.Height(AJUI_btn_default;25)
		Form:C1466.btnAdd.Width(AJUI_btn_default;25)
		Form:C1466.btnAdd.PicturePath(AJUI_btn_default;"svg/Deemak_Daksina/3994437---add-create-new-plus-positive.svg")
		
	: (Form event code:C388=On Clicked:K2:4)
		C_OBJECT:C1216($section)
		Form:C1466.bc1.AddSection("sect"+String:C10(Form:C1466.bc1.GetNextPosition()))
		
		Form:C1466.sections_col:=New collection:C1472()
		For each ($section;Form:C1466.bc1.breadCrumb.sectionList)
			Form:C1466.sections_col.push($section.id)
		End for each 
		
		Form:C1466.btnSave.Enable(True:C214)
		Form:C1466.btnSave.Draw()
		Form:C1466.bc1.Draw()
		
		
End case 

Form:C1466.btnAdd.Draw()