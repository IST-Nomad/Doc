@Echo Off
cls

Set "BoxIn=C:\TEMP"
Set "Mask=.jpg"
Set "MaskEx=_1.jpg"

Set "Exclude=~EXCLUDE.tmp"
Set "ExcludeBat=%~dp0%~n0.~EXCLUDE%~x0"

Echo %MaskEx%>"%EXCLUDE%"
>"%ExcludeBat%" Echo @Echo Off

>>"%ExcludeBat%" (FOR /F "usebackq delims=" %%f IN (`XCOPY "%BoxIn%\*%Mask%" /L /S /EXCLUDE:%Exclude% 2^>nul`) DO (
			Set "DCount=%%f"
			If /I "%%~xf"=="%Mask%" If Exist "%%~dpnf%MaskEx%" echo Del /P "%%f" 
		)
)
Del "%EXCLUDE%"
>>"%ExcludeBat%" echo rem %DCount% 
sublime_text "%ExcludeBat%"

Echo Создан файл "%ExcludeBat%" 

pause
rem Call "%ExcludeBat%"

GoTo :Eof