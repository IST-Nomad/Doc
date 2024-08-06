@echo off
set d=%SystemDrive%\TERM
if not exist %d% goto copy_1
exit
:copy_1
mkdir %SystemDrive%\TERM
copy \\10.129.135.200\netlogon\TERMS\TERM %SystemDrive%\TERM /y /n /D
exit
set l1=%SystemDrive%\Users\%user%\Desktop\'RS-Bank 6.20.031.lnk'
if not exist %l1% goto copy_1
exit
:copy_1
copy %SystemDrive%\TERM\'RS-Bank 6.20.031.lnk' %SystemDrive%\Users\%user%\Desktop\ /y /n
exit
set p=%SystemDrive%\TERM_TST
if not exist %p% goto copy
exit
:copy
mkdir %SystemDrive%\TERM_TST
copy \\10.129.135.200\netlogon\TERMS\TERM_TST %SystemDrive%\TERM_TST /y /n
exit
set l2=%SystemDrive%\Users\%user%\Desktop\'RS-Bank 6.20.031-TEST.lnk'
if not exist %l2% goto copy_2
exit
:copy_2
copy %SystemDrive%\TERM_TST\'RS-Bank 6.20.031-TEST.lnk' %SystemDrive%\Users\%user%\Desktop\ /y /n
exit
set m="%SystemDrive%\Miranda IM"
if not exist %m% goto xcopy
exit
:xcopy
mkdir "%SystemDrive%\Miranda IM"
Xcopy "\\10.129.135.200\netlogon\Miranda IM" "%SystemDrive%\Miranda IM" /E /Q /Y /R /H /Z
exit
set l3=%SystemDrive%\Users\%user%\Desktop\'Miranda IM.lnk'
if not exist %l3% goto copy_3
exit
:copy_3
copy %SystemDrive%\Miranda IM\'Miranda IM.lnk' %SystemDrive%\Users\%user%\Desktop\ /y /n
exit

set l4=%SystemDrive%\Users\%user%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\'Miranda IM.lnk'
if not exist %l4% goto copy_4
exit
:copy_4
copy %SystemDrive%\Miranda IM\'Miranda IM.lnk' %SystemDrive%\Users\%user%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup /y /n
exit