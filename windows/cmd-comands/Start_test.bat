@echo on
set soursepath=C:\Finist\Krona
set destinationpath=C:\Finist-Soft\GAR_Tranches_Release
set odbcfilename="ODBCDSN.dsn"
set inifilename="wfinist.ini"

attrib -R %soursepath%\*.*
attrib -R %soursepath%\EXE\*.*
attrib -R %destinationpath%\*.*

if not exist %soursepath% goto err
if not exist %destinationpath% md %destinationpath%

start /wait %soursepath%\ListFileCreation.vbs /soursepath:%soursepath% /destinationpath:%destinationpath% 

copy %soursepath%\cmplist.exe %destinationpath%
copy %soursepath%\listdll %destinationpath%
copy %soursepath%\cmpcpy.exe %destinationpath% 
copy %soursepath%\%odbcfilename% %destinationpath%\ODBCDSN.dsn
copy %soursepath%\%inifilename% %destinationpath%\wfinist.ini

c:
cd %destinationpath%

start /wait cmplist listdll 
if errorlevel 2 goto err

start /wait cmpcpy %soursepath%\exe\WFinTools.dll %destinationpath%\WFinTools.dll
if errorlevel 2 goto err
if errorlevel 1 goto regWFT
goto contWFT
:regWFT
  if not exist "%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\regasm.exe" goto regWFT32
  start /wait "%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\regasm.exe" /s %destinationpath%\WFinTools.dll /tlb:%destinationpath%\WFinTools.dll /codebase
 :regWFT32
  start /wait "%WINDIR%\Microsoft.NET\Framework\v4.0.30319\regasm.exe"  /s %destinationpath%\WFinTools.dll  /tlb:%destinationpath%\WFinTools.dll /codebase
:contWFT


start /wait cmpcpy %soursepath%\exe\finistVBFunc.dll %destinationpath%\finistVBFunc.dll
if errorlevel 2 goto err
if errorlevel 1 goto regVBF
goto contVBF
:regVBF
 if not exist %systemroot%\syswow64\regsvr32.exe goto regVBF32
  start /wait %systemroot%\syswow64\regsvr32.exe /s %destinationpath%\finistVBFunc.dll
 :regVBF32
 start /wait regsvr32 /s %destinationpath%\finistVBFunc.dll
:contVBF

start /wait cmpcpy %soursepath%\exe\SView.dll %destinationpath%\SView.dll
if errorlevel 2 goto err
if errorlevel 1 goto regSView
goto contSView
:regSView
 if not exist %systemroot%\syswow64\regsvr32.exe goto regSView32
  start /wait %systemroot%\syswow64\regsvr32.exe /s %destinationpath%\SView.dll
 :regSView32
 start /wait regsvr32 /s %destinationpath%\SView.dll
:contSView

start /wait cmpcpy %soursepath%\exe\EditHelpArticle.dll %destinationpath%\EditHelpArticle.dll
if errorlevel 2 goto err
if errorlevel 1 goto regEHA
goto contEHA
:regEHA
 if not exist %systemroot%\syswow64\regsvr32.exe goto regEHA32
  start /wait %systemroot%\syswow64\regsvr32.exe /s %destinationpath%\EditHelpArticle.dll
 :regEHA32
 start /wait regsvr32 /s %destinationpath%\EditHelpArticle.dll
:contEHA

start /wait cmpcpy %soursepath%\exe\comtpl.dll %destinationpath%\comtpl.dll
if errorlevel 2 goto err
if errorlevel 1 goto regCTools
goto contCTools
:regCTools
 if not exist %systemroot%\syswow64\regsvr32.exe goto regCTools32
  start /wait %systemroot%\syswow64\regsvr32.exe /s %destinationpath%\comtpl.dll
 :regCTools32
 start /wait regsvr32 /s %destinationpath%\comtpl.dll
:contCTools

start /wait cmpcpy %soursepath%\exe\padeg.dll %destinationpath%\padeg.dll
if errorlevel 2 goto err
if errorlevel 1 goto regpadeg
goto contpadeg
:regpadeg
 if not exist %systemroot%\syswow64\regsvr32.exe goto regpadeg32
  start /wait %systemroot%\syswow64\regsvr32.exe /s %destinationpath%\padeg.dll
 :regpadeg32
 start /wait regsvr32 /s %destinationpath%\padeg.dll
:contpadeg

start /wait cmpcpy %soursepath%\exe\AutomationObjectsWFinist.dll %destinationpath%\AutomationObjectsWFinist.dll
if errorlevel 2 goto err
if errorlevel 1 goto regAOWF
goto contAOWF
:regAOWF
 if not exist %systemroot%\syswow64\regsvr32.exe goto regAOWF32
  start /wait %systemroot%\syswow64\regsvr32.exe /s %destinationpath%\AutomationObjectsWFinist.dll
 :regAOWF32
 start /wait regsvr32 /s %destinationpath%\AutomationObjectsWFinist.dll
:contAOWF

start /wait cmpcpy %soursepath%\exe\wfinist.exe %destinationpath%\wfinist.exe
if errorlevel 2 goto err
if errorlevel 1 goto regWfinist
goto contWfinist
:regWfinist
 start /wait %destinationpath%\wfinist.exe /RegServer
:contWfinist

start wfinist.exe
goto end

:err

pause error!!!

:end
