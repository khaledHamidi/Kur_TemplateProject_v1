__METADATA__
{
  "v3Meta": {
    "objectGuid": "20fa988e-7366-46e3-8a8f-562badc66778",
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
PROGRAM DateTime
VAR
    RTCget      : DWORD;
    SetTime     : DWORD;
    pRes        : SysTimeRtc.RTS_IEC_RESULT;
    TimeLoaded  : BOOL;
END_VAR
__IMPLEMENTATION__
// ---------- READ RTC ----------
SysTimeRtc.SysTimeRtcConvertUtcToDate(dwTimestampUtc := RTCget, pDate := Clock.Act);
SysTimeRtc.SysTimeRtcGet(pResult := pRes, SysTimeRtcGet => RTCget);

// ---------- LOAD CURRENT TIME INTO EDIT FIELDS ----------
IF TimeRead THEN
    Clock.Set  := Clock.Act;
    TimeRead   := FALSE;
    TimeLoaded := TRUE;
END_IF

// ---------- WRITE RTC ----------
IF TimeWrite AND TimeLoaded THEN
    SysTimeRtc.SysTimeRtcConvertDateToUtc(pDate := Clock.Set, pdwTimestampUtc := SetTime);
    SysTimeRtc.SysTimeRtcSet(ulTimestamp := SetTime);
    TimeWrite  := FALSE;
    TimeLoaded := FALSE;
END_IF
