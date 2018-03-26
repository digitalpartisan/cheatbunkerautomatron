Scriptname CheatBunkerDLC01:Autocompletion:MechanicalMenace extends cheatbunker:autocompletion:StageResponder

Group SpecificBehaviorStages
	Int Property FindCaravanStage = 2200 Auto Const
	Int Property KillRobotsStage = 2300 Auto Const
	Int Property CompleteStage = 3000 Auto Const
EndGroup

Group SceneSettings
	ObjectReference Property AdaActor Auto Const Mandatory
	Quest Property DLC01MQ01Caravan Auto Const Mandatory
	RefCollectionAlias Property HostileRobotsAlias Auto Const Mandatory
	
	Int Property PorterStage = 20 Auto Const
	Int Property HurtzStage = 90 Auto Const
EndGroup

Group MovingAda
	WorkshopParentScript Property WorkshopParent Auto Const Mandatory
	Message Property CheatBunkerDLC01AutocompletionMQ01MechanicalMenaceDefaultDestination Auto Const Mandatory
EndGroup

Bool Function playerOwnsWorkshops()
	Int iCounter = 0
	
	while (iCounter < WorkshopParent.Workshops.Length)
		if (WorkshopParent.Workshops[iCounter] && WorkshopParent.Workshops[iCounter].OwnedByPlayer) ; make sure there are no None references from mods that were badly removed
			return true
		endif
		
		iCounter += 1
	endWhile
	
	return false
EndFunction

Function processStage(Int aiStageID)
	if (FindCaravanStage == aiStageID)
		DLC01MQ01Caravan.Start()
	endif
	
	if (KillRobotsStage == aiStageID)
		DLC01MQ01Caravan.SetStage(PorterStage)
		DLC01MQ01Caravan.SetStage(HurtzStage)
		HostileRobotsAlias.KillAll(Game.GetPlayer())
	endif
	
	if (CompleteStage == aiStageID)
		Int iWorkshopsOwned = 0
		Int iCounter = 0
		
		if (!playerOwnsWorkshops() || !WorkshopParent.AddPermanentActorToWorkshopPlayerChoice(AdaActor as Actor))
			CheatBunkerDLC01AutocompletionMQ01MechanicalMenaceDefaultDestination.Show()
		endif
	endif

	parent.processStage(aiStageID) ; because basic processing needs to occur after the custom behaviors
EndFunction
