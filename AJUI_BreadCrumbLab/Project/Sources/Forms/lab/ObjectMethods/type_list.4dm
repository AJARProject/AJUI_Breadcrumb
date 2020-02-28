C_POINTER:C301($type_list_ptr)
C_TEXT:C284($type)
C_OBJECT:C1216($section)

$evt:=Form event code:C388
$type_list_ptr:=OBJECT Get pointer:C1124(Object current:K67:2)
Case of 
	: ($evt=On Load:K2:1)
		
	: ($evt=On Data Change:K2:15)
		Form:C1466.currentType:=$type_list_ptr->{$type_list_ptr->}
		
		
		$position:=Form:C1466.State_pos
		
		Case of 
				  //standard
			: ($position=1) & (Form:C1466.currentType="standard")
				Form:C1466.currentState:=AJUI_bc_standard_default
			: ($position=2) & (Form:C1466.currentType="standard")
				Form:C1466.currentState:=AJUI_bc_standard_hover
			: ($position=3) & (Form:C1466.currentType="standard")
				Form:C1466.currentState:=AJUI_bc_standard_active
			: ($position=4) & (Form:C1466.currentType="standard")
				Form:C1466.currentState:=AJUI_bc_standard_disable
				  //first
			: ($position=1) & (Form:C1466.currentType="first")
				Form:C1466.currentState:=AJUI_bc_first_default
			: ($position=2) & (Form:C1466.currentType="first")
				Form:C1466.currentState:=AJUI_bc_first_hover
			: ($position=3) & (Form:C1466.currentType="first")
				Form:C1466.currentState:=AJUI_bc_first_active
			: ($position=4) & (Form:C1466.currentType="first")
				Form:C1466.currentState:=AJUI_bc_first_disable
				  //current
			: ($position=1) & (Form:C1466.currentType="current")
				Form:C1466.currentState:=AJUI_bc_current_default
			: ($position=2) & (Form:C1466.currentType="current")
				Form:C1466.currentState:=AJUI_bc_current_hover
			: ($position=3) & (Form:C1466.currentType="current")
				Form:C1466.currentState:=AJUI_bc_current_active
			: ($position=4) & (Form:C1466.currentType="current")
				Form:C1466.currentState:=AJUI_bc_current_disable
				  //next
			: ($position=1) & (Form:C1466.currentType="next")
				Form:C1466.currentState:=AJUI_bc_next_default
			: ($position=2) & (Form:C1466.currentType="next")
				Form:C1466.currentState:=AJUI_bc_next_hover
			: ($position=3) & (Form:C1466.currentType="next")
				Form:C1466.currentState:=AJUI_bc_next_active
			: ($position=4) & (Form:C1466.currentType="next")
				Form:C1466.currentState:=AJUI_bc_next_disable
				  //previous
			: ($position=1) & (Form:C1466.currentType="previous")
				Form:C1466.currentState:=AJUI_bc_previous_default
			: ($position=2) & (Form:C1466.currentType="previous")
				Form:C1466.currentState:=AJUI_bc_previous_hover
			: ($position=3) & (Form:C1466.currentType="previous")
				Form:C1466.currentState:=AJUI_bc_previous_active
			: ($position=4) & (Form:C1466.currentType="previous")
				Form:C1466.currentState:=AJUI_bc_previous_disable
			Else 
				Form:C1466.currentState:=AJUI_bc_standard_default
		End case 
		
		
		Form:C1466.timerCase:="select"
		SET TIMER:C645(-1)
End case 