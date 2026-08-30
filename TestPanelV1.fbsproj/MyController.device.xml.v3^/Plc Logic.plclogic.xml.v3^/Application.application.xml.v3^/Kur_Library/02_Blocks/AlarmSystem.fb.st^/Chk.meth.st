__METADATA__
{
  "v3Meta": {
    "objectGuid": "a4d777de-bc66-45a2-b82f-c35200e1f980",
    "objectTypeGuid": "f8a58466-d7f6-439f-bbb8-d4600e41d099",
    "embeddedObjectTypeGuids": [
      "a9ed5b7e-75c5-4651-af16-d2c27e98cb94",
      "3b83b776-fb25-43b8-99f2-3c507c9143fc"
    ],
    "properties": {},
    "subObjects": {}
  }
}
__DECLARATION__
METHOD PUBLIC  Chk
VAR_INPUT
    ID      : UINT;
    Alarm   : BOOL;
END_VAR
__IMPLEMENTATION__
IF (ID < 1) OR (ID > 100) THEN
    RETURN;
END_IF

Cond[ID] := Alarm;

IF Alarm AND NOT Latch[ID] THEN
    Latch[ID] := TRUE;
    BuzzerLtc := TRUE;
END_IF
