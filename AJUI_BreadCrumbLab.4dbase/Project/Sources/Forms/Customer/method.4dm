

$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		
		$logo_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"logo")
		$dir:=Get 4D folder:C485(Current resources folder:K5:16)
		$file:=Replace string:C233(Form:C1466.companies[Form:C1466.customerSelected].logo;"/";Folder separator:K24:12)
		READ PICTURE FILE:C678($dir+$file;$logo_ptr->)
		
		
End case 
