/* CapNum-Indicator
	
	This program displays a notifier indicating that either the capslock or numlock
	is toggle on/off on the bottom right corner of the screen allowing an ease of
	access for users without a LED light indicator on their keyboards.

	Thank you for trying out this small program and I hope this suits your needs. 
	If there are any issues with this program, feel free to let me know on Github.

*/


#Persistent

CoordMode, ToolTip

; get the screen width and height
SysGet, width, 78
SysGet, height, 79

; get the states for both num and caps lock 0 for off, 1 for on
capslockState := GetKeyState("CapsLock", "T")
numlockState := GetKeyState("NumLock", "T")

; create two hotkeys for both capslock and numlock
CapsLock::
{
	; determine which tooltip to show
	if (capslockState = 0) ; off
	{
		capslockState = 1
		ToolTip, CapsLock is off, width - 100, height - 60, 1
		SetTimer, RemoveToolTip, -1000
		return
	}
	else
	{
		capslockState = 0
		ToolTip, CapsLock is on, width - 100, height - 60, 1
		SetTimer, RemoveToolTip, -1000
		return
	}
}

NumLock::
{
	; determine which tooltip to show
	if (numlockState = 0) ; off
	{
		numlockState = 1
		ToolTip, NumLock is off, width - 100, height - 110, 2
		SetTimer, RemoveToolTip, -1000
		return
	}
	else
	{
		numlockState = 0
		ToolTip, NumLock is on, width - 100, height - 110, 2
		SetTimer, RemoveToolTip, -1000
		return
	}
}

RemoveToolTip:
ToolTip
return
