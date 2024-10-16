@echo off
rem Если папка есть, заканчиваем
IF EXIST C:\zabbix GOTO END
rem создаем файл zabbix_init.txt и добавляем в него текущую дату и время
:INSTALL
hostname >> \\10.129.135.109\c$\results\zabbix\zabbix_install.txt
date /t >> \\10.129.135.109\c$\results\zabbix\zabbix_install.txt
time /t >> \\10.129.135.109\c$\results\zabbix\zabbix_install.txt
rem таймауты, на всякий случай
rem копируем содержимое папки zabbix 
robocopy \\10.129.135.205\data\Soft\zabbix\ C:\zabbix\ /E /R:1 /W:0 
rem создаем процесс используя конфиг (отредактирован заранее)
C:\zabbix\bin\zabbix_agentd.exe -c C:\zabbix\conf\zabbix_agentd.conf -i
rem старт службы
C:\zabbix\bin\zabbix_agentd.exe --start
:END