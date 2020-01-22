//%attributes = {"shared":true}
  // AJUI_Tip_getSubFormSize ( formName ; width_ptr ; height_ptr ) -> return
  //
  // $1 : (text) Form name
  // $2 : (ptr) form width
  // $3 : (ptr) form height
  //
  // Method created by AJUI Tip to know the size of the form

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Maurice Inzirillo
	  // Date and time: 14.03.19, 09:39:05
	  // ----------------------------------------------------
	  // Method: AJUI_Tip_getSubFormSize
	  // Description
	  // This method returns the width and height of the form 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$formName_t)
C_POINTER:C301($2;$widthSF_ptr)
C_POINTER:C301($3;$heightSF_ptr)
$formName_t:=$1
$widthSF_ptr:=$2
$heightSF_ptr:=$3

FORM GET PROPERTIES:C674($formName_t;$widthSF_ptr->;$heightSF_ptr->)