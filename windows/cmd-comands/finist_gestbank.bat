echo off
RMDIR \\GESTBANK\c$\Finist\Client /S /Q 
TIMEOUT 5
RMDIR \\GESTBANK\c$\Finist\WFinInst /S /Q 
TIMEOUT 5
robocopy \\FINIST\c$\Finist\GEstBank\Client \\GESTBANK\c$\Finist\Client /E /R:1 /W:0
TIMEOUT 5
robocopy \\FINIST\c$\Finist\WFinInst \\GESTBANK\c$\Finist\WFinInst /E /R:1 /W:0