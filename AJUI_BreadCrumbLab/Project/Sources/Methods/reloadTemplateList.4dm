//%attributes = {}
  // reloadTemplateList ( ) 
  //
  //
  // Reload the template list to apply a filter or after a modification in the preference file.

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 20.11.19, 15:41:27
	  // ----------------------------------------------------
	  // Method: reloadTemplateList
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_POINTER:C301($templates_ptr)
C_POINTER:C301($locationTemp_ptr)

$locationTemp_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"locationTemp_list")
$templates_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"templates_list")
CLEAR VARIABLE:C89($templates_ptr->)
$tempCat:=$locationTemp_ptr->{$locationTemp_ptr->}

  //load global file
If ($tempCat="All") | ($tempCat="Global")
	If (Form:C1466.templateLocPref.path_global#"")
		$folder:=Folder:C1567(Form:C1466.templateLocPref.path_global;fk platform path:K87:2)
		If ($folder.exists)
			$templates_col:=AJUI_BC_loadTemplates ($folder.platformPath)
			
			For ($i;0;$templates_col.length-1)
				APPEND TO ARRAY:C911($templates_ptr->;$templates_col[$i].templateName+" (G)")
			End for 
		End if 
	End if 
End if 

  //load personal file
If ($tempCat="All") | ($tempCat="Personal")
	If (Form:C1466.templateLocPref.path_personal#"")
		$folder:=Folder:C1567(Form:C1466.templateLocPref.path_personal;fk platform path:K87:2)
		If ($folder.exists)
			
			$templates_col:=AJUI_BC_loadTemplates ($folder.platformPath)
			
			For ($i;0;$templates_col.length-1)
				APPEND TO ARRAY:C911($templates_ptr->;$templates_col[$i].templateName+" (P)")
			End for 
		End if 
	End if 
End if 

  //load shared file
If ($tempCat="All") | ($tempCat="Shared")
	If (Form:C1466.templateLocPref.path_shared#"")
		$folder:=Folder:C1567(Form:C1466.templateLocPref.path_shared;fk platform path:K87:2)
		If ($folder.exists)
			
			$templates_col:=AJUI_BC_loadTemplates ($folder.platformPath)
			
			For ($i;0;$templates_col.length-1)
				APPEND TO ARRAY:C911($templates_ptr->;$templates_col[$i].templateName+" (S)")
			End for 
		End if 
	End if 
End if 

SORT ARRAY:C229($templates_ptr->)

  //redraw buttons with the first template of the list
If (Size of array:C274($templates_ptr->)>0)
	$templates_ptr->:=1
	$templateName:=$templates_ptr->{1}
	$icon:=getTLocIcon ($templates_ptr->{$templates_ptr->})
	$templateName:=Substring:C12($templateName;1;Length:C16($templateName)-4)
	$template_obj:=New object:C1471("templateName";$templateName;"templatePath";getTlocPath ($templateName+$icon))
	Form:C1466.bc1:=New AJUI_BreadCrumb ($template_obj)
	Form:C1466.bc1.Name("bc1")
	statesBreadCrumbReset 
	Form:C1466.currentBC:=OB Copy:C1225(Form:C1466.bc1)
	
	bannerUpdate 
	setGlobal 
	
	
End if 
Form:C1466.timerCase:="select"
Form:C1466.btnSave.Enable(False:C215)
Form:C1466.btnSave.Draw()

SET TIMER:C645(-1)