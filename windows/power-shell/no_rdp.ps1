$admins = "admin", "TCBDOMEN\admin"
$sessions=quser
for ($i=1; $i -le ($sessions.length -1); $i+=1)
    {   
        $flag = 'true'
        for ($j = 0; $j -le ($admins.length -1); $j+=1)
        {           
            if ($sessions[$i].substring(0,20).trim().replace(">","") -eq $admins[$j])
                {
                    $flag = 'false'
                    break
                }
        }
        if ($flag -eq 'true')
        {           
            rwinsta $sessions[$i].substring(41,4).trim()
        }        
    }