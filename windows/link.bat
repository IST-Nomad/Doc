@echo off
set l1=%SystemDrive%\Users\%USERNAME%\Desktop\"RS-Bank 6.20.031.lnk"
if not exist %l1% goto copy_1
exit
:copy_1
copy %SystemDrive%\TERM\"RS-Bank 6.20.031.lnk" %SystemDrive%\Users\%USERNAME%\Desktop\ /y /n
exit

