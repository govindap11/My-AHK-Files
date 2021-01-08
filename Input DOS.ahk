;
; Script to facilitate input in a console-like application with the input file prepared in advance
;	> Input files can be of any extension
;	> Lines having a semicolon are treated as comments
;

FileSelectFile, fileName,,,Select the input file
MsgBox, 4144, Activate the input windowÅI,As soon as you press OK, activate the input window (within one second!)
Sleep, 1000
WinGetActiveTitle, WinTitle
Loop, Read, %fileName%
    {
	; Ignore the lines having a semicolon
		IfInString, A_LoopReadLine, `;
		{
			; Do Nothing
		}else{
			WinGetActiveTitle, WinTitle_New
			;COMPARE THE WINDOW TITLES
			if !(WinTitle_New = WinTitle)
			{
			  break
			}else
			{
				; Send the line
				Send, %A_LoopReadLine%  {Enter}
				; Sleep, 500
			}
		}
	}		

ExitApp