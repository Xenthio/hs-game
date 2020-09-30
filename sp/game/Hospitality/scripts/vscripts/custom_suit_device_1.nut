//=============================================================================
// 
// This script was made by Blixibon for Mapbase. You can use it as a template for your own scripts.
// 
//=============================================================================
//
// Purpose: This script demonstrates new VScript-driven custom suit devices.
//  
//          In this case, the device regenerates the player's health, basically
//          converting the player's aux power to health.
//
//=============================================================================

const DEVICE_REGEN = 0

// A drain rate of 25.0 is equivalent to 100 units in 4 seconds
// This is higher than the other devices, so it drains much faster
self.InitCustomSuitDevice(DEVICE_REGEN, 25.0)

// Overriding the "Mapbase_Hud_DEVICE0" localization string lets us control the suit device's label in the HUD.
// 
// NOTE: Localization strings can carry over across maps, so if any map uses custom suit devices, they should
// always set the localization string label so it doesn't use one from a previous map!
// Also, if you want this to show up in multiple languages, look into using actual localization files. Mapbase lets
// them be used on a map-by-map basis! (although they can still carry over to other maps)
Localize.AddStringAsUTF8("Mapbase_Hud_DEVICE0", "REGENERATE")

AddThinkToEnt(self, "SuitDeviceThink")

// This function handles the suit device's actual action, increasing the player's health by 5 every 0.25 seconds.
function SuitDeviceThink()
{
    if (self.IsCustomSuitDeviceActive(DEVICE_REGEN) && self.GetAuxPower() > 0)
    {
        EntFireByHandle( self, "AddHealth", 5 )
    }

    return 0.25
}

// We need to save this to remain consistent with the other suit devices
bOutOfAux <- false

// PlayerRunCommand() lets us connect directly with the player's commands, although this could just be
// done through self.GetButtons() in another function as well
function PlayerRunCommand()
{
    // If the player is holding ATTACK3, add the device
    if (command.GetButtons() & IN.ATTACK3)
    {
        if (self.GetAuxPower() <= 0 || bOutOfAux)
        {
            // If we're currently out of aux, don't do anything and ignore ATTACK3 if we've
            // already run out of energy.
            bOutOfAux = true
            self.RemoveCustomSuitDevice(DEVICE_REGEN)
        }
        else
        	self.AddCustomSuitDevice(DEVICE_REGEN)
    }
    else
    {
        bOutOfAux = false
        self.RemoveCustomSuitDevice(DEVICE_REGEN)
    }
}