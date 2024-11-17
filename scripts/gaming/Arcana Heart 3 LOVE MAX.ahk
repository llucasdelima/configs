; Arcana Heart 3 LOVE MAX (Steam)
; Script to rebing the player 1 keyborad controls.
; NOTE: It's very important that you run the script as an administrator,
; or you run the risk of it being unresponsive when the game window is in focus
; https://steamcommunity.com/app/370460/discussions/0/490121928337063797/

#NoEnv				; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  		; Recommended for new scripts due to its superior speed and reliability.
#Persistent			; keeps the script running until manually terminated, not really needed.
#SingleInstance			; ensures only one instance of the script is running

#MaxHotkeysPerInterval 255 ;~10000, prevents loops. Mashers should increase this.
#IfWinActive, ARCANA HEART 3 LOVE MAX!!!!! ; keys remapped only in AH3

up::w
left::a
down::s
right::d

a::u
s::i
d::o
z::j
x::l

Enter::tab