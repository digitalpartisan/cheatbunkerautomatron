Scriptname CheatBunkerDLC01:Autocompletion:Headhunting extends CheatBunker:Autocompletion:StageResponder

Group RadiantAttackSettings
	Quest Property DLC01MQ04_01RadiantAssault Auto Const Mandatory
	ReferenceAlias Property BotPart Auto Const Mandatory
	
	Int Property AssaultStage = 30 Auto Const
	Int Property HelpDefendersStage = 35 Auto Const
	Int Property DefendersWinStage = 40 Auto Const
	Int Property AttackersWinStage = 50 Auto Const
	Int Property GetItemStage = 100 Auto Const

	ReferenceAlias[] Property BotsToKill Auto Const Mandatory
EndGroup

Group Stages
	Int Property GetPartStage = 10 Auto Const
	Int Property GoToFortStage = 110 Auto Const
	Int Property EnterHangarStage = 120 Auto Const
	Int Property FindRobobrainStage = 130 Auto Const
	Int Property TakeJezebelStage = 150 Auto Const
	Int Property TalkToAda2Stage = 160 Auto Const
EndGroup

Group QuestSpecificSettings
	ReferenceAlias Property ArrayMapMarker Auto Const Mandatory
	
	ObjectReference Property Stage120Trigger Auto Const Mandatory
	ObjectReference Property Stage130Trigger Auto Const Mandatory
	ObjectReference Property Stage140Trigger Auto Const Mandatory
	ObjectReference Property Stage160Trigger Auto Const Mandatory
EndGroup

Function processStage(Int aiStageID)
	if (GetPartStage == aiStageID)
		if (!DLC01MQ04_01RadiantAssault.IsStageDone(AssaultStage))
			DLC01MQ04_01RadiantAssault.SetStage(AssaultStage)
		endif
		
		if (!DLC01MQ04_01RadiantAssault.IsStageDone(HelpDefendersStage))
			DLC01MQ04_01RadiantAssault.SetStage(HelpDefendersStage)
		endif
		
		if (!DLC01MQ04_01RadiantAssault.IsStageDone(DefendersWinStage) && !DLC01MQ04_01RadiantAssault.IsStageDone(AttackersWinStage))
			Int iCounter = 0
			Actor aBotToKill = None
			Actor aPlayer = Game.GetPlayer()
			while (iCounter < BotsToKill.Length)
				aBotToKill = BotsToKill[iCounter].GetActorReference()
				if (aBotToKill && !aBotToKill.IsDead())
					aBotToKill.Kill(aPlayer)
				endif
			endWhile
			
			DLC01MQ04_01RadiantAssault.SetStage(DefendersWinStage)
		endif
		
		Game.GetPlayer().AddItem(BotPart.GetReference())
	endif
	
	if (GoToFortStage == aiStageID)
		ArrayMapMarker.GetReference().AddToMap(true)
		Stage120Trigger.Delete()
	endif
	
	if (EnterHangarStage == aiStageID)
		Stage130Trigger.Delete()
	endif
	
	if (FindRobobrainStage == aiStageID)
		Stage140Trigger.Delete()
	endif
	
	if (TalkToAda2Stage == aiStageID)
		Stage160Trigger.Delete()
	endif
	
	parent.processStage(aiStageID) ; because basic processing needs to occur after the custom behaviors
EndFunction
