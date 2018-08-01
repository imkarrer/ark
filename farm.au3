#include <Date.au3>
#include <MsgBoxConstants.au3>


; Config Section
$FOOD = "{9}"
$WATER = "{0}"
$EAT_INTERVAL = 15 * 60
$DANCE_INTERVAL = 3 * 60
$FUDGE_WINDOW = 5

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
   EndIf
EndFunc

Func TogglePickup()
    Toggle($pickup)
EndFunc

Func DoPickup()
   If $pickup Then
	  Send("{e}")
	  Sleep(100)
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
   If $dance Then
	  MsgBox($MB_SYSTEMMODAL, "Toggle Dance", "Dancing toggled on", 2)
   Else
	  MsgBox($MB_SYSTEMMODAL, "Toggle Dance", "Dancing toggled off", 2)
   EndIf
EndFunc

Func DoDance()
    if $dance Then
	  If Mod(GetTimeSinceEpoch(), $EAT_INTERVAL) <= $FUDGE_WINDOW Then
		 Send("{a}")
		 Send("{d}")
	  EndIf
    EndIf
EndFunc

Func ToggleEat()
   Toggle($eat)
   If $eat Then
	  MsgBox($MB_SYSTEMMODAL, "Toggle Eat", "Eating toggled on", 2)
   Else
	  MsgBox($MB_SYSTEMMODAL, "Toggle Eat", "Eating toggled off", 2)
   EndIf
EndFunc

Func DoEat()
   If $eat Then
   	If Mod(GetTimeSinceEpoch(), $EAT_INTERVAL) <= $FUDGE_WINDOW Then
		Send($FOOD)
		Send($WATER)
	EndIf
   EndIf
EndFunc


Func GetTimeSinceEpoch()
   Return _DateDiff('s', "1970/01/01 00:00:00", _NowCalc())
 EndFunc

; Methods that need to do something every n seconds go here.
While 1
   DoPickup()
   DoPunch()
   DoDance()
   DoEat()
Wend

