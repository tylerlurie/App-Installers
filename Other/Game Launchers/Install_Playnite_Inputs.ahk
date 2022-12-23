#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

WinWait, ahk_exe PlayniteInstaller.exe
If(!WinActive(ahk_exe PlayniteInstaller.exe)) {
	WinActivate, ahk_exe PlayniteInstaller.exe
}
SendInput, {Tab}
SendInput, {Space}
SendInput, {Tab}{Tab}
SendInput, ^a
SendInput, C:\Program Files\Playnite
SendInput, {Tab}{Tab}{Tab}
SendInput, {Enter}
Process, Wait, Playnite.DesktopApp.exe
Process, Close, Playnite.DesktopApp.exe