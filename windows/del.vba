WorkDir="D:\TEMP"
set fso = createobject("scripting.filesystemobject")  
set sha = createobject("shell.application")  
set dir = sha.namespace(WorkDir)  

' Определяем файл с максимальной датой
set arr = dir.items  
arr.filter 192, "*.bak"  
for i = 0 to arr.count - 1  
   if i = 0 then
      set fnewest = fso.getfile(arr.item(i).path)
   else
      if fnewest.datecreated < fso.getfile(arr.item(i).path).datecreated then  
         set fnewest = fso.getfile(arr.item(i).path)  		'получаем последний полный бэкап
      end if  
   end if  
next

''''''''''''''''''''''''''''''''''

' Удаляем файлы, кроме последнего
Set filesys = CreateObject("Scripting.FileSystemObject")
Set objFolder = filesys.GetFolder(WorkDir)
For Each File in objFolder.Files

'If LCase(filesys.GetExtensionName(File)) = "bak" AND _
'DateDiff("D", File.DateLastModified, Now) > 7 Then
'File.Delete true
'End If
If fnewest = File Then
	d1 = File.Name
	'MsgBox "Последний файл: " &d1
else
	d2 = File.Name
	File.Delete true
end if

Next