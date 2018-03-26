Scriptname CheatBunkerDLC01:Autocompletion:RestoringOrder extends CheatBunker:Autocompletion:StageResponder

Group FacilityHolotapes
	ReferenceAlias Property HolotapeProduction Auto Const Mandatory
	ReferenceAlias Property HolotapeFacilities Auto Const Mandatory
	ReferenceAlias Property HolotapeResearch Auto Const Mandatory
EndGroup

Group QuestSpecificSettings
	Actor Property AdaActor Auto Const Mandatory
	ObjectMod Property DLC01Bot_Torso_Quest_MQ05MSAT Auto Const Mandatory
	
	Int Property ModAdaStage = 500 Auto Const
	Int Property GiveTapesStage = 550 Auto Const
	Int Property TakeControlStage = 900 Auto Const
	
	Quest Property DLC01Lair Auto Const Mandatory
	Int Property LairPostquestStage = 2000 Auto Const
EndGroup

Bool Function playerHasTape(ReferenceAlias tapeAlias)
	return tapeAlias.GetReference().getContainer() == Game.GetPlayer()
EndFunction

Function giveTape(ReferenceAlias tapeAlias)
	if (!playerHasTape(tapeAlias))
		Game.GetPlayer().AddItem(tapeAlias.GetReference())
	endif
EndFunction

Function giveTapes()
	giveTape(HolotapeProduction)
	giveTape(HolotapeFacilities)
	giveTape(HolotapeResearch)
EndFunction

Function processStage(Int aiStageID)
	if (ModAdaStage == aiStageID)
		AdaActor.AttachMod(DLC01Bot_Torso_Quest_MQ05MSAT)
	endif

	if (GiveTapesStage == aiStageID)
		giveTapes()
	endif
	
	if (TakeControlStage == aiStageID)
		DLC01Lair.SetStage(LairPostquestStage)
	endif
	
	parent.processStage(aiStageID) ; because basic processing needs to occur after the custom behaviors
EndFunction
