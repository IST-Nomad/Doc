@echo off
set m="%SystemDrive%\Miranda IM"
if not exist %m% goto xcopy
exit
:xcopy
mkdir "%SystemDrive%\Miranda IM"
Xcopy "\\10.129.135.200\netlogon\Miranda IM" "%SystemDrive%\Miranda IM" /E /Q /Y /R /H /Z
exit
