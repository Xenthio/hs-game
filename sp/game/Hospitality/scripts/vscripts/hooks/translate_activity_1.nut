//=============================================================================
// 
// This script was made by Blixibon for Mapbase. You can use it as a template for your own scripts.
// 
//=============================================================================
//
// Purpose: This script demonstrates the NPC_TranslateActivity hook, which allows NPCs to use different activities (animations)
//          in their AI without needing to use a scripted_sequence.
//
//=============================================================================

function NPC_TranslateActivity()
{
	local newactivity = -1;

    // This code makes a NPC's basic idle/walk/run activities
    // use "crouching" activities instead.
	if (activity == "ACT_IDLE")
		newactivity = "ACT_COVER_LOW"
	else if (activity == "ACT_WALK")
		newactivity = "ACT_WALK_CROUCH"
    else if (activity == "ACT_RUN")
		newactivity = "ACT_RUN_CROUCH"

	return newactivity;
}
