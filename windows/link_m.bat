@echo off

set l3=%SystemDrive%\Users\%USERNAME%\Desktop\"Miranda IM.lnk"
if not exist %l3% goto copy_3
exit
:copy_3
copy %SystemDrive%\Miranda IM\"Miranda IM.lnk" %SystemDrive%\Users\%USERNAME%\Desktop\ /y /n
exit

set l4=%SystemDrive%\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"Miranda IM.lnk"
if not exist %l4% goto copy_4
exit
:copy_4
copy %SystemDrive%\Miranda IM\"Miranda IM.lnk" %SystemDrive%\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup /y /n
exit