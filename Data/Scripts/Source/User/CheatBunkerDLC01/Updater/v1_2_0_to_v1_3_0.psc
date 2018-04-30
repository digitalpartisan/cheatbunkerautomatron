Scriptname CheatBunkerDLC01:Updater:v1_2_0_to_v1_3_0 extends Chronicle:Package:Update

CheatBunkerDLC01:Autocompletion:RobotWorkshopItems Property CheatBunkerDLC01AutocompletionRobotWorkshop Auto Const Mandatory

Function updateLogic()
	CheatBunker:Autocompletion.retrofitPackage(getPackage())
	
	if (CheatBunkerDLC01AutocompletionRobotWorkshop.isConcluded())
		CheatBunkerDLC01AutocompletionRobotWorkshop.unlockNukaWorldParts()
	endif
	
	sendSuccess()
EndFunction
