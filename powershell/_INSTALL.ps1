$source = ".\Microsoft.PowerShell_profile.ps1"
$destination = "$env:USERPROFILE\Documents\PowerShell\"

Write-Host "Copiando configurações para $destination"
Copy-Item "$source" -Destination "$destination" -Recurse -force

Invoke-Item $destination