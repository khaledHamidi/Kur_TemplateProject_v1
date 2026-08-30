__METADATA__
{
  "v3Meta": {
    "objectGuid": "c2204bf7-cece-49f1-bedd-18c4f10c0357",
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
PROGRAM PRG_TASK
VAR
END_VAR
__IMPLEMENTATION__
DateTime();

PRG_Main.ACT_10_DefineButtons();
PRG_Main.ACT_20_DefineAlarms();
PRG_Main.ACT_30_DefineReadyState();
PRG_Main.ACT_40_MachineControl();
PRG_Main();
