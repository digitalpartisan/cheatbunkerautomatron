Scriptname CheatBunkerDLC01:SpawnNPC extends CheatBunker:WorkshopNPCLogic Hidden

Group NotificationSettings
	Message Property CheatBunkerDLC01NPCSpawnMessage Auto Const Mandatory
	GlobalVariable Property CheatBunkerDLC01NPCSpawnMessageShown Auto Const Mandatory
EndGroup

ActorBase Property DLC01LvlCompWorkbenchBot Auto Const Mandatory
Race Property NewRace Auto Const Mandatory
ObjectMod Property TorsoMod Auto Const Mandatory
ObjectMod Property LegsMod Auto Const Mandatory

ActorBase Function getBaseActor()
	return DLC01LvlCompWorkbenchBot
EndFunction

Function applyMods(Actor actorRef)
{Override in child classes to change mod application behavior.}
	CheatBunker:Logger.logBehaviorUndefined(self, "applyMods()")
EndFunction

Function postSpawnBehavior(Actor actorRef)
	actorRef.RemoveAllMods()
	actorRef.AttachMod(TorsoMod)
	actorRef.AttachMod(LegsMod)
	applyMods(actorRef)
	
	actorRef.SetRace(NewRace)
EndFunction

Actor Function spawnActor(ActorBase actorToSpawn, ObjectReference spawnLocation)
	if (0 == CheatBunkerDLC01NPCSpawnMessageShown.GetValue())
		CheatBunkerDLC01NPCSpawnMessageShown.SetValue(1.0)
		CheatBunkerDLC01NPCSpawnMessage.Show()
	endif

	return parent.spawnActor(actorToSpawn, spawnLocation)
EndFunction
