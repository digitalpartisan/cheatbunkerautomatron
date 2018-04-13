Scriptname CheatBunkerDLC01:Autocompletion:RobotWorkshopItems extends CheatBunker:Autocompletion

Group AutomatronSettings
	GlobalVariable Property CheatBunkerDLC01AutocompletionRobotWorkshopWorkbenchEnabled Auto Const Mandatory
	GlobalVariable[] Property CraftableToggles Auto Const Mandatory
	GlobalVariable Property DLC01WorkshopSchematicResourceScanner_Global Auto Const Mandatory
	GlobalVariable Property DLC01WorkshopSchematicSpotlight_Global Auto Const Mandatory
EndGroup

Group NukaWorldSettings
	InjectTec:Plugin Property NukaWorldPlugin Auto Const Mandatory
	Int[] Property NukaWorldVariableIDs Auto Const Mandatory
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

Bool Function areNukaWorldPartsLocked()
	if (NukaWorldPlugin.isInstalled())
		Int iCounter = 0
		GlobalVariable targetVariable = None
		
		while (iCounter < NukaWorldVariableIDs.Length)
			targetVariable = NukaWorldPlugin.lookupForm(NukaWorldVariableIDs[iCounter]) as GlobalVariable
			if (targetVariable && 1 != targetVariable.GetValueInt())
				return true ; if there is at least one variable that doesn't have the right value, then parts are considered locked for our purposes
			endif
			
			iCounter += 1
		endWhile
		
		return false
	endif
	
	return false ; in effect, since there could be no parts to restrict
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
	if (NukaWorldPlugin.isInstalled())
		Int iCounter = 0
		GlobalVariable targetVariable = None
		
		while (iCounter < NukaWorldVariableIDs.Length)
			targetVariable = NukaWorldPlugin.lookupForm(NukaWorldVariableIDs[iCounter]) as GlobalVariable
			if (targetVariable)
				targetVariable.SetValue(1)
			endif
			
			iCounter += 1
		endWhile
	endif
EndFunction

Function executeBehavior()
	unlockParts()
	unlockNukaWorldParts()
	
	conclude()
EndFunction
