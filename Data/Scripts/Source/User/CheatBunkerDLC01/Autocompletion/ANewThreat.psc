Scriptname CheatBunkerDLC01:Autocompletion:ANewThreat extends cheatbunker:autocompletion

Int Property InvestigateObjective = 2100 Auto Const
Int Property LootObjective = 2200 Auto Const

ReferenceAlias Property AdaAlias Auto Mandatory Const
ReferenceAlias Property RobobrainAlias Auto Mandatory Const
ReferenceAlias Property BeaconAlias Auto Mandatory Const

ObjectMod Property DLC01Bot_Torso_Quest_MQ02RadarBeacon02 Auto Mandatory Const

Function killRobobrain()
	RobobrainAlias.GetActorReference().Kill(Game.GetPlayer())
	Utility.Wait(1) ; backstop against this script moving too quickly in order to 
EndFunction

Function lootBeacon()
	Game.GetPlayer().AddItem(BeaconAlias.GetRef())
EndFunction

Function removeBeacon()
{This is exceedingly paranoid since there's only ever one of these beacons spawned for this quest, but it's always better to make sure autocompletion options leave things cleanly completed.}
	Actor aPlayer = Game.GetPlayer()
	ObjectReference beaconRef = BeaconAlias.GetRef()
	Int iBeaconCount = aPlayer.GetItemCount(beaconRef)
	aPlayer.RemoveItem(beaconRef, iBeaconCount)
EndFunction

Function addModToAda()
	AdaAlias.GetActorRef().AttachMod(DLC01Bot_Torso_Quest_MQ02RadarBeacon02)
EndFunction

Function wrapUp()
	removeBeacon()
	addModToAda()
EndFunction

Function executeBehavior()
	if (MyQuest.IsObjectiveDisplayed(InvestigateObjective))
		killRobobrain()
		lootBeacon()
	elseif (MyQuest.IsObjectiveDisplayed(LootObjective))
		lootBeacon()
	endif
	
	wrapUp()
	
	conclude()
EndFunction
