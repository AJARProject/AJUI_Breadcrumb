//%attributes = {}
  // copyPictToFolderTemp ( param1 { ; param2 } ) -> return
  //
  // param1 : (text) description
  // param2 : (text) (optional) description
  // return : (text) (return) return value
  //
  // short_description

If (False:C215)
	  // ----------------------------------------------------
	  // User name (OS): Gary Criblez
	  // Date and time: 04.12.19, 08:57:38
	  // ----------------------------------------------------
	  // Method: copyPictToFolderTemp
	  // Description
	  // 
	  //
	  // ----------------------------------------------------
End if 


C_TEXT:C284($1;$folderTemp)
C_TEXT:C284($2;$currentTempPath)
C_TEXT:C284($picturePath)
C_COLLECTION:C1488($picturePath_col)
C_OBJECT:C1216($section;$file)
C_BOOLEAN:C305($created)
C_LONGINT:C283($pos)

$folderTemp:=$1
$currentTempPath:=$2
$picturePath_col:=New collection:C1472()

$folder:=Folder:C1567($folderTemp;fk platform path:K87:2)

  //create folder if not exist
If (Not:C34($folder.exists))
	$created:=$folder.create()
End if 

  //loop on each section
For each ($section;Form:C1466.bc1.breadCrumb.sectionList)
	$picturePath:=$section.picturePath
	
	If ($picturePath#"")
		$file:=File:C1566(pictfullPath ($picturePath;$currentTempPath);fk platform path:K87:2)
		
		  //check picture file exist
		If ($file.exists)
			If ($file.platformPath#($folderTemp+$file.fullName))
				$file.copyTo($folder;fk overwrite:K87:5)
			End if 
			$picturePath_col.push($folderTemp+$file.fullName)
			$section.picturePath:="#"+$file.fullName
		Else 
			ALERT:C41("Picture not found for copying into the template folder : "+$picturePath)
		End if 
		
	End if 
	
End for each 

  //delete old pictures
ARRAY TEXT:C222($_files;0)
DOCUMENT LIST:C474($folderTemp;$_files;Absolute path:K24:14)
For ($i;1;Size of array:C274($_files))
	If ($_files{$i}#"@.json")
		$pos:=$picturePath_col.indexOf($_files{$i})
		If ($pos=-1)
			DELETE DOCUMENT:C159($_files{$i})
		End if 
	End if 
End for 