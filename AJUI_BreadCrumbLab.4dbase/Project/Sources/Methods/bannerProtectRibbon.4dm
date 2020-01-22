//%attributes = {}
  // bannerProtectRibbon (  )
  //
  //
  // Init a banner ribbon

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 11.10.19, 14:55:06
	  // ----------------------------------------------------
	  // Method: bannerProtectRibbon
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

Form:C1466.btnProtectBanner:=New AJUI_Banner 
Form:C1466.btnProtectBanner.BannerType("cornerRibbon")
Form:C1466.btnProtectBanner.BannerName("protect")
Form:C1466.btnProtectBanner.Message("Locked")
Form:C1466.btnProtectBanner.BannerPosition("bottom-right")
Form:C1466.btnProtectBanner.TextColor("White")
Form:C1466.btnProtectBanner.TextFontSize(50)
Form:C1466.btnProtectBanner.TextFontWeight("bold")
Form:C1466.btnProtectBanner.BannerBGColor("red:70")
Form:C1466.btnProtectBanner.BorderColor("red")
Form:C1466.btnProtectBanner.BorderSize(2)
Form:C1466.btnProtectBanner.RibbonTargetName("RectProtect")

Form:C1466.btnProtectBanner.BannerHeight(200)
Form:C1466.btnProtectBanner.BannerWidth(600)
