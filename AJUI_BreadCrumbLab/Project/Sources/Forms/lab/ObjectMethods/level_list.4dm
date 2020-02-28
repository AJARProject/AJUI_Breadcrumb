C_POINTER:C301($level_list_ptr)
C_TEXT:C284($type)
C_OBJECT:C1216($section)

$evt:=Form event code:C388
$level_list_ptr:=OBJECT Get pointer:C1124(Object current:K67:2)
Case of 
	: ($evt=On Load:K2:1)
		Form:C1466.currentLevel:="global"
		APPEND TO ARRAY:C911($level_list_ptr->;"global")
		APPEND TO ARRAY:C911($level_list_ptr->;"sections")
		APPEND TO ARRAY:C911($level_list_ptr->;"states")
		$level_list_ptr->:=1
	: ($evt=On Data Change:K2:15)
		
		  //Refresh lab based on level choosed
		Form:C1466.currentLevel:=$level_list_ptr->{$level_list_ptr->}
		Case of 
			: ($level_list_ptr->{$level_list_ptr->}="global")
				OBJECT SET VISIBLE:C603(*;"states_lb";False:C215)
				OBJECT SET VISIBLE:C603(*;"sections_lb";False:C215)
				OBJECT SET VISIBLE:C603(*;"type_list";False:C215)
				OBJECT SET VISIBLE:C603(*;"btnAdd";False:C215)
				OBJECT SET VISIBLE:C603(*;"btnRemove";False:C215)
				
				Form:C1466.Section_pos:=0
				Form:C1466.State_pos:=0
				
			: ($level_list_ptr->{$level_list_ptr->}="sections")
				OBJECT SET VISIBLE:C603(*;"states_lb";False:C215)
				OBJECT SET VISIBLE:C603(*;"sections_lb";True:C214)
				OBJECT SET VISIBLE:C603(*;"type_list";False:C215)
				OBJECT SET VISIBLE:C603(*;"btnAdd";True:C214)
				OBJECT SET VISIBLE:C603(*;"btnRemove";True:C214)
				Form:C1466.sections_col:=New collection:C1472()
				For each ($section;Form:C1466.bc1.breadCrumb.sectionList)
					Form:C1466.sections_col.push($section.id)
				End for each 
				
				
				Form:C1466.timerCase:="select"
				SET TIMER:C645(-1)
				
				Form:C1466.Section_pos:=1
			: ($level_list_ptr->{$level_list_ptr->}="states")
				
				C_POINTER:C301($type_list_ptr)
				
				$type_list_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"type_list")
				
				ARRAY TEXT:C222($type_list_ptr->;0)
				
				If (Form:C1466.bc1.Model()="groupedButtons")
					APPEND TO ARRAY:C911($type_list_ptr->;"standard")
					APPEND TO ARRAY:C911($type_list_ptr->;"current")
				Else 
					APPEND TO ARRAY:C911($type_list_ptr->;"standard")
					APPEND TO ARRAY:C911($type_list_ptr->;"first")
					APPEND TO ARRAY:C911($type_list_ptr->;"current")
					APPEND TO ARRAY:C911($type_list_ptr->;"next")
					APPEND TO ARRAY:C911($type_list_ptr->;"previous")
				End if 
				
				
				OBJECT SET VISIBLE:C603(*;"states_lb";True:C214)
				OBJECT SET VISIBLE:C603(*;"sections_lb";False:C215)
				OBJECT SET VISIBLE:C603(*;"type_list";True:C214)
				OBJECT SET VISIBLE:C603(*;"btnAdd";False:C215)
				OBJECT SET VISIBLE:C603(*;"btnRemove";False:C215)
				$type_list_ptr->:=1
				Form:C1466.currentType:="standard"
				LISTBOX SELECT ROW:C912(*;"states_lb";1)
				Form:C1466.currentState:=AJUI_bc_standard_default
				Form:C1466.State_pos:=1
		End case 
		
		formulasGetCatAndProps ($level_list_ptr->{$level_list_ptr->})
		
End case 