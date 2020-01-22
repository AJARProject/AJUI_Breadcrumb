//%attributes = {}
  // storeBreadCrumbsCoordinates ( ) 
  //
  //
  // Get the orignal coordinates for each picture form object in the lab (breadcrumb object only)

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 08.10.19, 13:45:52
	  // ----------------------------------------------------
	  // Method: storeBreadCrumbsCoordinates
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

OBJECT GET COORDINATES:C663(*;"bc1";$left;$top;$right;$bottom)
Form:C1466.originCoordBc1:=New object:C1471
Form:C1466.originCoordBc1.left:=$left
Form:C1466.originCoordBc1.top:=$top
Form:C1466.originCoordBc1.right:=$right
Form:C1466.originCoordBc1.bottom:=$bottom

OBJECT GET COORDINATES:C663(*;"bc2";$left;$top;$right;$bottom)
Form:C1466.originCoordBc2:=New object:C1471
Form:C1466.originCoordBc2.left:=$left
Form:C1466.originCoordBc2.top:=$top
Form:C1466.originCoordBc2.right:=$right
Form:C1466.originCoordBc2.bottom:=$bottom

OBJECT GET COORDINATES:C663(*;"bc3";$left;$top;$right;$bottom)
Form:C1466.originCoordBc3:=New object:C1471
Form:C1466.originCoordBc3.left:=$left
Form:C1466.originCoordBc3.top:=$top
Form:C1466.originCoordBc3.right:=$right
Form:C1466.originCoordBc3.bottom:=$bottom

OBJECT GET COORDINATES:C663(*;"bc4";$left;$top;$right;$bottom)
Form:C1466.originCoordBc4:=New object:C1471
Form:C1466.originCoordBc4.left:=$left
Form:C1466.originCoordBc4.top:=$top
Form:C1466.originCoordBc4.right:=$right
Form:C1466.originCoordBc4.bottom:=$bottom

OBJECT GET COORDINATES:C663(*;"bc5";$left;$top;$right;$bottom)
Form:C1466.originCoordBc5:=New object:C1471
Form:C1466.originCoordBc5.left:=$left
Form:C1466.originCoordBc5.top:=$top
Form:C1466.originCoordBc5.right:=$right
Form:C1466.originCoordBc5.bottom:=$bottom