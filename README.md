# Arma3-MILES-Simulation

## Purpose

The purpose of this repository is to host the latest version of this simulated MILES system, with an included test mission, for testing and development.

## What is this MILES simulation?

This system is intended to simulate the real-life MILES system, a system of sensors worn by soldiers and fitted to their weapons, which send an receive 'lasers' to simulate bullets. It can be described as 'tactical Quazer or laser-tag'.

## How does this work in Arma 3?

In Arma 3, this system is simulated with a combination of 'states'. In short, if you are shot anywhere in a 'lethal' area i.e the torso or the head, you will immediately fall unconscious and a loud BEEP will sound from your character. You will remain this way for 30 minutes, unless woken up at a medical facility by a medic. You will still receive normal ACE wounds so will need to be treated for those wounds too.

## Known Bugs to Fix

- Only the person who shoots the person can then wake them up
- Only person who shoots the person can hear the beep
- Wake up option being applied once per shot
- Beep playing mutliple times, once per shot
- Once woken up, damage handler no longer works
- Blowing self up, activates beep but only for client
- Getting shot makes the player change weapon (????????????????)