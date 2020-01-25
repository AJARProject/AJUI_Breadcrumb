//%attributes = {"shared":true}
  // Lab_SetBgColorOther (  ) 
  //
  //
  // Open the widget to choose a background color for the lab

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 21.10.19, 16:06:42
	  // ----------------------------------------------------
	  // Method: Lab_SetBgColorOther
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

$bgcolor_l:=Select RGB color:C956(16777215;"Select the Background Color")
Form:C1466.btnBgOtherParams.value:=$bgcolor_l
