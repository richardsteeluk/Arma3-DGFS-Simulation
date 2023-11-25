/*This is a custom damage event handler script, created by Steel of King's Rangers for use in Exercise Screaming Seagull
Feel free to do whatever you want with this. Learn from it and share it. 
Credit to Lacey of 42 Commando for tons of assistance
*/

/*
Adds custom damage handler to all playable units on mission start

Because this is a clientside event, it must be run once for each client.
Each client will apply this event handler to every switchable unit so that their shots are recognised

Source: https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#:~:text=While%20you%20can%20add%20%22HitPart%22%20handler%20to%20a%20remote%20unit%2C%20the%20respective%20addEventHandler%20command%20must%20be%20executed%20on%20the%20shooter%27s%20PC%20and%20will%20only%20fire%20on%20shooter%27s%20PC%20as%20well.
*/

MILES_apply_system_to_JIP_player = {
    params ["_JIPPlayer"];

    hint str _JIPPlayer;
};

if (_this select 1) then {
    (_this select 0) remoteExec ["MILES_apply_system_to_JIP_player", 0, true];
};

MILES_attempt_wake_up = {
    params ["_wakerUpper", "_sleepingPerson"];

    //hint str (_sleepingPerson);

    //If the sleeping person is in a medical facility
    if ([_sleepingPerson] call ace_medical_treatment_fnc_isInMedicalFacility) then {

        //If the person waking up is a medic
        if ([_wakerUpper] call ace_medical_treatment_fnc_isMedic) then {

            [_sleepingPerson, false] call ace_medical_fnc_setUnconscious;
            
            //Remove the wake up option
            removeAllActions _sleepingPerson;

            hint "finished";

            //Note: They may still need medical attention
        };
    };
};

MILES_handle_hit_on_unit = {
    params ["_unitBeingHit"];

    _unitBeingHit say3D ["MilesBeep", 60, 1, 2, 0];

    _unitBeingHit addAction ["Wake Up (Requires medic and medical facility)", {[player, (_this select 0)] remoteExec ["MILES_attempt_wake_up", 0, true]}, [player, _unitBeingHit], 1.5, true, false, "", "true", 5];
};

{
    _x addEventHandler ["HitPart", {  
        _fatalDamageSources = ["spine1", "spine2", "spine3", "head", "pelvis"]; 
    
        { 
            _x params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"]; 
    
            _placeHit = (_x select 5) select 0; 
    
            if (_placeHit in _fatalDamageSources) then { 
                _thisSoldier = (_x select 0);

                if ([_thisSoldier] call ace_common_fnc_isAwake) then {

                    [_thisSoldier, true, 1800, false] call ace_medical_fnc_setUnconscious; 

                    _thisSoldier remoteExec ["MILES_handle_hit_on_unit", 0, true];                     
                };

            }; 
    
        } forEach _this;  
    }];

} forEach playableUnits;