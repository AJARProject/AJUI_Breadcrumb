//%attributes = {}
  // HDI_ex1_call ( $newProcess ) -> return
  //
  // $1 : (boolean) check new process
  //
  // Setup and launch HDI_ex1 form

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 04.11.19, 15:38:55
	  // ----------------------------------------------------
	  // Method: HDI_ex1_call
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
	C_OBJECT:C1216($o)
	$o:=HDI_ex1_init 
	$ref_win:=Open form window:C675("HDI_example1";Plain form window:K39:10;On the left:K39:2;At the top:K39:5)
	DIALOG:C40("HDI_example1";$o)
	CLOSE WINDOW:C154($ref_win)
	
End if 