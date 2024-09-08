echo off
robocopy \\TCBDomen.trustcombank.ru\NETLOGON\Finist\ c:\Users\%USERNAME%\Desktop\  /R:1 /W:0
pause
