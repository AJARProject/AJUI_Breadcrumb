  //method to set the default value when the user ctrl click a property in the listbox
$evt:=Form event code:C388

Case of 
	: ($evt=On Clicked:K2:4)
		C_BOOLEAN:C305($check_ctrl)
		If (Is macOS:C1572)
			$check_ctrl:=Macintosh control down:C544
		Else 
			$check_ctrl:=Macintosh command down:C546
		End if 
		If ($check_ctrl)
			
			If (Form:C1466.currentLevel="states") & (Form:C1466.currentState#AJUI_bc_standard_default)
				
				C_LONGINT:C283($column;$row)
				LISTBOX GET CELL POSITION:C971(*;"LB_properties";$column;$row)
				If ($row>0)
					
					$statesProp_col:=queryPropertiesCol ("states")
					
					Form:C1466.bc1.RemovePropertyException($statesProp_col[$row-1].formula;Form:C1466.currentState)
					
					Form:C1466.btnSave.Enable(True:C214)
					Form:C1466.btnSave.Draw()
					
					Form:C1466.timerCase:="select"
					SET TIMER:C645(-1)
				End if 
				
			Else 
				C_POINTER:C301($property_ptr;$value_ptr;$category_ptr)
				C_COLLECTION:C1488($properties_col)
				$property_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"property_col")
				$value_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"value_col")
				$category_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"category_col")
				$properties_col:=Form:C1466.properties.query("level = :1 & property = :2 & category = :3";Form:C1466.currentLevel;$property_ptr->{$property_ptr->};$category_ptr->{$category_ptr->})
				
				If ($properties_col.length>0)
					If (bgStylesValue{$property_ptr->}>0)
						C_TEXT:C284($formula)
						$formula:=$properties_col[0].formula
						
						  //process like a manual data change
						Case of 
							: (Form:C1466.currentLevel="global")
								$value_ptr->{$value_ptr->}.value:=Form:C1466.defaultValues[$formula]()
							: (Form:C1466.currentLevel="sections")
								If ($property_ptr->{$property_ptr->}#"id") | ($property_ptr->{$property_ptr->}#"position")
									$value_ptr->{$value_ptr->}.value:=Form:C1466.defaultValues.breadCrumb.sectionList[0][$property_ptr->{$property_ptr->}]
								End if 
							: (Form:C1466.currentLevel="states")
								$value_ptr->{$value_ptr->}.value:=Form:C1466.defaultValues[$formula](AJUI_bc_standard_default)
						End case 
						
						If ($property_ptr->{$property_ptr->}="centered")
							resetBreadCrumbsToOriginCoord 
						End if 
						
						FormulaSetValue 
						
					End if 
				End if 
			End if 
			
			
		End if 
End case 
