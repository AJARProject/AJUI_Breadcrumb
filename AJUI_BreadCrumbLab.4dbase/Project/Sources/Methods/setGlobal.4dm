//%attributes = {}
  // setGlobal (  )
  //
  //
  // Put the lab in the global level after loading, creating, reloading,... a template

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 22.10.19, 15:17:34
	  // ----------------------------------------------------
	  // Method: setGlobal
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
C_POINTER:C301($level_list_ptr)

$level_list_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"level_list")
$level_list_ptr->:=1

Form:C1466.currentLevel:="global"
OBJECT SET VISIBLE:C603(*;"states_lb";False:C215)
OBJECT SET VISIBLE:C603(*;"sections_lb";False:C215)
OBJECT SET VISIBLE:C603(*;"btnAdd";False:C215)
OBJECT SET VISIBLE:C603(*;"btnRemove";False:C215)
OBJECT SET VISIBLE:C603(*;"type_list";False:C215)

Form:C1466.State_pos:=0
Form:C1466.Section_pos:=0
formulasGetCatAndProps ($level_list_ptr->{$level_list_ptr->})