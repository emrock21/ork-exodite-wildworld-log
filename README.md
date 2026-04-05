# Exodite Wildworld Beast Encounter Log

This contract records encounters with the Exodites, the feral Aeldari  
who dwell on untamed worlds filled with megafauna and living ecosystems.  
It uses fields that reflect their unique culture:

- `clanName` — The tribal group involved in the encounter  
- `beastType` — The megafauna mount or creature present  
- `terrainBond` — How the living environment reacted or bonded  

These elements define Exodite identity and cannot be applied to any  
other Aeldari faction.

---

## Contract

Deployed on Base:  
`0xCF50De65B9C983D8fF9eD13fE795909D566B8413`  
https://basescan.org/address/0xcf50de65b9c983d8ff9ed13fe795909d566b8413#code

Main file: `contracts/ExoditeWildworldLog.sol`

---

## Example encounter

```solidity
recordEncounter(
  "Clan Starbloom",
  "A thunder‑drake wiv scales glowin' like molten stone.",
  "Da forest shifted aside like it knew where da beast wanted to go.",
  "Da feral pointy-ears charged ridin' da beast like it was part of 'em.",
  "Da scrap ended wiv da boyz runnin' from trees dat moved on their own."

Voting
voteEncounter(1, true);
voteEncounter(1, false);

Conclusion on the Essential Aspects of the Exodites
The Exodites embody a culture rooted in wilderness, ancestral tradition,
and symbiosis with living worlds. Their encounters reflect:

The identity of their tribal clans

The megafauna they ride and revere

The bond they share with the ecosystems they protect

Together, these traits define the essence of the Wildworlds:
a harmony of beast, warrior, and land acting as one.
