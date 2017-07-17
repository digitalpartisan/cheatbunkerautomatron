Scriptname CheatBunkerDLC01:GetRaceEffect extends activemagiceffect

Event OnEffectStart(Actor akTarget, Actor akCaster)
	CheatBunkerDLC01:Logger.log(akTarget + " has race " + akTarget.GetRace())
EndEvent
