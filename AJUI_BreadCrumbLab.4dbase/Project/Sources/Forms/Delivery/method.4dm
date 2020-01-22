

$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		C_POINTER:C301($_currentStatus_list_ptr)
		$_currentStatus_list_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"currentStatus_list")
		
		ARRAY TEXT:C222($_currentStatus_list_ptr->;0)
		APPEND TO ARRAY:C911($_currentStatus_list_ptr->;"In Process")
		APPEND TO ARRAY:C911($_currentStatus_list_ptr->;"Ready to Ship")
		APPEND TO ARRAY:C911($_currentStatus_list_ptr->;"In Transit")
		APPEND TO ARRAY:C911($_currentStatus_list_ptr->;"Delivered")
		
		ARRAY TEXT:C222($_deliveryPictFile;0)
		APPEND TO ARRAY:C911($_deliveryPictFile;"svg/Deemak_Daksina/3994373---home-house-interface-main-menu.svg")
		APPEND TO ARRAY:C911($_deliveryPictFile;"svg/Deemak_Daksina/3994365---banner-flag-label-mark-pin.svg")
		APPEND TO ARRAY:C911($_deliveryPictFile;"svg/Deemak_Daksina/3994378---location-map-navigation-pin-position.svg")
		APPEND TO ARRAY:C911($_deliveryPictFile;"svg/Deemak_Daksina/3994377---favorite-good-like-thumbs-up-vote.svg")
		
		Form:C1466.deliveryPictFile_col:=New collection:C1472()
		ARRAY TO COLLECTION:C1563(Form:C1466.deliveryPictFile_col;$_deliveryPictFile)
		
		$position:=Find in array:C230($_currentStatus_list_ptr->;Form:C1466.customerOffers[Form:C1466.offerSelected].delivery_state)
		If ($position>0)
			C_PICTURE:C286($pict)
			$_currentStatus_list_ptr->:=$position
			$dir:=Get 4D folder:C485(Current resources folder:K5:16)
			$file:=Replace string:C233($_deliveryPictFile{$position};"/";Folder separator:K24:12)
			READ PICTURE FILE:C678($dir+$file;$pict)
			Form:C1466.currentStatus:=$pict
		End if 
		
End case 
