@echo off
SET nppPath=C:\Program Files\Notepad++\notepad++.exe
SET itemName=Edit with Notepad++
rem all file types
reg add "HKEY_CLASSES_ROOT\*\shell\%itemName%"         /t REG_SZ /v "" /d "%itemName%"   /f
reg add "HKEY_CLASSES_ROOT\*\shell\%itemName%"         /t REG_EXPAND_SZ /v "Icon" /d "%nppPath%,0" /f
reg add "HKEY_CLASSES_ROOT\*\shell\%itemName%\command" /t REG_SZ /v "" /d "%nppPath% \"%%1\"" /f