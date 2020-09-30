//=============================================================================
// 
// This script was made by Blixibon for Mapbase. You can use it as a template for your own scripts.
// 
//=============================================================================
//
// Purpose: This script demonstrates how the I/O system can be influenced in VScript.
//
//=============================================================================

// This function disables all logic_relay entities with a specific name.
// Demonstrates how EntFire can be used in a way which supercedes regular I/O usage.
function DisableOurRelays()
{
    // "relayName" will contain the name of the relays we should disable.
    local relayName = ""
    
    // If the entity running this script (self) is a Combine soldier, relayName will use "combine_relays".
    // If the entity running this script (self) is a citizen, relayName will use "citizen_relays".
    if ( self.GetClassname() == "npc_combine_s" )
    {
        relayName = "combine_relays"
    }
    else if ( self.GetClassname() == "npc_citizen" )
    {
        relayName = "citizen_relays"
    }

    // "EntFire" fires an input into the I/O system.
    // It has optional parameters for setting an input parameter, a delay, and even overriding the activator/caller.
    EntFire( relayName, "Disable" )
}

// This function kills all zombies with <10 health by using the "SetHealth" input.
// Demonstrates EntFireByHandle, which fires an input on a single entity instead of all entities using a name.
function KillWeakZombies()
{
    local ent = null
    while((ent = Entities.FindByClassname(ent,"npc_zombie")) != null)
    {
        if ( ent.GetHealth() < 10 )
        {
            // "EntFireByHandle" is more strict than "EntFire", requiring all of its parameters.
            // The last 3 parameters set the delay to 0 (instant) and make the entity running this
            // script the activator and caller of this input.
            EntFireByHandle( ent, "SetHealth", "0", 0.00, self, self )
        }
    }
}
