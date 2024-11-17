"
Organizador Automático
de arquivos do
 _____ ___ ____ __  __    _
|  ___|_ _/ ___|  \/  |  / \
| |_   | | |  _| |\/| | / _ \
|  _|  | | |_| | |  | |/ ___ \
|_|   |___\____|_|  |_/_/   \_\

-------------------------------------------------------------------------------

"

$pathDir = Read-Host -Prompt "Caminho dos arquivos"

"

-------------------------------------------------------------------------------

"

$array = @(
    # ARQUIVO , PASTA
     @("BANNER-APP","BANNER APP"),
     @("BANNER-EMAIL","BANNER EMAIL"),
     @("KBAR","KBAR"),
     @("SPLASHLINE","SPLASHLINE"),
     @("TEMA-HOME","TEMA HOME"),
     @("TEMA-MOBILE","TEMA HOME"),
     @("TOPO-EMAIL","TOPO HOME")
)

foreach ( $node in $array) {
    $jpg = $pathDir + "\" + $node[0] + "-*.jpg"
    $png = $pathDir + "\" + $node[0] + "-*.png"
    $dir = $pathDir + "\" + $node[1]

    if ((Test-Path -Path $jpg -PathType Leaf) -Or (Test-Path -Path $png -PathType Leaf)) {
        if (Test-Path -Path $dir) {
            Move-Item -Path $png, $jpg -Destination $dir
            $node[0] + " movidos com sucesso."
            ""
        } else {
            "O diretório " + $node[0] + " não existe e será criado."
            New-Item -Path $pathDir -Name $node[1] -ItemType Directory | Out-Null
            Start-Sleep -Seconds 1
            Move-Item -Path $png, $jpg -Destination $dir
            $node[0] + " movidos com sucesso."
            ""
        }
    } else {
        "Nenhum " + $node[0] + " encontrado."
    }
}

""
""
"              ___------__"
"        |\__-- /\       _-"
"        |/    __      -"
"        //\  /  \    /__"
"        |  o|  0|__     --_"
"        \\____-- __ \   ___-"
"        (@@    __/  / /_"
"           -_____---   --_"
"            //  \ \\   ___-"
"          //|\__/  \\  \"
"          \_-\_____/  \-\"
"               // \\--\|"
"          ____//  ||_"
"         /_____\ /___\"
"       ______________________"
"           GOTTA GO FAST"
""
"-------------------------------------------------------------------------------"
""
"Pressione qualquer tecla para fechar."
Read-Host