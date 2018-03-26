Scriptname CheatBunkerDLC01:Autocompletion:ANewThreat extends Cheatbunker:Autocompletion:StageResponder

Group ANewThreatSettings
	Int Property InvestigateStage = 2100 Auto Const
	Int Property LootStage = 2200 Auto Const
	Int Property RemoveBeaconStage = 2400 Auto Const
	Int Property ModAdaStage = 2800 Auto Const
	
	ReferenceAlias Property AdaAlias Auto Mandatory Const
	ReferenceAlias Property RobobrainAlias Auto Mandatory Const
	ReferenceAlias Property BeaconAlias Auto Mandatory Const

	ObjectMod Property DLC01Bot_Torso_Quest_MQ02RadarBeacon02 Auto Mandatory Const
EndGroup

Function processStage(Int aiStageID)
	if (InvestigateStage == aiStageID)
		RobobrainAlias.GetActorReference().Kill(Game.GetPlayer())
	endif
	
	if (LootStage == aiStageID)
		Game.GetPlayer().AddItem(BeaconAlias.GetRef())
	endif
	
	if (RemoveBeaconStage == aiStageID)
		Game.GetPlayer().RemoveItem(BeaconAlias.GetRef(), 1)
	endif
	
	if (ModAdaStage == aiStageID)
		AdaAlias.GetActorRef().AttachMod(DLC01Bot_Torso_Quest_MQ02RadarBeacon02)
	endif

	parent.processStage(aiStageID) ; because basic processing needs to occur after the custom behaviors
EndFunction
