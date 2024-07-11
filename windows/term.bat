@echo off
set p=C:\TERM_TST
if not exist %p% goto copy
echo Directory exist!
exit
:copy
mkdir C:\TERM_TST
copy L:\Soft\TERM_TST C:\TERM_TST /y /n
echo  Done!
exit