//%attributes = {}
  // HDI_setNextDisable ( $section_pos ) -> return
  //
  // $1 : (longint) section position
  //
  // This method will disable all the section after the position entered

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 04.11.19, 15:43:47
	  // ----------------------------------------------------
	  // Method: HDI_setNextDisable
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_LONGINT:C283($1;$section_pos)
$section_pos:=$1
For ($i;0;(Form:C1466.bc1.breadCrumb.sectionList.length-1))
	If ($i>$section_pos)
		Form:C1466.bc1.breadCrumb.sectionList[$i].disable:=True:C214
	Else 
		Form:C1466.bc1.breadCrumb.sectionList[$i].disable:=False:C215  // belt strap
	End if 
End for 
