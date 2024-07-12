@echo off
set d=%SystemDrive%\TERM
if not exist %d% goto copy_1
exit
:copy_1
mkdir %SystemDrive%\TERM
Xcopy \\10.129.135.200\netlogon\TERMS\TERM %SystemDrive%\TERM /E /Q /Y /R /H /Z
pause
exit
