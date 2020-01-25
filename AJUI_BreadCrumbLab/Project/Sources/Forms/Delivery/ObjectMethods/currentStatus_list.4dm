$evt:=Form event code:C388

Case of 
	: ($evt=On Clicked:K2:4)  //when the user select an element
		C_POINTER:C301($_currentStatus_list_ptr)
		$_currentStatus_list_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"currentStatus_list")
		
		If ($_currentStatus_list_ptr->>0)
			C_PICTURE:C286($pict)
			Form:C1466.customerOffers[Form:C1466.offerSelected].delivery_state:=$_currentStatus_list_ptr->{$_currentStatus_list_ptr->}
			$dir:=Get 4D folder:C485(Current resources folder:K5:16)
			$file:=Replace string:C233(Form:C1466.deliveryPictFile_col[$_currentStatus_list_ptr->-1];"/";Folder separator:K24:12)
			READ PICTURE FILE:C678($dir+$file;$pict)
			Form:C1466.currentStatus:=$pict
		End if 
		
End case 
