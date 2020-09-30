//=============================================================================
// 
// This script was made by Blixibon for Mapbase. You can use it as a template for your own scripts.
// 
//=============================================================================
//
// Purpose: This script demonstrates the ClientCommand hook, which allows for custom console commands.
// 
//          Whenever the player sends something to the console and the engine can't find a matching command, 
//          the code will look for a ClientCommand function in VScript as a last resort before saying the
//          command can't be found.
// 
//          Since this only happens when no matching command exists, this hook cannot be used to override
//          existing console commands.
//          
//          When this hook is called, the following "parameters" can be used:
//          - "command" - A string containing the initial command (doesn't include parameters)
//          - "args" - An array containing the command's given parameters (does not include initial command)
//          
//          If this function returns true, the command will be considered an existing command.
//          If this function returns false, the console will send an "Unknown command" message.
// 
//          This script must be run directly on a player in order to function.
//
//=============================================================================

function ClientCommand()
{
    // This checks if the player has typed "nice" into the console (and nothing else).
    if (command == "nice")
    {
        printl("Deploying niceness!")
        self.SetHealth(100)
        self.SetArmor(100)
        return true
    }

    // This checks if the player has typed "something" into the console (not counting parameters separated by spaces and quotation marks)
    if (command == "something")
    {
        printl("Deploying something!")

        foreach (arg in args)
        {
            switch (arg)
            {
                case "nice":
                    {
                        printl("Deploying niceness!")
                        self.SetHealth(100)
                        self.SetArmor(100)
                        break;
                    }

                case "cool":
                    {
                        printl("Deploying something cool!")
                        EntFireByHandle( self, "GiveWeapon", "weapon_rpg" )
                        break;
                    }

                case "burning":
                    {
                        EntFire( "!picker", "Ignite" )
                        break;
                    }

                case "crappy":
                    {
                        local EntityKV =
                        {
                            rendercolor = Vector( 255, 255, 255 )
                            origin = self.GetOrigin()
                        }

                        for (local i = 0; i < 10; i++)
                        {
                            SpawnEntityFromTable("item_ammo_pistol", EntityKV)
                        }

                        break;
                    }
            }
        }

        return true
    }

    return false
}
