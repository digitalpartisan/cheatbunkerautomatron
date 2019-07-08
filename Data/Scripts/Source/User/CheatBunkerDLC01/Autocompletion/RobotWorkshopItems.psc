Scriptname CheatBunkerDLC01:Autocompletion:RobotWorkshopItems extends CheatBunker:Autocompletion

Import InjectTec:Utility:HexidecimalLogic

Group AutomatronSettings
	GlobalVariable Property CheatBunkerDLC01AutocompletionRobotWorkshopWorkbenchEnabled Auto Const Mandatory
	GlobalVariable[] Property CraftableToggles Auto Const Mandatory
	GlobalVariable Property DLC01WorkshopSchematicResourceScanner_Global Auto Const Mandatory
	GlobalVariable Property DLC01WorkshopSchematicSpotlight_Global Auto Const Mandatory
EndGroup

Group NukaWorldSettings
	InjectTec:Plugin Property NukaWorldPlugin Auto Const Mandatory
	DigitSet[] Property NukaWorldVariableDigits Auto Const
EndGroup

Bool Function canExecuteLogic()
	return parent.canExecuteLogic() && (arePartsLocked() || areNukaWorldPartsLocked())
EndFunction

Bool Function arePartsLocked()
	Int iCounter = 0
	while (iCounter < CraftableToggles.Length)
		if (1 != CraftableToggles[iCounter].GetValueInt())
			return true
		endif
		iCounter += 1
	endWhile
	
	if (1 != DLC01WorkshopSchematicResourceScanner_Global.GetValueInt())
		return true
	endif
	
	if (1 != DLC01WorkshopSchematicSpotlight_Global.GetValueInt())
		return true
	endif
	
	return false
EndFunction

GlobalVariable[] Function getNukaWorldPartLocks()
	if (!NukaWorldPlugin.isInstalled())
		return None
	endif
	
	return NukaWorldPlugin.lookupArrayWithDigitSets(NukaWorldVariableDigits) as GlobalVariable[]
EndFunction

Bool Function areNukaWorldPartsLocked()
	GlobalVariable[] NukaWorldPartLocks = getNukaWorldPartLocks()
	if (!NukaWorldPartLocks)
		return false ; since there are no parts to be locked
	endif
	
	Int iCounter = 0
	GlobalVariable currentLock = None
	while (iCounter < NukaWorldPartLocks.Length)
		currentLock = NukaWorldPartLocks[iCounter]
		if (currentLock && 1 != currentLock.GetValueInt())
			return true ; locked part found
		endif
		
		iCounter += 1
	endWhile
	
	return false ; no locked parts found
EndFunction

Function unlockParts()
	Int iCounter = 0
	while (iCounter < CraftableToggles.Length)
		CraftableToggles[iCounter].SetValue(1)
		iCounter += 1
	endWhile
	
	CheatBunkerDLC01AutocompletionRobotWorkshopWorkbenchEnabled.SetValue(1)
	DLC01WorkshopSchematicResourceScanner_Global.SetValue(1)
	DLC01WorkshopSchematicSpotlight_Global.SetValue(1)
EndFunction

Function unlockNukaWorldParts()
	GlobalVariable[] NukaWorldPartLocks = getNukaWorldPartLocks()
	if (!NukaWorldPartLocks)
		return
	endif

	Int iCounter = 0
	GlobalVariable currentLock = None
	while (iCounter < NukaWorldPartLocks.Length)
		currentLock = NukaWorldPartLocks[iCounter]
		if (currentLock)
			currentLock.SetValue(1)
		endif
		
		iCounter += 1
	endWhile
EndFunction

Function executeBehavior()
	unlockParts()
	unlockNukaWorldParts()
	
	conclude()
EndFunction
