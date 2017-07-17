Scriptname CheatBunkerDLC01:SpawnNPC:Automatron extends CheatBunkerDLC01:SpawnNPC

ObjectMod Property HeadMod = None Auto Const
CheatBunkerDLC01:BotParts Property Limbs Auto Const Mandatory
CheatBunkerDLC01:BotParts Property Weapons Auto Const Mandatory
CheatBunkerDLC01:BotParts Property Armors Auto Const Mandatory

Function applyMods(Actor actorRef)
	Limbs.applyTo(actorRef)
	
	if (None != HeadMod)
		actorRef.AttachMod(HeadMod)
	endif
	
	Weapons.applyTo(actorRef)
	Armors.applyTo(actorRef)
EndFunction
