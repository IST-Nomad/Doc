@echo off
set p=%SystemDrive%\TERM_TST
if not exist %p% goto copy
exit
:copy
mkdir %SystemDrive%\TERM_TST
Xcopy \\10.129.135.200\netlogon\TERMS\TERM_TST %SystemDrive%\TERM_TST /E /Q /Y /R /H /Z
exit
