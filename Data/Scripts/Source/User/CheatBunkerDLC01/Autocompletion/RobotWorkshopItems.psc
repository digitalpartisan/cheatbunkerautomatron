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

Bool Function canExecuteLogic()
	if (isRunning() || isCompleted())
		return false ; don't allow such a thing to happen
	endif
	
	return !(isAutomatronUnlocked() && isNukaWorldUnlocked()) ; unless both of these conditions are true, work can be done
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

Function automatronBehavior()
	Int iCounter = 0
	while (iCounter < CraftableToggles.Length)
		CraftableToggles[iCounter].setValue(1)
		iCounter += 1
	endWhile
	
	DLC01WorkshopSchematicResourceScanner_Global.setValue(1)
	DLC01WorkshopSchematicSpotlight_Global.setValue(1)
EndFunction

Function nukaWorldBehavior()
	if (!NukaWorldPlugin.isInstalled())
		return
	endif
	
	DLC04:DLC04BotModQuestScript NukaWorldPartQuest = NukaWorldPlugin.lookupForm(NukaWorldPartQuestID) as DLC04:DLC04BotModQuestScript
	if (!NukaWorldPartQuest)
		return
	endif
	
	; From here on, it's a sure thing that the Nuka-World DLC is installed and the appropriate quest has been loaded from it
	Int iCounter = 0
	while (iCounter < NukaWorldPartQuest.ItemData.Length)
		NukaWorldPartQuest.ItemData[iCounter].ModUnlockGlobal.setValue(1)
		iCounter += 1
	endWhile
EndFunction

Function executeBehavior()
	automatronBehavior()
	nukaWorldBehavior()

	conclude()
EndFunction
