//%attributes = {}
  // queryPropertiesCol ( $level ) -> return
  //
  // $1 : (text) current level
  // $0 : (collection) (return) result of the query
  //
  // This method will query the collection of properties to use depending on the current level and also the model

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 13.01.20, 08:55:16
	  // ----------------------------------------------------
	  // Method: queryPropertiesCol
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 

C_TEXT:C284($1;$level)
C_COLLECTION:C1488($0;$properties_col)

$level:=$1
$model:=Form:C1466.bc1.Model()


Case of 
	: ($model="simple")
		$properties_col:=Form:C1466.properties.query("level = :1 & not(modelExclusion = @simple@)";$level)
		
	: ($model="arrow")
		$properties_col:=Form:C1466.properties.query("level = :1 & not(modelExclusion = @arrow@)";$level)
		
	: ($model="groupedButtons")
		$properties_col:=Form:C1466.properties.query("level = :1 & not(modelExclusion = @groupedButtons@)";$level)
		
End case 

$0:=$properties_col