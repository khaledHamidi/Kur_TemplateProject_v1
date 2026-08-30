__METADATA__
{
  "v3Meta": {
    "objectGuid": "7cb82e55-98e1-46ed-ad94-f4039b415cdd",
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
FUNCTION_BLOCK Button

VAR_INPUT
    Signal : BOOL;        // Giriş sinyali
END_VAR

VAR_OUTPUT
    State      : BOOL;    // Anlık buton durumu
    Pressed    : BOOL;    // Basılma olayı (0 -> 1)
    Released  : BOOL;    // Bırakılma olayı (1 -> 0)
END_VAR
__IMPLEMENTATION__
// Rising edge 0 -> 1
Pressed := Signal AND NOT State;

// Falling edge 1 -> 0
Released := NOT Signal AND State;

// Save Current state
State := Signal;
