#Requires AutoHotkey v2.0
#SingleInstance Force    ; Forces a single instance of the script
Persistent    ; Prevents the script from exiting automatically
SetWorkingDir A_ScriptDir    ; Ensures a consistent starting directory.
SetTitleMatchMode 2    ; Sets the matching behavior of the WinTitle parameter in commands such as WinWait
; #Warn ;Enables every type of warning and shows each warning in a message box

; **************************************** ;
; Script management
; **************************************** ;
#NumpadAdd:: Run my_home . "\AppData\Local\Programs\AutoHotkey\UX\WindowSpy.ahk"    ; Open WindowSpy Home
#NumpadEnter:: Run ".\autohotkey.code-workspace"    ; Open the script workspace
#NumpadSub::    ; Reload the script
{
    MsgBox("Reiniciando o script", "Reiniciando", "T1")
    Reload
}

; **************************************** ;
; AHK2 Cheat Sheet and
; **************************************** ;
; ^ = Ctrl key | + = Shift Key
; ! = Alt key  | # = Window Key

; **************************************** ;
; Global Variables
; **************************************** ;
my_home := "C:\Users\" . A_UserName
my_dropbox := "C:\Users\" . A_UserName . "\Dropbox"

; **************************************** ;
; Shortcuts
; **************************************** ;
; F1 Shortcut
$F1::   ; Use F1 to open links and directories paths
{
    A_Clipboard := ""    ; Empty the clipboard
    Send "^c"
    if !ClipWait(2) {
        MsgBox "A tentativa de copiar o texto para o clipboard falhou."
        return
    }
    A_Clipboard := trim(A_Clipboard, "`'`"`n`r`t ")    ;Trim spaces, tabs, quotes and blank lines in the clipboard

    ; If statement to check if the patch has only one "/" and if it is true,
    ; it adds another "/" in the beginning of the path
    if (SubStr(A_Clipboard, 1, 2) != '\\' and SubStr(A_Clipboard, 1, 1) == '\') {
        A_Clipboard := '\' . A_Clipboard
    }

    if FileExist(A_Clipboard)    ; Check if it is a Directory
    {
        Run A_Clipboard
        return
    } else if RegExMatch(A_Clipboard, "^(https?://|www\.)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(/\S*)?$")    ; Check if it is a URL
    {
        Run A_Clipboard    ; Open the URL
        return
    } else {
        MsgBox("Caminho Inválido " . A_Clipboard, "Caminho ou URL inválido", "")    ; Error message
    }
}

; Folders Shortcuts
#w::
#e::    ; Open the download folder
{
    Run "shell:::{374DE290-123F-4565-9164-39C4925E467B}"
}

; App Shortcuts
#n:: Run "notepad" ; Run Notepad.txt
#s:: Run my_home . "\scoop\apps\vscodium\current\VSCodium.exe"    ; Run VSCodium
#f:: Run "librewolf"    ; Run Firefox

; Screen Change
#7:: Run "C:\Windows\System32\DisplaySwitch.exe /external"
#8:: Run "C:\Windows\System32\DisplaySwitch.exe /internal"
#9:: Run "C:\Windows\System32\DisplaySwitch.exe /clone"
#0:: Run "C:\Windows\System32\DisplaySwitch.exe /extend"

; Screen Resolution
#F10:: ChangeResolution(800, 600, 32)
#F11:: ChangeResolution(1920, 1080, 32)
#F12:: ChangeResolution(2560, 1080, 32)

; Screen resize
#Up:: {
    WinMove 50, 70, A_ScreenWidth - 100, A_ScreenHeight - 100, "A"
}

; Media Player Shortcuts
Pause:: Send "{Volume_Up}"
ScrollLock:: Send "{Volume_Down}"
!ScrollLock:: Send "{Volume_Mute}"
PrintScreen:: Send "{Media_Play_Pause}"
!Pause:: Send "{Media_Next}"
!PrintScreen:: Send "{Media_Prev}"

; File Explorer and Everything Shortcuts
; to change icons preview
#HotIf WinActive("ahk_exe explorer.exe")
or WinActive("ahk_exe Everything.exe")
{
    #1:: SendInput("^+1")    ; Giant thumbs
    #2:: SendInput("^+2")    ; Big Thumbs
    #3:: SendInput("^+6")    ; Detail List
}
#HotIf

; Musicbee shortcuts
#HotIf WinActive("ahk_exe MusicBee.exe")
{
    Esc:: WinMinimize
}
#HotIf

; Firefox shortcuts
#HotIf WinActive("ahk_exe firefox.exe")
{
    #1:: { ; download videos using yt-dlp
        A_Clipboard := ""
        SendInput("^l")
        Sleep 500
        SendInput("^c")
        ClipWait(5)
        video_patch := "`'" . A_Clipboard . "`'"
        Sleep 500
        Run "PowerShell yt-dlp.exe --get-video " . video_patch
    }
    #2:: { ; download videos using yt-dlp
        A_Clipboard := ""
        SendInput("^l")
        Sleep 500
        SendInput("^c")
        ClipWait(5)
        video_patch := "`'" . A_Clipboard . "`'"
        Sleep 500
        Run "PowerShell yt-dlp.exe --get-audio " . video_patch
    }
    #3:: { ; download videos using yt-dlp
        A_Clipboard := ""
        SendInput("^l")
        Sleep 500
        SendInput("^c")
        ClipWait(5)
        video_patch := "`'" . A_Clipboard . "`'"
        Sleep 500
        Run "PowerShell yt-dlp.exe --get-extras " . video_patch
    }
}
#HotIf

