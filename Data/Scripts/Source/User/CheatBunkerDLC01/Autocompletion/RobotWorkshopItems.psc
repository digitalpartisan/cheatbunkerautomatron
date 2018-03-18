Scriptname CheatBunkerDLC01:Autocompletion:RobotWorkshopItems extends cheatbunker:autocompletion Conditional

Quest Property DLC01MQ05 Auto Const

Group AutomatronSettings
	GlobalVariable[] Property CraftableToggles Auto Const Mandatory
	GlobalVariable Property DLC01WorkshopSchematicResourceScanner_Global Auto Const Mandatory
	GlobalVariable Property DLC01WorkshopSchematicSpotlight_Global Auto Const Mandatory
EndGroup

Group NukaWorldSettings
	InjectTec:Plugin Property NukaWorldPlugin Auto Const Mandatory
	Int Property NukaWorldPartQuestID Auto Const Mandatory
EndGroup

Bool Function isQuestReady()
	return MyQuest.IsStageDOne(StageToWatch) ; overriding normal behavior because conditions on this autocompleter involve multiple quests
EndFunction

Bool Function isAutomatronUnlocked()
	return DLC01MQ05.isCompleted()
EndFunction

Bool Function isNukaWorldUnlocked()
	if (!NukaWorldPlugin.isInstalled())
		return true ; in effect
	endif
	
	DLC04:DLC04BotModQuestScript NukaWorldPartQuest = NukaWorldPlugin.lookupForm(NukaWorldPartQuestID) as DLC04:DLC04BotModQuestScript
	if (!NukaWorldPartQuest)
		return true ; again, in effect
	endif
	
	Int iCounter = 0
	while (iCounter < NukaWorldPartQuest.ItemData.Length)
		if (1 != NukaWorldPartQuest.ItemData[iCounter].ModUnlockGlobal.GetValueInt())
			return false
		endif
		iCounter += 1
	endWhile
	
	return true
EndFunction

Bool Function isEverythingUnlocked()
	return isAutomatronUnlocked() && isNukaWorldUnlocked()
EndFunction

Bool Function hasWindowPassed()
	return isRunning() || isFinished() || isEverythingUnlocked(); overriding this because the quest used to trigger availability isn't the quest used to determine a passed window
EndFunction

Function forceGlobal(GlobalVariable myVar)
	myVar.setValue(1)
EndFunction

Function automatronBehavior()
	Int iCounter = 0
	while (iCounter < CraftableToggles.Length)
		forceGlobal(CraftableToggles[iCounter])
		iCounter += 1
	endWhile
	
	forceGlobal(DLC01WorkshopSchematicResourceScanner_Global)
	forceGlobal(DLC01WorkshopSchematicSpotlight_Global)
EndFunction

Function nukaWorldBehavior()
	if (!NukaWorldPlugin.isInstalled())
		return
	endif
	
	DLC04:DLC04BotModQuestScript NukaWorldPartQuest = NukaWorldPlugin.lookupForm(NukaWorldPartQuestID) as DLC04:DLC04BotModQuestScript
	if (!NukaWorldPartQuest)
		return
	endif
	
	Int iCounter = 0
	while (iCounter < NukaWorldPartQuest.ItemData.Length)
		forceGlobal(NukaWorldPartQuest.ItemData[iCounter].ModUnlockGlobal)
		iCounter += 1
	endWhile
EndFunction

Function runBehavior()
	automatronBehavior()
	nukaWorldBehavior()

	finish()
EndFunction
