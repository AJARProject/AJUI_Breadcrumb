//%attributes = {"shared":true}
  // HDI_setNote ( $notes_obj )
  //
  // $1 : (text) callback params
  //
  // Update the average note for the HDI_grpButtons form

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 10.01.20, 10:22:21
	  // ----------------------------------------------------
	  // Method: HDI_setNote
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($1;$notes_obj)
C_LONGINT:C283($note;$notationNb)
C_REAL:C285($average)

$notes_obj:=$1

$notationNb:=$notes_obj.notationNB
$note:=$notes_obj.note

Form:C1466.notes[$notationNb-1]:=$note

OBJECT Get pointer:C1124(Object named:K67:5;"average")->:=Round:C94(Form:C1466.notes.average();1)