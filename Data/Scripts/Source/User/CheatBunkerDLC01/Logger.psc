Scriptname CheatBunkerDLC01:Logger Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[1]
	tags[0] = "Automatron"
	return tags
EndFunction

Bool Function log(String sMessage) Global
	return Jiffy:Loggout.log(CheatBunker:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function warn(String sMessage) Global
	return Jiffy:Loggout.warn(CheatBunker:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function error(String sMessage) Global
	return Jiffy:Loggout.error(CheatBunker:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function logModAttachFailure(Actor actorRef, ObjectMod oMod, Int iAttachPoint) Global
	return warn("Could not attach mod " + oMod + " to " + actorRef + " in position " + iAttachPoint)
EndFunction
