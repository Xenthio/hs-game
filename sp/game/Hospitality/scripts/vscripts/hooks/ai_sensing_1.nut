//=============================================================================
// 
// This script was made by Blixibon for Mapbase. You can use it as a template for your own scripts.
// 
//=============================================================================
//
// Purpose: This script demonstrates new AI sending hooks on NPCs which allow users
//          to have full control over NPC sight and sound.
//
//          In this case, NPCs can't hear footstep sounds and only see entities within
//          a specific FOV.
//
//=============================================================================

function QueryHearSound()
{
    // SOUND_PLAYER is usually used for footsteps. Don't hear that
    if (sound.SoundType() & SOUND_PLAYER)
    {
        return false
    }
    else
    {
        return true
    }
}

// This uses the direct dot product instead of a viewcone in degrees, similar to npc_enemyfinder.
// 0.5 is equivalent to a viewcone of 45 degrees.
const AI_SENSING_SAMPLE_CONE = 0.5

function QuerySeeEntity()
{
    // Only see entities within a specific viewcone.
    // This code is based directly on the original viewcone code used by NPCs.
    local vecDelta = entity.GetOrigin() - self.EyePosition()
    vecDelta.z = 0
    vecDelta.Norm()
    
    // NOTE: EyeDirection2D() gets the NPC's "eye" direction, which can move with their head as they look around.
    // If you want to use the NPC's forward direction without having to work with a NPC's unpredictable head, use BodyDirection2D() instead.
    // You could also use self.CapabilitiesRemove(bits_CAP_ANIMATEDFACE) to remove automatic head turning on NPCs like citizens and CPs.
    // (although some head turning is baked into the animation, which is the case with vanilla Combine soldiers)
    local flDot = vecDelta.Dot(self.EyeDirection2D())
    if (flDot > AI_SENSING_SAMPLE_CONE)
    {
        printl("Seeing dot of " + flDot)
        return true
    }
    else
    {
        printl("Not seeing dot of " + flDot)
        return false
    }
}
