//This is a custom damage event handler script, created by Steel of King's Rangers for use in Exercise Screaming Seagull
//Feel free to do whatever you want with this. Learn from it and share it. 
//Credit to Lacey of 42 Commando for tons of assistance

_wakerUpper = _this select 0;
_sleepingPerson = _this select 1;

//If the sleeping person is in a medical facility
if ([_sleepingPerson] call ace_medical_treatment_fnc_isInMedicalFacility) then {

    //If the person waking up is a medic
    if ([_wakerUpper] call ace_medical_treatment_fnc_isMedic) then {

        //Wake them up
        //[_sleepingPerson, false] call ace_medical_status_fnc_setUnconsciousState;

        [_wakerUpper, false] call ace_medical_status_fnc_setUnconsciousState;
        
        //Remove the wake up option
        removeAllActions _wakerUpper;

        hint "finished";

        //Note: They may still need medical attention
    };
};