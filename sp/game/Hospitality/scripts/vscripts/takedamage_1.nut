//=============================================================================
// 
// This script was made by Blixibon for Mapbase. You can use it as a template for your own scripts.
// 
//=============================================================================
//
// Purpose: This script demonstrates how flexible damage can be applied in VScript.
//
//=============================================================================

// This function causes the specified entity to take damage.
function TakeDamage( entName )
{
    // This gets the entity based on the given name.
    local ent = Entities.FindByName(null,entName)

    // This creates the damage information.
    // The first two parameters are the inflictor and attacker. This code uses the entity running this script (self).
    // The third parameter is the damage force. It's just big upwards velocity in this case.
    // The fourth parameter is the damage position. It's irrelevant in this case, so it's set to a zero vector.
    // The fifth parameter is the damage. This code uses 1000, which is enough to kill most entities.
    // The sixth parameter is the damage type. It's irrelevant in this case, so it's set to DMG_GENERIC (generic type).
    local info = CreateDamageInfo(self, self, Vector(0, 0, 100000), Vector(0,0,0), 1000, DMG_GENERIC)

    if (ent)
    {
        // This applies the damage info to the specified entity.
        ent.TakeDamage(info)
    }
    else
    {
        // This code runs if the specified entity is not a valid entity.
        printl("ent not valid")
    }

    // This "deletes" the damage info so it doesn't linger around in memory.
    DestroyDamageInfo(info)
}
