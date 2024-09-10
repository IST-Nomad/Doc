Set fso = CreateObject("Scripting.FileSystemObject")
param1 = Wscript.Arguments.Named.Item("soursepath") 
param2 = Wscript.Arguments.Named.Item("destinationpath") 
sProgsFrom = param1 
sProgsTo = param2 
ListCreation
Sub ListCreation
    sListPath = sProgsFrom & "listdll"
    If fso.FileExists(sListPath)  Then    
        fso.DeleteFile sListPath, True
    End If
    Set fList = fso.CreateTextFile (sListPath, True, False)
    Call ListFilling(fList, sProgsFrom & "\EXE\", sProgsTo & "\")
    fList.Close
End Sub
Sub ListFilling(fListFile, sFrom, sTo)
    If sFrom <> "" And sTo <> "" Then
        Set obFolder = fso.GetFolder(sFrom)
        Set obFiles = obFolder.Files
        For Each obFile In obFiles
	    If obFile.Name <> "WFinTools.dll" AND _ 
		obFile.Name <> "FinistVBFunc.dll" AND _ 
		obFile.Name <> "SView.dll" AND _
		obFile.Name <> "EditHelpArticle.dll" AND _
		obFile.Name <> "comtpl.dll" AND _
		obFile.Name <> "Padeg.dll" AND _ 
		obFile.Name <> "OfficeConnector.dll" AND _
		obFile.Name <> "AutomationObjectsWFinist.dll" AND _
		obFile.Name <> "WFinist.exe" Then _ 
		fListFile.WriteLine sFrom & obFile.Name & "*" & sTo & obFile.Name
        Next
    End If 
End Sub