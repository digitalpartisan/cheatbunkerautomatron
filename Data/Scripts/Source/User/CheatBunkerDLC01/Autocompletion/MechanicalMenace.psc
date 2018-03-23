Scriptname CheatBunkerDLC01:Autocompletion:MechanicalMenace extends cheatbunker:autocompletion

Int Property FindCaravan = 2200 Auto Const
Int Property KillRobots = 2300 Auto Const
Int Property Talk = 2400 Auto Const

Int Property CompletionStage = 3000 Auto Const

ObjectReference Property AdaActor Auto Const Mandatory
RefCollectionAlias Property HostileRobotsAlias Auto Const Mandatory

Quest Property DLC01MQ01Caravan Auto Const Mandatory

WorkshopParentScript Property WorkshopParent Auto Const Mandatory

Message Property CheatBunkerDLC01AutocompletionMechanicalMenaceAdaToRedRocket Auto Const Mandatory

Function findCaravan()
	MyQuest.SetStage(KillRobots)
EndFunction

Function killRobots()
	HostileRobotsAlias.KillAll(Game.GetPlayer())
EndFunction

Function talkToAda()
	MyQuest.SetStage(CompletionStage)
	if (None == WorkshopParent.AddPermanentActorToWorkshopPlayerChoice(AdaActor as Actor))
		CheatBunkerDLC01AutocompletionMechanicalMenaceAdaToRedRocket.Show()
	endif
EndFunction

Function executeBehavior()
	Quest targetQuest = getQuest()

	if (!targetQuest.IsObjectiveCompleted(FindCaravan))
		findCaravan()
		DLC01MQ01Caravan.Start()
		Utility.Wait(1)
	endif
	
	if (!targetQuest.IsObjectiveCompleted(KillRobots))
		killRobots()
		DLC01MQ01Caravan.SetStage(100)
	endif

	talkToAda()
	
	conclude()
EndFunction
