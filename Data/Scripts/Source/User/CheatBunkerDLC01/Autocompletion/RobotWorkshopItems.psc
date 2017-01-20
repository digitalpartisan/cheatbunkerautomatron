Scriptname CheatBunkerDLC01:Autocompletion:RobotWorkshopItems extends cheatbunker:autocompletion Conditional

Quest Property DLC01MQ05 Auto Const

Group RobotParts
	GlobalVariable Property co_DLC01Bot_Arm_Assaultron_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Arm_Protectron_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Arm_RoboBrain_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Arm_Sentry_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Hand_LightningGun_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Head_Assaultron_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Head_Protectron_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Head_RoboBrain_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Head_Sentry_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Legs_Assaultron_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Legs_Protectron_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Legs_RoboBrain_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Legs_Sentry_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Torso_Assaultron_Armor_Construction_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Torso_Assaultron_Armor_Wasteland_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Torso_Assaultron_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Torso_MrHandy_Armor_Construction_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Torso_MrHandy_Armor_Wasteland_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Torso_Protectron_Armor_Construction_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Torso_Protectron_Armor_Wasteland_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Torso_Protectron_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Torso_Robobrain_Armor_Construction_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Torso_Robobrain_Armor_Wasteland_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Torso_RoboBrain_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Torso_Sentry_Armor_Construction_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Torso_Sentry_Armor_Wasteland_Global Auto Const
	GlobalVariable Property co_DLC01Bot_Torso_Sentry_Global Auto Const
EndGroup

GlobalVariable Property DLC01WorkshopSchematicResourceScanner_Global Auto Const
GlobalVariable Property DLC01WorkshopSchematicSpotlight_Global Auto Const

Bool Function isQuestReady()
	return MyQuest.IsStageDOne(StageToWatch) ; overriding normal behavior because conditions on this autocompleter involve multiple quests
EndFunction

Bool Function hasWindowPassed()
	return isRunning() || isFinished() || DLC01MQ05.isCompleted(); overriding this because the quest used to trigger availability isn't the quest used to determine a passed window
EndFunction

Function flipGlobal(GlobalVariable myVar)
	myVar.setValue(1)
EndFunction

Function runBehavior()
	flipGlobal(co_DLC01Bot_Arm_Assaultron_Global)
	flipGlobal(co_DLC01Bot_Arm_Protectron_Global)
	flipGlobal(co_DLC01Bot_Arm_RoboBrain_Global)
	flipGlobal(co_DLC01Bot_Arm_Sentry_Global)
	flipGlobal(co_DLC01Bot_Hand_LightningGun_Global)
	flipGlobal(co_DLC01Bot_Head_Assaultron_Global)
	flipGlobal(co_DLC01Bot_Head_Protectron_Global)
	flipGlobal(co_DLC01Bot_Head_RoboBrain_Global)
	flipGlobal(co_DLC01Bot_Head_Sentry_Global)
	flipGlobal(co_DLC01Bot_Legs_Assaultron_Global)
	flipGlobal(co_DLC01Bot_Legs_Protectron_Global)
	flipGlobal(co_DLC01Bot_Legs_RoboBrain_Global)
	flipGlobal(co_DLC01Bot_Legs_Sentry_Global)
	flipGlobal(co_DLC01Bot_Torso_Assaultron_Armor_Construction_Global)
	flipGlobal(co_DLC01Bot_Torso_Assaultron_Armor_Wasteland_Global)
	flipGlobal(co_DLC01Bot_Torso_Assaultron_Global)
	flipGlobal(co_DLC01Bot_Torso_MrHandy_Armor_Construction_Global)
	flipGlobal(co_DLC01Bot_Torso_MrHandy_Armor_Wasteland_Global)
	flipGlobal(co_DLC01Bot_Torso_Protectron_Armor_Construction_Global)
	flipGlobal(co_DLC01Bot_Torso_Protectron_Armor_Wasteland_Global)
	flipGlobal(co_DLC01Bot_Torso_Protectron_Global)
	flipGlobal(co_DLC01Bot_Torso_Robobrain_Armor_Construction_Global)
	flipGlobal(co_DLC01Bot_Torso_Robobrain_Armor_Wasteland_Global)
	flipGlobal(co_DLC01Bot_Torso_RoboBrain_Global)
	flipGlobal(co_DLC01Bot_Torso_Sentry_Armor_Construction_Global)
	flipGlobal(co_DLC01Bot_Torso_Sentry_Armor_Wasteland_Global)
	flipGlobal(co_DLC01Bot_Torso_Sentry_Global)
	
	flipGlobal(DLC01WorkshopSchematicResourceScanner_Global)
	flipGlobal(DLC01WorkshopSchematicSpotlight_Global)

	finish()
EndFunction
