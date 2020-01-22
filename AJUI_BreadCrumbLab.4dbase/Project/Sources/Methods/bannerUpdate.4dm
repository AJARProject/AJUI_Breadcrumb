//%attributes = {}
  // bannerUpdate (  ) 
  //
  //
  // Show/Hide the banner ribbon and update the protect button

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.10.19, 15:09:36
	  // ----------------------------------------------------
	  // Method: bannerUpdate
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

  //check template protect
If (Form:C1466.bc1.protect)
	Form:C1466.btnProtect.Label(AJUI_btn_default;"Unprotect")
	Form:C1466.btnProtectBanner.DrawBanner()
	OBJECT SET VISIBLE:C603(*;"RectProtect";True:C214)
	Form:C1466.btnProtect.PicturePath(AJUI_btn_default;"svg/Deemak_Daksina/3994412---key-lock-open-password-unlock.svg")
Else 
	Form:C1466.btnProtect.Label(AJUI_btn_default;"Protect")
	Form:C1466.btnProtectBanner.HideBanner()
	OBJECT SET VISIBLE:C603(*;"RectProtect";False:C215)
	Form:C1466.btnProtect.PicturePath(AJUI_btn_default;"svg/Deemak_Daksina/3994379---lock-padlock-privacy-protection-security.svg")
End if 

Form:C1466.btnProtect.Draw()
