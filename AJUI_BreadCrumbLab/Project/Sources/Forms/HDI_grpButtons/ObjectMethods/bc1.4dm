
Case of 
	: (Form event code:C388=On Load:K2:1)
		C_OBJECT:C1216($bc)
		$bc:=New object:C1471()
		$bc.templateName:="groupedBtn_selection.json"
		
		
		Form:C1466.bc1:=New AJUI_BreadCrumb ($bc)
		Form:C1466.bc1.Name("bc1")
		
		  //add callback
		$section_obj:=New object:C1471
		$section_obj.onClickCB:="HDI_setNote"
		$params:=New object:C1471
		$params.notationNB:=1
		For ($i;1;5)
			$params.note:=$i
			$section_obj.onClickCBParams:=OB Copy:C1225($params)
			Form:C1466.bc1.UpdateSection("note"+String:C10($i);$section_obj)
		End for 
		
		
	: (Form event code:C388=On Clicked:K2:4)
		
		
		
End case 

Form:C1466.bc1.Draw()