__METADATA__
{
  "v3Meta": {
    "objectGuid": "3f3c515e-e687-4ce1-961d-08988510ae4e",
    "objectTypeGuid": "8ac092e5-3128-4e26-9e7e-11016c6684f2",
    "embeddedObjectTypeGuids": [
      "3b83b776-fb25-43b8-99f2-3c507c9143fc"
    ],
    "properties": {},
    "subObjects": {}
  }
}
__IMPLEMENTATION__
(*
- Machine.Ready
- Machine.Running 

when machine ok and runnign so both is True,
when machine was running but there wrong now, so Ready = False, and Running = True.

*)
Machine.Ready		:=	Machine.SafetyOk
                    AND	Machine.BusOk
                    AND	Machine.PowerOk
                    AND	Machine.HomeOk
                    AND	Machine.AxisOk
                    AND NOT Alarms.Active
					AND NOT reset.Active;

Machine.ResetRequest	:= Alarms.Active OR reset.Active;
// must be later in FB for machine status so its auto do this.. Machine.StopRequest		:= 

IF IS_DEBUG THEN
	Machine.Ready := TRUE;
	Machine.Running:= TRUE;
END_IF


// ---------- MODE ----------
Machine.ManualMode := ManualMode_Sw;
Machine.AutoMode := AutoMode_Sw  AND NOT Machine.ManualMode;


// ---------- START / STOP ----------
IF start.Pressed AND Machine.Ready AND (Machine.AutoMode OR Machine.ManualMode) THEN
    Machine.Running := TRUE;
END_IF

IF stop.Pressed OR NOT Machine.Ready THEN
    Machine.Running := FALSE;
END_IF

// ---------- Lamps ----------
AlarmLamp_Out 	:= Alarms.Active;
RunLamp_Out  	:= Machine.Running;
ReadyLamp_Out	:= Machine.Ready AND NOT Machine.Running;


// -------------- Call Methods -----------
IF Machine.AutoMode AND Machine.Running THEN
    PRG_Main.ACT_90_RunAutomatic();
END_IF

IF Machine.ManualMode AND Machine.Running THEN
    PRG_Main.ACT_91_RunManual();
END_IF
