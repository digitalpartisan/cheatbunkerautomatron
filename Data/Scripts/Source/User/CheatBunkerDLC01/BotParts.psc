Scriptname CheatBunkerDLC01:BotParts extends Quest

ObjectMod[] Property Mods Auto Const

Function attemptModAttach(Actor actorRef, ObjectMod oMod, Int iAttachPoint = 1)
	if (None != oMod && !actorRef.AttachMod(oMod, iAttachPoint))
		CheatBunkerDLC01:Logger.logModAttachFailure(actorRef, oMod, iAttachPoint)
	endif
EndFunction

ObjectMod[] Function getMods()
	return Mods
EndFunction

Function applyTo(Actor actorRef)
	ObjectMod[] aMods = getMods()
	
	if (!aMods)
		return
	endif
	
	Int iCounter = 0
	while (iCounter < aMods.Length)
		attemptModAttach(actorRef, aMods[iCounter])
		iCounter += 1
	endwhile
EndFunction
