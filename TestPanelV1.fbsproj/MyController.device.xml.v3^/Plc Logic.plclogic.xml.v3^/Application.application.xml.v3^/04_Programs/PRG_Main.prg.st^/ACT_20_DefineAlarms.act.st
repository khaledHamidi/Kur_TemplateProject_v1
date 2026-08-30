__METADATA__
{
  "v3Meta": {
    "objectGuid": "d2fde022-8517-4267-acef-42a9a3f2ea18",
    "objectTypeGuid": "8ac092e5-3128-4e26-9e7e-11016c6684f2",
    "embeddedObjectTypeGuids": [
      "3b83b776-fb25-43b8-99f2-3c507c9143fc"
    ],
    "properties": {},
    "subObjects": {}
  }
}
__IMPLEMENTATION__
// define alarms...

Alarms.Chk(		1,	emergency.Active					);  //	Emergency Stop
Alarms.Chk( 	2,	(DRV1.Axis.etAxisState = 0)				);  //	Motor 1 Fault
//Alarms.Chk( 	3,	(DRV2.Axis.etAxisState = 0)				);  //	Motor 2 Fault
//Alarms.Chk( 	4,	(DRV3.Axis.etAxisState = 0)				);  //	Motor 3 Fault
//Alarms.Chk( 	5,	(DRV4.Axis.etAxisState = 0)				);  //	Motor 4 Fault






// ---- RUN  ----
Alarms( Reset := FALSE );
