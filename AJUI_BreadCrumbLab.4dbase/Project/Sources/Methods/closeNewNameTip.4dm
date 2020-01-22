//%attributes = {}
  // closeNewNameTip ( $validated ) -> return
  //
  // $1 : (boolean) action validated
  //
  // This method handle the result of the subform to create or rename a template.

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.10.19, 09:35:05
	  // ----------------------------------------------------
	  // Method: closeNewNameTip
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_BOOLEAN:C305($1)
C_OBJECT:C1216($section)
C_TEXT:C284($nameTemplate;$newNameTemplate)

If ($1)
	C_POINTER:C301($templates_ptr)
	$templates_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"templates_list")
	
	  //check it's a rename or a new template
	If (Form:C1466.tip_sf_details.rename)
		$icon:=getTLocIcon ($templates_ptr->{$templates_ptr->})
		$pos:=Find in array:C230($templates_ptr->;Form:C1466.bc1.templateName+$icon)
		If ($pos>0)
			C_OBJECT:C1216($file;$folder)
			$fileName:=Form:C1466.bc1.templateName
			
			If ($fileName#"")
				If ($fileName="@.json")
					  //do nothing
				Else 
					$fileName:=$fileName+".json"
				End if 
				
				$pathName:=getTlocPath (Form:C1466.bc1.templateName+$icon)
				$file:=File:C1566($pathName+$fileName;fk platform path:K87:2)
				
				  //replace the old template with the new one
				If ($file.exists)  //check file
					$newNameTemplate:=Form:C1466.tip_sf_details.templateName
					$file:=$file.rename($newNameTemplate+".json")
					If ($file.exists)
						
						Form:C1466.bc1.templateName:=$newNameTemplate
						Form:C1466.bc1.Export($newNameTemplate;$pathName)
						
						$folder:=Folder:C1567($pathName;fk platform path:K87:2)
						If ($folder.name=(Replace string:C233($fileName;".json";"")))
							$folder:=$folder.rename($newNameTemplate)
							If (Not:C34($folder.exists))
								ALERT:C41("File renamed correctly, but the renaming of the folder failed")
							End if 
						End if 
						
						$templates_ptr->{$templates_ptr->}:=$newNameTemplate+$icon
						
						SORT ARRAY:C229($templates_ptr->)
						$pos:=Find in array:C230($templates_ptr->;Form:C1466.bc1.templateName+$icon)
						$templates_ptr->:=$pos
					Else 
						ALERT:C41("Unknow error : can't rename the template")
					End if 
				Else 
					ALERT:C41("File not found"+"\r\r"+$pathName)
				End if 
			End if 
		Else 
			ALERT:C41("No template selected")
		End if 
	Else 
		
		  //create new template
		Form:C1466.bc1:=New AJUI_BreadCrumb 
		Form:C1466.bc1.Name("bc1")
		Form:C1466.bc1.AddSection("sect1")
		Form:C1466.bc1.templateName:=Form:C1466.tip_sf_details.templateName
		
		statesBreadCrumbReset 
		
		
		  //save new template
		$icon:=Form:C1466.tip_sf_details.tempIcon
		$nameTemplate:=Form:C1466.bc1.templateName
		Form:C1466.bc1.Export($nameTemplate;getTlocPath ($icon))
		$nameTemplate:=$nameTemplate+$icon
		$pos:=Find in array:C230($templates_ptr->;$nameTemplate)
		If ($pos>0)
			  //nothing to do
		Else 
			APPEND TO ARRAY:C911($templates_ptr->;$nameTemplate)
			SORT ARRAY:C229($templates_ptr->)
			$pos:=Find in array:C230($templates_ptr->;$nameTemplate)
			$templates_ptr->:=$pos
		End if 
		
		setGlobal 
		
		REDRAW:C174(OBJECT Get pointer:C1124(Object named:K67:5;"LB_properties")->)
		resetBreadCrumbsToOriginCoord 
		
		Form:C1466.btnSave.Enable(False:C215)
		Form:C1466.btnSave.Draw()
		
		Form:C1466.bc1.Draw()
		statesBreadCrumbsDraw 
		
		
	End if 
	Form:C1466.currentBC:=OB Copy:C1225(Form:C1466.bc1)
	  //enable/disable template buttons
	templatesButtonsEnable (True:C214;"btnSave")
Else 
	  //enable/disable template buttons
	If (Form:C1466.btnSaveActive)
		templatesButtonsEnable (True:C214)
	Else 
		templatesButtonsEnable (True:C214;"btnSave")
	End if 
End if 

Form:C1466.tipNewTemplate.Hide()