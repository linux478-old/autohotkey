#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2

program := "C:\Program Files (x86)\Vim\vim82\gvim.exe"
program_name := "Vim"
program_title := "journal.txt (~\OneDrive\Desktop\other) "
program_args := "C:\Users\Michael\OneDrive\Desktop\other\journal.txt"

^q::
IfWinExist, %program_title% ahk_class %Program_name%
{
  WinGet, id, id, %program_title%
  idAct := WinActive("A")
  if (id = idAct) {
    SendInput, {Alt down}{Tab}{Alt up}
  }
  else {
    WinActivate ahk_id %id% 
  }
}
else {
  Run, %program% %program_args%
}
return
