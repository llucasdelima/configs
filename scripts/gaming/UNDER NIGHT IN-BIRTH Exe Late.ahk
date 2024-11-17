; UNDER NIGHT IN-BIRTH Exe:Late (Steam)
; Script to rebing the player 1 keyborad controls.
; NOTE: It's very important that you run the script as an administrator,
; or you run the risk of it being unresponsive when the game window is in focus

#NoEnv				; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  		; Recommended for new scripts due to its superior speed and reliability.
#Persistent			; keeps the script running until manually terminated, not really needed.
#SingleInstance			; ensures only one instance of the script is running

#MaxHotkeysPerInterval 255 ;~10000, prevents loops. Mashers should increase this.
#IfWinActive, UNDER NIGHT IN-BIRTH Exe:Late ; keys remapped

up::w
left::a
down::s
right::d

a::u
s::i
d::o
z::j