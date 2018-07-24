#include <Date.au3>

; Config Section
$FOOD = "{9}"
$WATER = "{0}"
$EAT_INTERVAL = 15 * 60

HotKeySet("{End}", "MyExit")
HotKeySet("{Ins}", "TogglePickup")
HotKeySet("{Del}", "TogglePunch")
HotKeySet("{Home}", "ToggleForward")
HotKeySet("+!d", "ToggleDance")
HotKeySet("+!e", "ToggleEat")
; End Config Section


$pickup = False
$punch = False
$forward = False
$dance = False
$eat = False

; Methods that need to do something every n seconds go here.
While 1
    DoPickup
    DoPunch
    DoDance
    DoEat
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

Func TogglePunch()
    Toggle($punch)
EndFunc

Func DoPunch()
    If $punch Then
        MouseClick("left")
        Sleep(100)
    Else
        Sleep(10)
    EndIf
EndFunc

Func TogglePickup()
    Toggle($pickup)
EndFunc

Func DoPickup()
    If $pickup Then
        Send("{e}")
        Sleep(100)
    Else
        Sleep(10)
    EndIf
EndFunc

Func ToggleForward()
   Toggle($forward)
   If $forward Then
	  Send("{w down}")
   ElseIf Not $forward Then
	  Send("{w up}")
   EndIf
EndFunc

Func ToggleDance()
   Toggle($dance)
EndFunc

Func DoDance()
    if $dance Then
    	Send("{a}")
	Send("{d}")
    EndIf
EndFunc

Func ToggleEat()
   Toggle($eat)
EndFunc

Func DoEat()
   If $eat Then
   	If Mod(GetTimeSinceEpoch, $EAT_INTERVAL) = 0 Then
		Send($FOOD)
		Send($WATER)
	EndIf
   EndIf
EndFunc

Func GetTimeSinceEpoch()
    Return _DateDiff('s', "1970/01/01 00:00:00", _NowCalc())
EndFunc
