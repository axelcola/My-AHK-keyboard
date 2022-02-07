!Space::SendInput, {Right}{Space}
^Space::SendInput, {Right}

#MaxThreadsPerHotkey, 2
cursed := 0


^r:: ; press control+r to reload
  Msgbox, Do you really want to reload this script?
  ifMsgBox, Yes
    Reload
  return




#SingleInstance, force  ;Reload without popup message
;This converts the jkli into alt hotkeys without the need to toggle. 
;#: Windows
;!: Alt
;+:Shift
;^:Control
!y::Send,{PgUp}
!+y::Send,+{PgUp}
!^y::Send,^{PgUp}
!+^y::Send,^+{PgUp}
!n::Send,{PgDn}
!+n::Send,+{PgDn}
!^n::Send,^{PgDn}
!+^n::Send,+^{PgDn}
!l::Send,{End}
!+l::Send,+{End}
!^l::Send,^{End}
!+^l::Send,+^{End}
!j::Send,{Home}
!+j::Send,+{Home}
!^j::Send,^{Home}
!+^j::Send,+^{Home}



~CapsLock::
KeyWait, CapsLock
If (A_ThisHotkey = "~CapsLock") {

      Cursor1 = Red_Pointer.cur
        CursorHandle1 := DllCall("LoadCursorFromFile", Str, Cursor1)
        Cursors = 32512,
        Loop, Parse, Cursors, `, 
        { 
            DllCall("SetSystemCursor", Uint, CursorHandle1, Int, A_Loopfield) 
        }
        Cursor2 = Red_Ibeam.cur
        CursorHandle1 := DllCall("LoadCursorFromFile", Str, Cursor2)
        Cursors = 32513,
        Loop, Parse, Cursors, `, 
        { 
            DllCall("SetSystemCursor", Uint, CursorHandle1, Int, A_Loopfield) 
        }
        Cursor3 = Red_Handle.cur
        CursorHandle1 := DllCall("LoadCursorFromFile", Str, Cursor3)
        Cursors = 32649,
        Loop, Parse, Cursors, `, 
        { 
            DllCall("SetSystemCursor", Uint, CursorHandle1, Int, A_Loopfield) 
        }
        Cursor4 = Red_Wait.cur
        CursorHandle1 := DllCall("LoadCursorFromFile", Str, Cursor4)
        Cursors = 32514,
        Loop, Parse, Cursors, `, 
        { 
            DllCall("SetSystemCursor", Uint, CursorHandle1, Int, A_Loopfield) 
        }
    
if (toggle=1) {
   SPI_SETCURSORS := 0x57
        DllCall( "SystemParametersInfo", UInt,SPI_SETCURSORS, UInt,0, UInt,0, UInt,0 )
  SetCapsLockState, Off
  tooltip, OFF
  toggle=0
  Sleep, 300
  tooltip
 }
  else {
  SetCapsLockState, On
  tooltip, ON
  toggle=1
  Sleep, 300
  tooltip
 }
return
}

CapsLock & i::
  If GetKeyState("Shift", "P")
		send +{up}  
	Else If GetKeyState("CapsLock", "P")  ; For some reason only one of these is needed to prevent unwanted firing. (Check else statement before "send {left}": Doesn't have it)
        ; SetCapsLockState, Off
		send {up}

return

CapsLock & j::
  If (GetKeyState("Control", "P") && GetKeyState("Shift", "P"))
  	send +^{left}
  Else If GetKeyState("Shift", "P")
		send +{left}
	Else 
		send {left}
return

CapsLock & k::
	If GetKeyState("Shift", "P")
		send +{down}
	Else
		send {down}
return

CapsLock & l::
  If (GetKeyState("Control", "P") && GetKeyState("Shift", "P"))
  	send +^{right}
  Else If GetKeyState("Shift", "P")
		send +{right}
	Else 
		send {right}
return

; If caps lock is toggled, send these hotkeys
#If (toggle=1)
i::Send,{Up}
+i::Send,+{Up}
^i::Send,^{Up}
+^i::Send,^+{Up}
+!i::Send,+!{Up}
!i::Send,!{Up}
k::Send,{Down}
+k::Send,+{Down}
^k::Send,^{Down}
+^k::Send,+^{Down}
!k::Send,!{Down}
!+k::Send,+!{Down}
l::Send,{Right} 
+l::Send,+{Right}
^l::Send,^{Right}
+^l::Send,+^{Right}
#^l::Send,#^{Right}
j::Send,{Left}
+j::Send,+{Left}
^j::Send,^{Left}
#l::Send,!{Right}
#j::Send,!{Left}
#^j::Send,#^{Left}
+^j::Send,+^{Left}

m::^c
,::^v
.::^x

o::Send,{BackSpace}
^o::Send,^{BackSpace}
!o::Send,!{BackSpace}
p::Send,{Delete} 
^p::Send,^{Delete}
!p::Send,!{Delete}
h::Send,{Enter}
!h::Send,!{Enter}
^h::Send,^{Enter}
u::Send,{Tab}
+u::Send,+{Tab}
^u::Send,^{Tab}
!u::Send,!{Tab}
+^u::Send,+^{Tab}
+!u::Send,+!{Tab}
#u::Send,#{Tab}
+o::Send,!{Left}
+p::Send,!{Right}
v::Send,{Esc}

; Mouse actions
a::
   if (not GetKeyState("LButton", "P"))
    Click down
return
a UP::Click up
q::MouseClick, right
g::MouseClick, WheelDown
t::MouseClick, WheelUp
z::MouseClick, middle
+t::MouseClick, WheelLeft
+g::MouseClick, WheelRight


; Make sure capslock is always in the correct state
$CapsLock UP:: 
if (toggle=0) {
     If (cursed=1)
    {
        Cursor1 = Red_Pointer.cur
        CursorHandle1 := DllCall("LoadCursorFromFile", Str, Cursor1)
        Cursors = 32512,
        Loop, Parse, Cursors, `, 
        { 
            DllCall("SetSystemCursor", Uint, CursorHandle1, Int, A_Loopfield) 
        }
    }
    Else If (cursed=0)
    {
        SPI_SETCURSORS := 0x57
        DllCall( "SystemParametersInfo", UInt,SPI_SETCURSORS, UInt,0, UInt,0, UInt,0 )
    }
  SetCapsLockState, On
  tooltip, ON
  toggle=1
  Sleep, 300
  tooltip
 }
  else {
   SPI_SETCURSORS := 0x57
        DllCall( "SystemParametersInfo", UInt,SPI_SETCURSORS, UInt,0, UInt,0, UInt,0 )
  SetCapsLockState, Off
  tooltip, OFF
  toggle=0
  Sleep, 300
  tooltip
 }
return
