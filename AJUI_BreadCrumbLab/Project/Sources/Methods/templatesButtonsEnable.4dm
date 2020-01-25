//%attributes = {}
  // templatesButtonsEnable ( $enable ; $name ) 
  //
  // $1 : (boolean) enable/disable
  // $2 : (text) (optionnal) button name
  //
  // This method will enable/disable the template button (rename, create, save, delete, etc)

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.10.19, 09:32:09
	  // ----------------------------------------------------
	  // Method: templatesButtonsEnable
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 



C_BOOLEAN:C305($1;$enable)
C_TEXT:C284($2;$name)

$enable:=$1

Form:C1466.btnRename.Enable($enable)
Form:C1466.btnNew.Enable($enable)
Form:C1466.btnSave.Enable($enable)
Form:C1466.btnDelete.Enable($enable)
Form:C1466.btnReload.Enable($enable)
Form:C1466.btnReset.Enable($enable)
Form:C1466.btnProtect.Enable($enable)
Form:C1466.btnDuplicate.Enable($enable)

If (Count parameters:C259=2)
	$name:=$2
	Form:C1466[$name].Enable(Not:C34($enable))
End if 

Form:C1466.btnRename.Draw()
Form:C1466.btnNew.Draw()
Form:C1466.btnSave.Draw()
Form:C1466.btnDelete.Draw()
Form:C1466.btnReload.Draw()
Form:C1466.btnReset.Draw()
Form:C1466.btnProtect.Draw()
Form:C1466.btnDuplicate.Draw()