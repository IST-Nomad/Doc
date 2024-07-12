@echo off

set l2=%SystemDrive%\Users\%USERNAME%\Desktop\"RS-Bank ?.??.???-TEST.lnk"
if not exist %l2% goto copy_2
exit
:copy_2
copy %SystemDrive%\TERM_TST\"RS-Bank ?.??.???-TEST.lnk" %SystemDrive%\Users\%USERNAME%\Desktop\ /y /n
exit