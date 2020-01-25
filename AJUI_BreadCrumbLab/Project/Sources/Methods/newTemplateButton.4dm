//%attributes = {}
  // newTemplateButton ( ) -> return
  //
  // $0 : (object) (return) AJUI Button instance
  //
  // Init an instance of AJUI button for the templates buttons

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 09.10.19, 11:19:24
	  // ----------------------------------------------------
	  // Method: newTemplateButton
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_OBJECT:C1216($0;$newButton_obj)

$newButton_obj:=New AJUI_Button 

  //global
$newButton_obj.Type("circle")
$newButton_obj.Composition("picture")

  //box
$newButton_obj.Resizable(True:C214)
$newButton_obj.Height(AJUI_btn_default;30)
$newButton_obj.Width(AJUI_btn_default;30)
$newButton_obj.BGColor(AJUI_btn_default;"#4d9ad4")
$newButton_obj.BGColor(AJUI_btn_hover;"#005EA8")
$newButton_obj.BGColor(AJUI_btn_active;"white")
$newButton_obj.BGColor(AJUI_btn_disable;"lightgray")

  //border
$newButton_obj.BorderColor(AJUI_btn_default;"#0a509e")
$newButton_obj.BorderSize(AJUI_btn_default;0)

  //picture
$newButton_obj.PictureHeight(AJUI_btn_default;15)
$newButton_obj.PictureWidth(AJUI_btn_default;15)
$newButton_obj.ColorToReplace(AJUI_btn_default;"#434343")
$newButton_obj.ReplacingColor(AJUI_btn_default;"white")
$newButton_obj.ReplacingColor(AJUI_btn_active;"#005EA8")
$newButton_obj.ReplacingColor(AJUI_btn_disable;"gray")


$0:=$newButton_obj