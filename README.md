# Arma3-MILES-Simulation

## Purpose

The purpose of this repository is to host the latest version of this simulated MILES system, with an included test mission, for testing and development.

## What is this MILES simulation?

This system is intended to simulate the real-life MILES system, a system of sensors worn by soldiers and fitted to their weapons, which send an receive 'lasers' to simulate bullets. It can be described as 'tactical Quazer or laser-tag'.

## How does this work in Arma 3?

In Arma 3, this system is simulated with a combination of 'states'. In short, if you are shot anywhere in a 'lethal' area i.e the torso or the head, you will immediately fall unconscious and a loud BEEP will sound from your character. You will remain this way for 30 minutes, unless woken up at a medical facility by a medic. You will still receive normal ACE wounds so will need to be treated for those wounds too.

On the King's Rangers server, players will not die but will only go unconscious. However, if this is used in an environment with deaths enabled, the MILES beep and wake up option will not happen if the shot kills the unit. Furthermore, this system will not treat damage such as that received from a car collision or helicopter crash as a MILES 'hit'. That's just a normal injury.

**This implementation does not work with AI on the King's Rangers server but it can be changed to work with AI**

## To be Considered

- Grenades are very powerful
    - After further testing, the shrapnel isn't so bad, it's the shockwave that will score a 'hit', even through cover
- Self-inflicted damage

## Known Bugs to Fix

1) ~~Only the person who shoots the person can then wake them up~~
    - Fixed by changing up order of functionality where it concerns ace_common functions
2) ~~Only person who shoots the person can hear the beep~~
    - Fixed by changing up order of functionality where it concerns ace_common functions
3) ~~Wake up option being applied once per shot~~
    - Fixed indirectly by fixing bug 5
4) Beep playing mutliple times, once per shot
5) ~~Once woken up, damage handler no longer works~~
    - Fixed by changing ace_medical_status_fnc_setUnconsciousState to ace_medical_fnc_setUnconscious
6) ~~Blowing self up, activates beep but only for client~~
    - Fixed indrectly by fixing bug 5
7) ~~Getting shot makes the player change weapon (????????????????)~~
    - Fixed indirectly by fixing bug 5
8) ~~Some units getting MILES 'hit' and not others~~
    - This was caused by units being able to die. Won't be a problem on the proper server
9) ~~Waking someone up will not remove the action for other players meaning they get more than one wake up option on them if shot multiple times~~
    - Refactored to remoteexec a function to do this instead of calling a clientside script