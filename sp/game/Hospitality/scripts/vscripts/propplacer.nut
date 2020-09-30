print("prop placer init")


local crosshair = Vector(0, 0, 0)

// ent_fire player runscriptfile weapon

local canFire = true
function PlayerRunCommand()
{
    // If the player is holding ATTACK3, add the device
    if (command.GetButtons() & IN.ATTACK3) {
		if (canFire) {
			print("place prop event")
		}
		canFire = false
	} else {
		canFire = true
	}
	
}