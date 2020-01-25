//%attributes = {}
  // FormulaSetValue (  ) 
  //
  //
  // Will find the formula to use the good Setter for the new value (for each level).

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 07.10.19, 09:16:10
	  // ----------------------------------------------------
	  // Method: FormulaSetValue
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($id)
C_POINTER:C301($values_ptr)
C_OBJECT:C1216($section)
C_COLLECTION:C1488($properties_col)

$values_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"value_col")
$properties_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"property_col")
$properties_col:=queryPropertiesCol (Form:C1466.currentLevel)

Case of 
	: (Form:C1466.currentLevel="global")  //GLOBAL
		
		Form:C1466.bc1[$properties_col[$values_ptr->-1].formula]($values_ptr->{$values_ptr->}.value)
		Form:C1466.bc2[$properties_col[$values_ptr->-1].formula]($values_ptr->{$values_ptr->}.value)
		Form:C1466.bc3[$properties_col[$values_ptr->-1].formula]($values_ptr->{$values_ptr->}.value)
		Form:C1466.bc4[$properties_col[$values_ptr->-1].formula]($values_ptr->{$values_ptr->}.value)
		Form:C1466.bc5[$properties_col[$values_ptr->-1].formula]($values_ptr->{$values_ptr->}.value)
		
		If ($properties_ptr->{$properties_ptr->}="model")
			setGlobal 
			LISTBOX SELECT ROW:C912(*;"LB_properties";1)  //focus lost after the setGlobal, we need to reselect the model line for the setPropertyStyle
		Else 
			
			
			If ($properties_ptr->{$properties_ptr->}="dynamicSize")
				If (Not:C34($values_ptr->{$values_ptr->}.value))
					resetBreadCrumbsToOriginCoord 
				End if 
			End if 
			
			If ($properties_ptr->{$properties_ptr->}="@color@")
				setArrayColor ($values_ptr->{$values_ptr->}.value;$values_ptr->)
			End if 
		End if 
		
		setPropertyStyle (Form:C1466.currentLevel)
		Form:C1466.btnSave.Enable(True:C214)
		Form:C1466.btnSave.Draw()
		
		
	: (Form:C1466.currentLevel="sections")  //SECTION
		
		If (Form:C1466.Section_pos>0)
			$id:=Form:C1466.bc1.breadCrumb.sectionList[Form:C1466.Section_pos-1].id
			Form:C1466.bc1.UpdateSection($id;New object:C1471($properties_ptr->{$properties_ptr->};$values_ptr->{$values_ptr->}.value))
			$id:=Form:C1466.bc1.breadCrumb.sectionList[Form:C1466.Section_pos-1].id
			statesBreadCrumbsUpdateSection (Form:C1466.bc1.UpdateSection($id))
			
			
			If ($properties_ptr->{$properties_ptr->}="position") | ($properties_ptr->{$properties_ptr->}="id")
				Form:C1466.sections_col:=New collection:C1472()
				For each ($section;Form:C1466.bc1.breadCrumb.sectionList)
					Form:C1466.sections_col.push($section.id)
				End for each 
			End if 
			
			If ($properties_ptr->{$properties_ptr->}="@color@")
				setArrayColor ($values_ptr->{$values_ptr->}.value;$values_ptr->)
			End if 
			
			setPropertyStyle (Form:C1466.currentLevel)
			Form:C1466.btnSave.Enable(True:C214)
			Form:C1466.btnSave.Draw()
			
			
		Else 
			ALERT:C41("Select a section !")
		End if 
		
	: (Form:C1466.currentLevel="states")  //STATE
		
		If (Form:C1466.State_pos>0)
			
			Form:C1466.bc1[$properties_col[$values_ptr->-1].formula](Form:C1466.currentState;$values_ptr->{$values_ptr->}.value)
			
			$separator_pos:=Position:C15("-";Form:C1466.currentState)
			$type:=Substring:C12(Form:C1466.currentState;1;$separator_pos-1)
			
			If (Form:C1466.trueType=$type)
				Case of 
					: (Form:C1466.currentState="@default")
						Form:C1466.bc2[$properties_col[$values_ptr->-1].formula](AJUI_bc_standard_default;Form:C1466.bc1[$properties_col[$values_ptr->-1].formula]($type+"-default"))
						Form:C1466.bc3[$properties_col[$values_ptr->-1].formula](AJUI_bc_standard_default;Form:C1466.bc1[$properties_col[$values_ptr->-1].formula]($type+"-hover"))
						Form:C1466.bc4[$properties_col[$values_ptr->-1].formula](AJUI_bc_standard_default;Form:C1466.bc1[$properties_col[$values_ptr->-1].formula]($type+"-active"))
						Form:C1466.bc5[$properties_col[$values_ptr->-1].formula](AJUI_bc_standard_default;Form:C1466.bc1[$properties_col[$values_ptr->-1].formula]($type+"-disable"))
					: (Form:C1466.currentState="@hover")
						Form:C1466.bc3[$properties_col[$values_ptr->-1].formula](AJUI_bc_standard_default;$values_ptr->{$values_ptr->}.value)
					: (Form:C1466.currentState="@active")
						Form:C1466.bc4[$properties_col[$values_ptr->-1].formula](AJUI_bc_standard_default;$values_ptr->{$values_ptr->}.value)
					: (Form:C1466.currentState="@disable")
						Form:C1466.bc5[$properties_col[$values_ptr->-1].formula](AJUI_bc_standard_default;$values_ptr->{$values_ptr->}.value)
				End case 
			End if 
			
			If ($properties_ptr->{$properties_ptr->}="@color@")
				setArrayColor ($values_ptr->{$values_ptr->}.value;$values_ptr->)
			End if 
			
			setPropertyStyle (Form:C1466.currentLevel)
			Form:C1466.btnSave.Enable(True:C214)
			Form:C1466.btnSave.Draw()
			
		Else 
			ALERT:C41("Select a state !")
		End if 
		
End case 


Form:C1466.timerCase:="draw"
SET TIMER:C645(-1)