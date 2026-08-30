__METADATA__
{
  "v3Meta": {
    "objectGuid": "06ce4fe2-49e2-416d-b080-47ce0653c1a7",
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
PROGRAM PRG_Main
VAR
	// Deafult vars
	start     : Button;
	stop      : Button;
	reset     : EmergencyStop;
	emergency : EmergencyStop;
	
	// system vars (like motors, vars, ....)

END_VAR
__IMPLEMENTATION__
// --------- CHECK StATUS -----
Machine.AxisOk		:= (DRV1.Axis.etAxisState <> 0);
Machine.BusOk		:= TRUE;
Machine.HomeOk		:= TRUE;
Machine.PowerOk		:= TRUE;
Machine.SafetyOk	:= TRUE;
	
