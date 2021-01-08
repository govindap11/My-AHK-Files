;
; Send F2 when F1 is pressed (Avoids pesky help launch)
;
F1::
	Send {F2}
	return
;__________________________________________________________________________________

;
; Remap the Volume Keys
;
Volume_Mute::
	Send {PrintScreen}
	return
#Volume_Mute::
	Send #{PrintScreen}
	return
Volume_Down::
	Send {ScrollLock}
	return
Volume_Up::
	Send {Pause}
	return
;__________________________________________________________________________________

;
; Send @ when @ is pressed
;
SC01A::
	Send {ASC 0064}
	return
;__________________________________________________________________________________

;
; Send `(backtick) when Shift+@ is pressed
;
+SC01A::
	Send {ASC 0096}
	return
;__________________________________________________________________________________

;
; Paste the copied text in Title Case
;
#v::
	clipboard = %clipboard%
	StringUpper,clipboard,clipboard,T	
	Send %clipboard%
	return

;__________________________________________________________________________________

;
; Paste the copied text without newline chars
;
!v::
	clipboard = %clipboard%
	clipboard := StrReplace(clipboard, "`r`n", A_Space)
	;clipboard := RegExReplace(clipboard,"\R++(?<!\n\n|\r\n\r\n)"," ")
	Send %clipboard%
	return

;__________________________________________________________________________________

;
; Search the highlighted text on Jisho.org by pressing Ctrl and Menu Key
;
^AppsKey::
	oCB := ClipboardAll  ; save clipboard contents
	Send, ^c
	ClipWait,1

	MyString := Clipboard
	Run, chrome.exe https://jisho.org/search/%MyString% 

	ClipBoard := oCB         ; return original Clipboard contents
return

;__________________________________________________________________________________

;
; Search the highlighted text on Google by pressing Win + G Keys
;
#g::
	oCB := ClipboardAll  ; save clipboard contents
	Send, ^c
	ClipWait,1

	MyString := Clipboard
	Run, chrome.exe http://www.google.com/search?q=%MyString% 

	ClipBoard := oCB         ; return original Clipboard contents
return

;__________________________________________________________________________________

;
; Assign a hotkey to minimize the active window.
;

#Down::WinMinimize, A  

;__________________________________________________________________________________