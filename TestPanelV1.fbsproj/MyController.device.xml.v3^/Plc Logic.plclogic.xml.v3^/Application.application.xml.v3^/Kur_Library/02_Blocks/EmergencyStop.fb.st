__METADATA__
{
  "v3Meta": {
    "objectGuid": "96a920d4-3a43-4332-b1dd-d2e05f2aaf73",
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
FUNCTION_BLOCK EmergencyStop

VAR_INPUT
    Signal : BOOL;
END_VAR

VAR_OUTPUT
    OK : BOOL;		// when signal equal to TRUE.
    Active: BOOL;	// = True when signal is FALSE
END_VAR
__IMPLEMENTATION__
OK := Signal;
Active := NOT Ok;
