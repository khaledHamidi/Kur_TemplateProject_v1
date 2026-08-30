__METADATA__
{
  "v3Meta": {
    "objectGuid": "4bce77f8-c801-48d0-882b-22e6b0723cb9",
    "objectTypeGuid": "6f9dac99-8de1-4efc-8465-68ac443b7d08",
    "embeddedObjectTypeGuids": [
      "a9ed5b7e-75c5-4651-af16-d2c27e98cb94",
      "3b83b776-fb25-43b8-99f2-3c507c9143fc"
    ],
    "properties": {},
    "subObjects": {}
  }
}
__DECLARATION__
FUNCTION_BLOCK AlarmSystem
VAR_INPUT
    Reset       : BOOL;
END_VAR
VAR_OUTPUT
    Active      : BOOL;                         // -> HMI lamp
    Count       : UINT;                         // -> HMI
    ActiveList  : ARRAY [1..20] OF UINT;        // -> HMI list
END_VAR
VAR
    Cond        : ARRAY [1..100] OF BOOL;
    Latch       : ARRAY [1..100] OF BOOL;
    ResetTrig   : R_TRIG;
    BuzzerTon   : TON;
    BuzzerLtc   : BOOL;
    i           : UINT;
    idx         : UINT;
END_VAR


__IMPLEMENTATION__
// CALL LAST, AFTER ALL Chk() CALLS

ResetTrig(CLK := Reset);

Count := 0;
idx   := 0;

FOR i := 1 TO 100 DO

    // reset clears only alarms whose condition is gone
    IF ResetTrig.Q AND NOT Cond[i] THEN
        Latch[i] := FALSE;
    END_IF

    IF Latch[i] THEN
        Count := Count + 1;
        IF idx < 20 THEN
            idx := idx + 1;
            ActiveList[idx] := i;
        END_IF
    END_IF

END_FOR

FOR i := idx + 1 TO 20 DO
    ActiveList[i] := 0;
END_FOR

Active := (Count > 0);

IF ResetTrig.Q THEN
    BuzzerLtc := FALSE;
END_IF

BuzzerTon(IN := BuzzerLtc, PT := T#5S);

IF BuzzerTon.Q THEN
    BuzzerLtc := FALSE;
END_IF
