//%attributes = {}
  // setValueToAllSections (  ) -> return
  //
  //
  // Utility method to assign a new value for each section.

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 23.10.19, 15:48:56
	  // ----------------------------------------------------
	  // Method: setValueToAllSections
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 
C_POINTER:C301($value_col_ptr;$property_col_ptr)
C_OBJECT:C1216($section)

$value_col_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"value_col")
$property_col_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"property_col")

For each ($section;Form:C1466.bc1.breadCrumb.sectionList)
	$section[$property_col_ptr->{$property_col_ptr->}]:=$value_col_ptr->{$value_col_ptr->}.value
End for each 


Form:C1466.timerCase:="draw"
SET TIMER:C645(-1)