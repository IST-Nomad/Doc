-------------------------------------------
-- НАСТРАИВАЕМЫЕ ПАРАМЕТРЫ
-- Имя базы данных для резервной копии
DECLARE @DBName as nvarchar(40) = 'IBS_Krona'
-- Каталог для резервной копии
DECLARE @Path as nvarchar(400) = 'C:\mssql\backup'
-- Тип резервного копирования:
--		0 - Полная резервная копия с флагом "Только резервное копирование"
--		1 - Полная резервная копия
--		2 - Разностная резервная копия
--		3 - Копия журнала транзакций
DECLARE @Type as int = 1
-- Сжимать резервные копии:
--		0 - Не сжимать или по умолчанию
--		1 - Сжимать
DECLARE @Compression as int = 0
-- Имя почтового профиля, для отправки электонной почты									
DECLARE @profile_name as nvarchar(100) = 'Профиль для отправки отчетов'
-- Получатели сообщений электронной почты, разделенные знаком ";"				
DECLARE @recipients as nvarchar(500) = 'poplavkovsemen@gmail.com'

-------------------------------------------
-- СЛУЖЕБНЫЕ ПЕРЕМЕННЫЕ
DECLARE @SQLString NVARCHAR(4000)
DECLARE @subject as NVARCHAR(100) = ''
DECLARE @finalmassage as NVARCHAR(1000) = ''

-------------------------------------------
-- ТЕЛО СКРИПТА
use master

-- Формируем строку для исполнения
IF @Type = 3 SET @SQLString = 
	N'BACKUP LOG [' + @DBName + ']
	TO DISK = N''' + @Path + '\\' + @DBName + '_' + Replace(CONVERT(nvarchar, GETDATE(), 126),':','-') + '.trn'' '
ELSE SET @SQLString = 
	N'BACKUP DATABASE [' + @DBName + ']
	TO DISK = N''' + @Path + '\\' + @DBName + '_' + Replace(CONVERT(nvarchar, GETDATE(), 126),':','-') + '.bak'' '
set @SQLString = @SQLString +		  
	'WITH NOFORMAT, NOINIT,
	SKIP, NOREWIND, NOUNLOAD, STATS = 10'
IF @Compression = 1 SET @SQLString = @SQLString + ', COMPRESSION'
IF @Type = 0 SET @SQLString = @SQLString + ', COPY_ONLY'
IF @Type = 2 SET @SQLString = @SQLString + ', DIFFERENTIAL'

-- Выводим и выполняем полученную инструкцию
PRINT @SQLString
BEGIN TRY 
	EXEC sp_executesql @SQLString
END TRY
BEGIN CATCH  
	-- Ошбика выполнения операции
	SET @subject = 'ОШИБКА Создания резервной копии базы ' + @DBName
	SET @finalmassage = 'Ошибка создания резервной копии базы ' + @DBName + ' в каталог ' + @Path + CHAR(13) + CHAR(13)
		+ 'Код ошибки: ' + CAST(ERROR_NUMBER() as nvarchar(10)) + CHAR(13) + CHAR(13)
		+ 'Текст ошибки: ' + ERROR_MESSAGE()  + CHAR(13) + CHAR(13)
		+ 'Текст T-SQL:' + CHAR(13) + @SQLString  
END CATCH;

-- Если ошибок не было, сформируем текст сообщения
IF @subject = ''
BEGIN
	-- Успешное выполнение всех операций
	SET @subject = 'Успешное создание резервной копии базы ' + @DBName
	SET @finalmassage = 'Успешное создание резревной копии базы ' + @DBName + ' в каталог ' + @Path
END

-- Если задан профиль электронной почты, отправим сообщение
IF @profile_name <> ''
EXEC msdb.dbo.sp_send_dbmail
    @profile_name = @profile_name,
    @recipients = @recipients,
    @body = @finalmassage,
    @subject = @subject;

-- Выводим сообщение о результате
SELECT
	@subject as subject,
	@finalmassage as finalmassage

GO