HotKeySet("{End}", "MyExit")
HotKeySet("{Ins}", "Pickup")
HotKeySet("{Del}", "Punch")
HotKeySet("{Home}", "Forward")

$pickup = False
$punch = False
$forward = False

While 1
    If $pickup Then
        Send("{e}")
        Sleep(100)
    Else
        Sleep(10)
    EndIf

    If $punch Then
        MouseClick("left")
        Sleep(100)
    Else
        Sleep(10)
    EndIf
Wend

Func MyExit()
    Exit
EndFunc

Func Toggle(ByRef $boolean)
    If $boolean Then
        $boolean = False
    Else
        $boolean = True
    EndIf
EndFunc

Func Punch()
    Toggle($punch)
EndFunc

Func Pickup()
    Toggle($pickup)
EndFunc

Func Forward()
   Toggle($forward)
   If $forward Then
	  Send("{w down}")
   ElseIf Not $forward Then
	  Send("{w up}")
   EndIf
EndFunc
