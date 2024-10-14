Function RDP_Resetfailure($server)
{
    $ts = qwinsta /server:$server
    $td = $ts | where { ($_ -like "*Disc*" -or $_ -like "*Диск*" -or $_ -like "*ЁбЄ*") -and $_ -notlike "*services*"}
    $tdselect = $td # Для отладки или внесения в лог: Login Id State
    
    foreach ($session in $td | Select-String '\s\d+\s')
    {
        $ID = $session.Matches[0].Value.Replace(' ','')
        Write-Host "Reset RDP Failture session ID: $ID"      #отладка просмотр id сессии
        #$session.Line      #отладка просмотр сессии
        rwinsta $ID /server:$server            # сброс зависших сессий, раскомментируйте эту строку
    }
}
 
$server = "FINIST-trans"
RDP_Resetfailure($server)