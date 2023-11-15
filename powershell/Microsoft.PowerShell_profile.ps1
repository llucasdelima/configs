# Configura o terminal para usar o oh-my-posh e configura o tema
oh-my-posh init pwsh --config "$env:USERPROFILE\AppData\Local\Programs\oh-my-posh\themes\tokyo.omp.json" | Invoke-Expression

# Alias para programas e comandos
new-item alias:mame -value "D:/games/emuladores/emuladores/mame/mame.exe"
new-item alias:j -value "jellyfin.exe"

# which like in unix
function which($name) {
    Get-Command $name | Select-Object -ExpandProperty Definition
}

# move posts and stories files to the correct folders
function move-artes {
    $PostDir = ".\_post"
    $StoriesDir = ".\_stories"

    if ((Test-Path -Path '.\*-post-*.jpg' -PathType Leaf) -Or (Test-Path -Path '.\*-post-*.png' -PathType Leaf)) {
        if (Test-Path -Path $PostDir) {
            Move-Item -Path '.\*-post-*.png', '.\*-post-*.jpg' -Destination '.\_post'
            "Posts movidos com sucesso."
        } else {
            "O diretório _post não existe e será criado."
            New-Item -Path ".\" -Name "_post" -ItemType Directory | Out-Null
            Start-Sleep -Seconds 2
        }
    } else {
        "Nenhum post encontrado."
    }

    if ((Test-Path -Path '.\*-stories-*.jpg' -PathType Leaf) -Or (Test-Path -Path '.\*-stories-*.png' -PathType Leaf)) {
        if (Test-Path -Path $StoriesDir) {
            Move-Item -Path '.\*-stories-*.png', '.\*-stories-*.jpg' -Destination '.\_stories'
            "Stories movidos com sucesso."
        } else {
            "O diretório _stories não existe e será criado."
            New-Item -Path ".\" -Name "_stories" -ItemType Directory | Out-Null
            Start-Sleep -Seconds 2
        }
    } else {
        "Nenhum storie encontrado."
    }
}
New-Alias -Name mvart -Value move-artes
New-Alias -Name mvarts -Value move-artes

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