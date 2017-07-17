Scriptname CheatBunkerDLC01:SpawnNPC:MrHandy extends CheatBunkerDLC01:SpawnNPC

CheatBunkerDLC01:BotParts:MrHandy Property Parts Auto Const Mandatory
CheatBunkerDLC01:BotParts:MrHandy Property Weapons Auto Const Mandatory
CheatBunkerDLC01:BotParts:MrHandy Property Armors Auto Const Mandatory

Function applyMods(Actor actorRef)
	Parts.applyTo(actorRef)
	Weapons.applyTo(actorRef)
	Armors.applyTo(actorRef)
EndFunction
