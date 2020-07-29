
$evt:=Form event code:C388
Case of 
	: ($evt=On Data Change:K2:15)
		C_POINTER:C301($values_ptr;$property_ptr)
		$property_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"property_col")
		$values_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"value_col")
		$property:=$property_ptr->{$property_ptr->}
		
		If ($property="centered")
			If ($values_ptr->{$values_ptr->}.value=False:C215)
				resetBreadCrumbsToOriginCoord 
			End if 
		End if 
		
		FormulaSetValue 
		
		  //advanced listbox : handle the alternative button
	: ($evt=On Clicked:K2:4) & (Macintosh option down:C545) & (Not:C34(Macintosh command down:C546)) & (Not:C34(Macintosh control down:C544))
		
		If (Form:C1466.currentLevel="sections")
			If (Form:C1466.Section_pos>0)
				CONFIRM:C162("Do you want to apply this value to all sections ?";"Yes";"No")
				If (OK=1)
					setValueToAllSections 
				End if 
			End if 
		End if 
		
	: ($evt=On Clicked:K2:4) & (Contextual click:C713) & (Form:C1466.currentLevel="states") & (Not:C34(Macintosh control down:C544))
		C_LONGINT:C283($column;$row)
		LISTBOX GET CELL POSITION:C971(*;"LB_properties";$column;$row)
		If ($row>0)
			
			C_POINTER:C301($property_ptr)
			$property_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"property_col")
			
			$refMenu:=Create menu:C408
			APPEND MENU ITEM:C411($refMenu;"Remove property exception")
			SET MENU ITEM PARAMETER:C1004($refMenu;-1;"RemovePropertyException")
			APPEND MENU ITEM:C411($refMenu;"Remove property exceptions")
			SET MENU ITEM PARAMETER:C1004($refMenu;-1;"RemovePropertyExceptions")
			APPEND MENU ITEM:C411($refMenu;"Remove property exceptions for the current type")
			SET MENU ITEM PARAMETER:C1004($refMenu;-1;"RemovePropertyTypeExceptions")
			
			$choix:=Dynamic pop up menu:C1006($refMenu)
			RELEASE MENU:C978($refMenu)
			
			If ($choix#"")
				C_COLLECTION:C1488($statesProp_col)
				$statesProp_col:=queryPropertiesCol ("states")
				
				Case of 
					: ($choix="RemovePropertyException")
						
						Form:C1466.bc1.RemovePropertyException($statesProp_col[$row-1].formula;Form:C1466.currentState)
					: ($choix="RemovePropertyExceptions")
						Form:C1466.bc1.RemovePropertyExceptions($statesProp_col[$row-1].formula)
					: ($choix="RemovePropertyTypeExceptions")
						C_POINTER:C301($type_list_ptr)
						$type_list_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"type_list")
						Form:C1466.bc1.RemovePropertyTypeExceptions($statesProp_col[$row-1].formula;$type_list_ptr->{$type_list_ptr->})
				End case 
				
				
				
				Form:C1466.btnSave.Enable(True:C214)
				Form:C1466.btnSave.Draw()
				
				Form:C1466.timerCase:="select"
				SET TIMER:C645(-1)
			End if 
			
			
		End if 
		
	: ($evt=On Alternative Click:K2:36)
		C_POINTER:C301($values_ptr;$property_ptr)
		$values_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"value_col")
		$property_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"property_col")
		$property:=$property_ptr->{$property_ptr->}
		
		  //path properties : open the select document
		If ($property="@path@")
			$resourcePath:=Get 4D folder:C485(Current resources folder:K5:16;*)
			$doc:=Select document:C905($resourcePath;"*";"Select the picture path";Package open:K24:8+Use sheet window:K24:11)
			
			$values_ptr->{$values_ptr->}.value:=Replace string:C233(Document;Folder separator:K24:12;"/")
			
		Else 
			  //color properties : launch the color picker
			$bgcolor_l:=Select RGB color:C956(setPickerColor ($values_ptr->{$values_ptr->}.value);"Select the Background Color")
			$bgcolor_t:=Replace string:C233(String:C10($bgcolor_l;"&$");"$";"")
			$bgcolor_t:=(6-Length:C16($bgcolor_t)*"0"+$bgcolor_t)
			$bgcolor_t:="#"+$bgcolor_t
			
			$values_ptr->{$values_ptr->}.value:=$bgcolor_t
		End if 
		
		
		FormulaSetValue 
		
End case 