$shortcutPath = "C:\TERM_TST"
$wshShell = New-Object -ComObject "WScript.Shell"
Get-ChildItem (Join-Path $shortcutPath "*.exe") | ForEach-Object {
  $lnkFilename = Join-Path $shortcutPath ("{0}.lnk" -f [IO.Path]::GetFilenameWithoutExtension($_.FullName))
  $shortcut = $wshShell.CreateShortcut($lnkFilename)
  $shortcut.TargetPath = $_.FullName
  $shortcut.Save()
}