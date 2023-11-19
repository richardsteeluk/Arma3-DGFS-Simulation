//This is a custom damage event handler script, created by Steel of King's Rangers for use in Exercise Screaming Seagull
//Feel free to do whatever you want with this. Learn from it and share it. 
//Credit to Lacey of 42 Commando for tons of assistance
_player = (_this select 3) select 0;
_unitToAttemptWakeUp = (_this select 3) select 1;

//If the sleeping person is in a medical facility
if ([_unitToAttemptWakeUp] call ace_medical_treatment_fnc_isInMedicalFacility) then {

    //If the person waking up is a medic
    if ([_player] call ace_medical_treatment_fnc_isMedic) then {

        [_unitToAttemptWakeUp, false] call ace_medical_status_fnc_setUnconsciousState;
        
        //Remove the wake up option
        removeAllActions _unitToAttemptWakeUp;

        //hint "finished";

        //Note: They may still need medical attention
    };
};
