echo
rem выбираем кодировку для русского языка
chcp 65001
rem копируем 
robocopy C:\Users\oit_10\Documents\Doc\ "T:\600 - Отдел Информационных Технологий\BVV\Doc" /MIR /XF file .gitignore /XD dirs .git