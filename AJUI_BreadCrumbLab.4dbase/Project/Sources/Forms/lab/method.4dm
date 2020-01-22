
$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		C_TEXT:C284($templateName)
		C_POINTER:C301($property_ptr;$value_ptr;$category_ptr)
		
		Form:C1466.currentLevel:="global"
		formulasGetCatAndProps (Form:C1466.currentLevel)
		
		storeBreadCrumbsCoordinates 
		
		$category_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"category_col")
		$property_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"property_col")
		
		ARRAY POINTER:C280($_hierarchy;0)
		APPEND TO ARRAY:C911($_hierarchy;$category_ptr)
		APPEND TO ARRAY:C911($_hierarchy;$property_ptr)
		
		
		LISTBOX SET HIERARCHY:C1098(*;"LB_properties";True:C214;$_hierarchy)
		OBJECT SET RGB COLORS:C628(*;"category_col";0x0000;0x00B0B0B0)
		OBJECT SET FONT STYLE:C166(*;"category_col";Bold:K14:2)
		OBJECT SET VISIBLE:C603(*;"property_col";False:C215)
		
		
		$templates_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"templates_list")
		If (Size of array:C274($templates_ptr->)>0)
			$templates_ptr->:=1
			$templateName:=$templates_ptr->{1}
			$icon:=getTLocIcon ($templates_ptr->{$templates_ptr->})
			$templateName:=Substring:C12($templateName;1;Length:C16($templateName)-4)
			$template_obj:=New object:C1471("templateName";$templateName;"templatePath";getTlocPath ($templateName+$icon))
			Form:C1466.bc1:=New AJUI_BreadCrumb ($template_obj)
			Form:C1466.bc1.Name("bc1")
			statesBreadCrumbReset 
			Form:C1466.currentBC:=OB Copy:C1225(Form:C1466.bc1)
			
			
			formulasGetValues (Form:C1466.currentLevel)
			
			REDRAW:C174(OBJECT Get pointer:C1124(Object named:K67:5;"LB_properties")->)
			
			bannerUpdate 
			
			
			Form:C1466.bc1.Draw()
			statesBreadCrumbsDraw 
		End if 
		
		
	: ($evt=On Timer:K2:25)
		
		Case of 
			: (Form:C1466.timerCase="select")
				resetBreadCrumbsToOriginCoord 
				formulasGetValues (Form:C1466.currentLevel)
				REDRAW:C174(OBJECT Get pointer:C1124(Object named:K67:5;"LB_properties")->)
				
				Form:C1466.bc1.Draw()
				statesBreadCrumbsDraw 
				REDRAW:C174(OBJECT Get pointer:C1124(Object named:K67:5;"bc1")->)
			: (Form:C1466.timerCase="draw")
				Form:C1466.bc1.Draw()
				statesBreadCrumbsDraw 
				REDRAW:C174(OBJECT Get pointer:C1124(Object named:K67:5;"bc1")->)
			: (Form:C1466.timerCase="redrawSection")
				Form:C1466.sections_col:=Form:C1466.sections_col
				LISTBOX SELECT ROW:C912(*;"sections_lb";1)
		End case 
		
		
		SET TIMER:C645(0)
End case 
