$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		
		
		
		
	: ($evt=On Selection Change:K2:29)
		  //update state for calls to member functions 
		GOTO OBJECT:C206(*;"")
		
		
		If (Form:C1466.Section_pos>0)
			statesBreadCrumbsUpdateSection (Form:C1466.bc1.breadCrumb.sectionList[Form:C1466.Section_pos-1])
		End if 
		
		
		Form:C1466.timerCase:="select"
		SET TIMER:C645(-1)
		
End case 
