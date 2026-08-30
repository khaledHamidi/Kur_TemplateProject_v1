__METADATA__
{
  "v3Meta": {
    "objectGuid": "a0019f72-9e9e-427b-96f8-9e10f00e5e74",
    "objectTypeGuid": "8ac092e5-3128-4e26-9e7e-11016c6684f2",
    "embeddedObjectTypeGuids": [
      "3b83b776-fb25-43b8-99f2-3c507c9143fc"
    ],
    "properties": {},
    "subObjects": {}
  }
}
__IMPLEMENTATION__
// Define Elements.

start(	signal := StartButton_In	); // start button OR from HMI or start button2 ... NO
stop(		signal := StopButton_In		); // stop button OR HMI or stop button2 ... NO
emergency(	Signal := Emergency_In		); // button1 AND button2 AND button3 NC
reset(			signal := ResetButton_In	); // from FSR .. normal Close NC.
