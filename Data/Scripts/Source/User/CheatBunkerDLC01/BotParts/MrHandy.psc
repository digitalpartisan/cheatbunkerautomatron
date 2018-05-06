Scriptname CheatBunkerDLC01:BotParts:MrHandy extends CheatBunkerDLC01:BotParts

Struct PartList
	ObjectMod Center
	ObjectMod Right
	ObjectMod Left
EndStruct

PartList[] Property PartLists Auto Const Mandatory

Int iCenterLocation = 0 Const
Int iRightLocation = 1 Const
Int iLeftLocation = 2 Const

PartList[] Function getPartLists()
	return PartLists
EndFunction

Function applyPartList(Actor actorRef, PartList list)
	attemptModAttach(actorRef, list.Center, iCenterLocation)
	; until the API gets fixed (not likely since we're well past last game patch, adding more than one Mr. Handy anything at any location just doesn't seem to pan out.
	;attemptModAttach(actorRef, list.Right, iRightLocation)
	;attemptModAttach(actorRef, list.Left, iLeftLocation)
EndFunction

Function applyPartLists(Actor actorRef)
	PartList[] aLists = getPartLists()
	
	if (!aLists)
		return
	endif
	
	Int iCounter = 0
	while (iCounter < aLists.Length)
		applyPartList(actorRef, aLists[iCounter])
		iCounter += 1
	endwhile
EndFunction

Function applyTo(Actor actorRef)
	parent.applyTo(actorRef)
	applyPartLists(actorRef)
EndFunction