#HotIf WinActive("ahk_exe Code.exe")
{
    :*oC1:;id:: {
        dataData := FormatTime(, "yyyyMMddHHmmss")
        dataData := StrReplace(dataData, ":", "h")
        SendInput dataData
    }
}
#HotIf

; **************************************** ;
; Primary Menu
; **************************************** ;
; Declaring the menu variables
PrimaryMenu := Menu()    ; Create the popup menu by adding some items to it.
FolderSubMenus := Menu() ; Create another menu destined to become a submenu of the above menu.
TextSubMenus := Menu()   ; Create another menu destined to become a submenu of the above menu.
ConfigSubMenus := Menu() ; Create another menu destined to become a submenu of the above menu.

; Primary menu items
PrimaryMenu.Add "Calculadora", m_calculadora
PrimaryMenu.SetIcon "Calculadora", A_WinDir . "\System32\calc.exe", 1
PrimaryMenu.Add "Bloco de Notas `twin+n", m_blocodenotas
PrimaryMenu.SetIcon "Bloco de Notas `twin+n", A_WinDir . "\System32\notepad.exe", 1

PrimaryMenu.Add      ; Add a separator line.
PrimaryMenu.Add "Sempre no topo `twin+t", m_sempretopo
PrimaryMenu.SetIcon "Sempre no topo `twin+t", A_WinDir . "\System32\shell32", 251

PrimaryMenu.Add    ; Add a separator line below the submenu.
PrimaryMenu.Add "Textos", TextSubMenus
PrimaryMenu.SetIcon "Textos", A_WinDir . "\System32\shell32", 133

PrimaryMenu.Add    ; Add a separator line below the submenu.
PrimaryMenu.Add "Pastas", FolderSubMenus
PrimaryMenu.SetIcon "Pastas", A_WinDir . "\System32\shell32", 301

PrimaryMenu.Add    ; Add a separator line below the submenu.
PrimaryMenu.Add "Configurações", ConfigSubMenus
PrimaryMenu.SetIcon "Configurações", A_WinDir . "\System32\shell32", 073

; Text Submenu Itens
TextSubMenus.Add "Caixa alta `tAlt+Numpad 1", sm_uppercase
TextSubMenus.SetIcon "Caixa alta `tAlt+Numpad 1", A_WinDir . "\System32\shell32", 74
TextSubMenus.Add "Caixa baixa `tAlt+Numpad 2", sm_lowercase
TextSubMenus.SetIcon "Caixa baixa `tAlt+Numpad 2", A_WinDir . "\System32\shell32", 76
TextSubMenus.Add "Caixa Título `tAlt+Numpad 3", sm_titlecase
TextSubMenus.SetIcon "Caixa Título `tAlt+Numpad 3", A_WinDir . "\System32\shell32", 75
TextSubMenus.Add "Caixa Unix `tAlt+Numpad 0", sm_unixcase
TextSubMenus.SetIcon "Caixa Unix `tAlt+Numpad 0", A_WinDir . "\System32\shell32", 134

; Folders Submenu Itens
FolderSubMenus.Add "Appdata", sm_appdata
FolderSubMenus.SetIcon "Appdata", A_WinDir . "\System32\shell32", 156
FolderSubMenus.Add "Startup", sm_startup
FolderSubMenus.SetIcon "Startup", A_WinDir . "\System32\shell32", 156
FolderSubMenus.Add "My User `tWin+h", sm_myuser
FolderSubMenus.SetIcon "My User `tWin+h", A_WinDir . "\System32\shell32", 156
FolderSubMenus.Add "Lixeira", sm_lixeira
FolderSubMenus.SetIcon "Lixeira", A_WinDir . "\System32\shell32", 063

; Config Submenu Itens
ConfigSubMenus.Add "Painel de controle", sm_painel_controle
ConfigSubMenus.SetIcon "Painel de controle", A_WinDir . "\System32\shell32", 208
ConfigSubMenus.Add "Alterar opções de adaptador", sm_rede_adaptador
ConfigSubMenus.SetIcon "Alterar opções de adaptador", A_WinDir . "\System32\shell32", 149
ConfigSubMenus.Add "Propriedades do sistema", sm_propriedades_do_sistema
ConfigSubMenus.SetIcon "Propriedades do sistema", A_WinDir . "\System32\shell32", 254
ConfigSubMenus.Add "Configurações do sistema (msconfig)", sm_msconfig
ConfigSubMenus.SetIcon "Configurações do sistema (msconfig)", A_WinDir . "\System32\msconfig.exe", 1
ConfigSubMenus.Add "Editor de registro", sm_regedit
ConfigSubMenus.SetIcon "Editor de registro", A_WinDir . "\regedit.exe", 1
ConfigSubMenus.Add "God Mode", sm_god_mode
ConfigSubMenus.SetIcon "God Mode", A_WinDir . "\System32\shell32", 044

