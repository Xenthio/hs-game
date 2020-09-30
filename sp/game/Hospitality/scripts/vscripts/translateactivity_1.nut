//=============================================================================
// 
// This script was made by Blixibon for Mapbase. You can use it as a template for your own scripts.
// 
//=============================================================================
//
// Purpose: This script shows how NPC_TranslateActivity can be used in VScript.
//
//=============================================================================

// The NPC running this script automatically searches for a function named "NPC_TranslateActivity".
// If it finds one, it runs the function with an "activity" global variable which contains the current activity string.
// The function should return the activity the NPC should use instead. Returning -1 or "ACT_INVALID" will just use the original activity.
// 
// There's also a separate "activity_id" variable with the activity's enum ID and the function can return an ID, but that's not shown here.
function NPC_TranslateActivity()
{
	local newactivity = -1;

	// This makes NPCs use their "on fire" animations while idle or moving.
	// Thiis can be used on on metrocops, citizens, etc.
	// (Zombies use ACT_WALK_ON_FIRE instead of ACT_RUN_ON_FIRE, so it doesn't work with them)
	if (activity == "ACT_IDLE")
		newactivity = "ACT_IDLE_ON_FIRE";
	else if (activity == "ACT_WALK" || activity == "ACT_RUN")
		newactivity = "ACT_RUN_ON_FIRE";

	return newactivity;
}
