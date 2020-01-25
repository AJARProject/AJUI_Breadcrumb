C_POINTER:C301($templates_ptr)

Case of 
	: (Form event code:C388=On Load:K2:1)
		Form:C1466.btnRemove:=newTemplateButton 
		Form:C1466.btnRemove.Name("btnRemove")
		Form:C1466.btnRemove.Type("rectangle")
		Form:C1466.btnRemove.Label(AJUI_btn_default;"Remove")
		Form:C1466.btnRemove.Height(AJUI_btn_default;25)
		Form:C1466.btnRemove.Width(AJUI_btn_default;25)
		Form:C1466.btnRemove.PicturePath(AJUI_btn_default;"svg/Deemak_Daksina/3994351---close-delete-minus-negative-remove.svg")
		
	: (Form event code:C388=On Clicked:K2:4)
		C_OBJECT:C1216($section)
		If (Form:C1466.Section_pos>0)
			Form:C1466.bc1.RemoveSection(Form:C1466.sections_col[Form:C1466.Section_pos-1])
			
			Form:C1466.sections_col:=New collection:C1472()
			For each ($section;Form:C1466.bc1.breadCrumb.sectionList)
				Form:C1466.sections_col.push($section.id)
			End for each 
			Form:C1466.btnSave.Enable(True:C214)
			Form:C1466.btnSave.Draw()
			Form:C1466.bc1.Draw()
		Else 
			ALERT:C41("Select a section !")
		End if 
		
		
End case 

Form:C1466.btnRemove.Draw()