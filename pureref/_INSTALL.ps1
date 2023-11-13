$source = ".\PureRef.ini"
$destination = "$env:USERPROFILE\AppData\Roaming\"

Write-Host "Copiando configurações para $destination"
Copy-Item "$source" -Destination "$destination" -force

Invoke-Item $destination