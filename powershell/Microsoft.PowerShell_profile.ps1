# Configura o terminal para usar o oh-my-posh e configura o tema
oh-my-posh init pwsh --config "$env:USERPROFILE\AppData\Local\Programs\oh-my-posh\themes\tokyo.omp.json" | Invoke-Expression

# Alias para programas e comandos
new-item alias:mame -value "D:/games/emuladores/emuladores/mame/mame.exe"
new-item alias:j -value "jellyfin.exe"
new-item alias:mvpost -value "Move-Item -Path .\*post*.jpg -Destination .\_post"
new-item alias:mvstories -value "Move-Item -Path .\*stories*.jpg -Destination .\_stories"

# which like in unix
function which($name) {
    Get-Command $name | Select-Object -ExpandProperty Definition
}

# opens an explorer window in the current directory
function w {
    explorer .
}

# New Line After Path
# function prompt {
#     "$pwd`nPS > "
# }

# Clean the loading screen
Clear-Host