Scriptname CheatBunkerDLC01:Autocompletion:RestoringOrder extends CheatBunker:Autocompletion:StageResponder

Group QuestSpecificSettings
	Actor Property AdaActor Auto Const Mandatory
	ObjectMod Property DLC01Bot_Torso_Quest_MQ05MSAT Auto Const Mandatory
	
	Int Property ModAdaStage = 500 Auto Const
	Int Property AccessLairStage = 550 Auto Const
	Int Property TakeControlStage = 900 Auto Const
	
	Int Property BeginOverrideStage = 910 Auto Const
	Int Property CompleteOverrideStage = 940 Auto Const
	
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

Function processStage(Int aiStageID)
	if (ModAdaStage == aiStageID)
		AdaActor.AttachMod(DLC01Bot_Torso_Quest_MQ05MSAT)
	endif

	if (AccessLairStage == aiStageID)
		DLC01Lair.SetStage(BeginOverrideStage)
		DLC01Lair.SetStage(CompleteOverrideStage)
	endif
	
	if (TakeControlStage == aiStageID)
		DLC01Lair.SetStage(LairPostquestStage)
	endif
	
	parent.processStage(aiStageID) ; because basic processing needs to occur after the custom behaviors
EndFunction
