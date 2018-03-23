Scriptname CheatBunkerDLC01:Autocompletion:RestoringOrder extends cheatbunker:autocompletion Conditional

ObjectReference Property FacilitiesTape Auto Const
ObjectReference Property ProductionTape Auto Const
ObjectReference Property ResearchTape Auto Const

Bool Function playerHasTape(ObjectReference akTape)
	return akTape.getContainer() == Game.GetPlayer()
EndFunction

Bool Function playerHasTapes()
	return playerHasTape(FacilitiesTape) && playerHasTape(ProductionTape) && playerHasTape(ResearchTape)
EndFunction

Function givePlayerTape(ObjectReference akTape)
	if (!playerHasTape(akTape))
		Game.GetPlayer().AddItem(akTape)
	endif
EndFunction

Function givePlayerTapes()
	givePlayerTape(FacilitiesTape)
	givePlayerTape(ProductionTape)
	givePlayerTape(ResearchTape)
EndFunction

Bool Function canExecuteLogic()
	return parent.canExecuteLogic() && !playerHasTapes()
EndFunction

Function executeBehavior()
	givePlayerTapes()
	conclude()
EndFunction
