//%attributes = {}
  // lab_call ( $newProcess ) -> return
  //
  // $1 : (boolean) check new process
  //
  // Setup and launch lab form

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 04.11.19, 15:51:13
	  // ----------------------------------------------------
	  // Method: lab_call
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_BOOLEAN:C305($1)

If (Count parameters:C259=0)
	$ref_process:=New process:C317(Current method name:C684;0;Current method name:C684;True:C214)
	SHOW PROCESS:C325($ref_process)
	BRING TO FRONT:C326($ref_process)
Else 
	$lab:=loadPropertiesCollection 
	$lab.templateLocPref:=TLoc_loadPathSettings 
	$lab.trueType:="standard"
	$ref_win:=Open form window:C675("lab";Plain form window:K39:10;On the left:K39:2;At the top:K39:5)
	DIALOG:C40("lab";$lab)
	CLOSE WINDOW:C154($ref_win)
End if 