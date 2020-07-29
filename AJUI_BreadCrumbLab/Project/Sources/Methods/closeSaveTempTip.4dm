//%attributes = {}
  // closeSaveTempTip ( param1 ) 
  //
  // param1 : (boolean) save  template
  //
  // Save the template if validate 

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 04.12.19, 08:59:23
	  // ----------------------------------------------------
	  // Method: closeSaveTempTip
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_BOOLEAN:C305($1)


If ($1)
	C_OBJECT:C1216($file;$folder)
	C_POINTER:C301($templates_ptr)
	C_COLLECTION:C1488($sectionWithPict_col)
	
	$templates_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"templates_list")
	$icon:=Form:C1466.tip_sf_details.tempIcon
	$templateName:=Form:C1466.bc1.templateName
	
	  //save template
	  //check picture
	$sectionWithPict_col:=Form:C1466.bc1.breadCrumb.sectionList.query("picturePath # :1";"")
	If ($sectionWithPict_col.length<=0)
		  //Form.bc1.Export($templateName;getTlocPath ($icon))
		  //$folder:=Folder(getTlocPath ($icon)+$templateName+Folder separator;fk platform path)
		  //If ($folder.exists)
		  //$folder.delete(Delete with contents)
		  //End if 
	Else 
		$folder:=Folder:C1567(Form:C1466.tip_sf_details.currentTemplatePath+$templateName+Folder separator:K24:12;fk platform path:K87:2)
		If ($folder.exists)
			copyPictToFolderTemp (getTlocPath ($icon)+$templateName+Folder separator:K24:12;$folder.platformPath)
		Else 
			copyPictToFolderTemp (getTlocPath ($icon)+$templateName+Folder separator:K24:12;Form:C1466.tip_sf_details.currentTemplatePath)
		End if 
		
		Form:C1466.bc1.Export($templateName;getTlocPath ($icon)+$templateName+Folder separator:K24:12)
		Form:C1466.bc1.breadCrumb.global.importPath:=getTlocPath ($icon)+$templateName+Folder separator:K24:12  //update in case of we save in not the same folder
		$file:=File:C1566(getTlocPath ($icon)+$templateName+".json";fk platform path:K87:2)
		If ($file.exists)
			$file.delete()
		End if 
	End if 
	
	$pos:=Find in array:C230($templates_ptr->;$templateName+$icon)
	If ($pos>0)
		  //nothing to do
	Else 
		APPEND TO ARRAY:C911($templates_ptr->;$templateName+$icon)
		SORT ARRAY:C229($templates_ptr->)
		$pos:=Find in array:C230($templates_ptr->;$templateName+$icon)
		$templates_ptr->:=$pos
	End if 
	
	
	Form:C1466.currentBC:=OB Copy:C1225(Form:C1466.bc1)
	templatesButtonsEnable (True:C214;"btnSave")
	Form:C1466.timerCase:="select"
	SET TIMER:C645(-1)
Else 
	templatesButtonsEnable (True:C214)
End if 

Form:C1466.tipSaveTemplateSubform.Hide()