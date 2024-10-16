echo off
rem Таймауты проставил на всякий случай
color 2
rem Выключаем новые подключения
change logon /disable
TIMEOUT 5
rem Отключаем всех пользователей кроме тех что указаны в скрипте (админы)
powershell -file c:\Scripts\no_rdp.ps1
TIMEOUT 5
rem Удаляем папки со всем содержимым
RMDIR \\GESTBANK\c$\Finist\Client /S /Q 
TIMEOUT 5
RMDIR \\GESTBANK\c$\Finist\WFinInst /S /Q 
TIMEOUT 5
RMDIR \\GESTBANK\c$\Finist_test\Client /S /Q 
TIMEOUT 5
RMDIR \\GESTBANK\c$\Finist_test\WFinInst /S /Q 
TIMEOUT 5
rem Копируем с боевого сервера в папки для боевых подключений
robocopy \\FINIST\c$\Finist\GEstBank\Client \\GESTBANK\c$\Finist\Client /E /R:1 /W:0
TIMEOUT 5
robocopy \\FINIST\c$\Finist\WFinInst \\GESTBANK\c$\Finist\WFinInst /E /R:1 /W:0
TIMEOUT 5
rem Копируем с боевого сервера в тестовые папки всё кроме конфигов
robocopy \\FINIST\c$\Finist\GEstBank\Client \\GESTBANK\c$\Finist_test\Client /E /R:1 /W:0 /XF GEstBank.UserARM.dll.config
TIMEOUT 5
robocopy \\FINIST\c$\Finist\WFinInst \\GESTBANK\c$\Finist_test\WFinInst /E /R:1 /W:0 /XF Wfinist.ini, finistbank.dsn
TIMEOUT 5
rem Берем конфиги для тестового сервера
robocopy \\GESTBANK\c$\Distr\Wfinist_test \\GESTBANK\c$\Finist_test\WFinInst /E /R:1 /W:0
TIMEOUT 5
robocopy \\GESTBANK\c$\Distr\Client \\GESTBANK\c$\Finist_test\Client /E /R:1 /W:0
TIMEOUT 5
rem Включаем новые подключения
change logon /enable