; Primary menu items
m_calculadora(*) {
    Run "calc.exe"
}
m_blocodenotas(*) {
    Run "notepad.exe"
}
m_sempretopo(*) {
    WinSetAlwaysOnTop -1, "A"
}

; Text Submenu Itens
!Numpad1::
sm_uppercase(*) {
    SendInput StrUpper(A_Clipboard)
}
!Numpad2::
sm_lowercase(*) {
    SendInput StrLower(A_Clipboard)
}
!Numpad3::
sm_titlecase(*) {
    SendInput StrTitle(A_Clipboard)
}
!Numpad0::
sm_unixcase(*) {
    SendInput strUnix(A_Clipboard)
}

; Folders Submenu Itens
sm_appdata(*) {
    Run my_home . "\appdata\"
}
sm_startup(*) {
    Run my_home . "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"
}
#h::
sm_myuser(*) {
    Run my_home
}
sm_lixeira(*) {
    Run "shell:RecycleBinFolder"
}

; Config Submenu Itens
sm_painel_controle(*) {
    Run "::{26EE0668-A00A-44D7-9371-BEB064C98683}\0"
}
sm_rede_adaptador(*) {
    Run "::{26EE0668-A00A-44D7-9371-BEB064C98683}\3\::{7007ACC7-3202-11D1-AAD2-00805FC1270E}"
}
sm_propriedades_do_sistema(*) {
    Run "control sysdm.cpl,,3"
}
sm_msconfig(*) {
    Run "msconfig.exe"
}
sm_regedit(*) {
    Run "regedit.exe"
}
sm_god_mode(*) {
    Run "shell:::{ED7BA470-8E54-465E-825C-99712043E01C}"
}

; Show the menu
#LButton:: PrimaryMenu.Show

; ****************************************
; Functions
; ****************************************
strUnix(string) {
    string := A_Clipboard
    string := StrLower(string)
    string := RegExReplace(string, "[áàâã]", "a")
    string := RegExReplace(string, "[éèê]", "e")
    string := RegExReplace(string, "[íìî]", "i")
    string := RegExReplace(string, "[óòôõ]", "o")
    string := RegExReplace(string, "[úùû]", "u")
    string := RegExReplace(string, "[ç]", "c")
    loop {
        string := StrReplace(string, "`r`n`r`n", "`r`n", , &Count)    ; Removes all blank lines from the text in a variable
        if (Count = 0)    ; No more replacements needed.
            break
    }
    string := StrReplace(string, "`r`n")    ; Removes all CR+LF's from the text
    string := RegExReplace(string, "\W", " ")    ; Replaces any non-word character with a space
    string := RegExReplace(string, " +", "-")    ; Two or more spaces with a trace
    string := RegExReplace(string, "-+", "-")    ; Replace two or more traces with a single trace
    string := Trim(string, "-")    ; Remove traces on the start and end of string
    return string
}

ChangeResolution(Screen_Width := 1920, Screen_Height := 1080, Color_Depth := 32) {
    Device_Mode := Buffer(156, 0)
    NumPut("UShort", 156, Device_Mode, 36)
    DllCall("EnumDisplaySettingsA", "UInt", 0, "UInt", -1, "Ptr", Device_Mode)
    NumPut("UInt", 0x5c0000, Device_Mode, 40)
    NumPut("UInt", Color_Depth, Device_Mode, 104)
    NumPut("UInt", Screen_Width, Device_Mode, 108)
    NumPut("UInt", Screen_Height, Device_Mode, 112)
    return DllCall("ChangeDisplaySettingsA", "Ptr", Device_Mode, "UInt", 0)
}

; **************************************** ;
; Text Expander
; **************************************** ;
:*oC1:@eml::lucasdelima@gmail.com
:*oC1:;hoje:: {
    dataHora := FormatTime(, "yyyy-MM-dd")
    dataHora := StrReplace(dataHora, ":", "h")
    SendInput dataHora
}
:*oC1:;mvdb:: {
    SendInput '(?<=<div class="episode_title.*\n.*title=.*?>)(.*)(?=</a>)'
}

; **************************************** ;
;; Text Correction
; **************************************** ;
::agencia::agência
::alguem::alguém
::esees::esses
::familia::família
::japones::japonês
::nao::não
::p/::para
::pq::porque
::pra::para
::sera::será
::tb::também
::vao::vão
::vc::você
::vcs::vocês
::voce::você
::tava::estava
::mercurio::mercúrio
::;bg::background
::;bgc::background colorbackground color
::;kuro::黒ギャル