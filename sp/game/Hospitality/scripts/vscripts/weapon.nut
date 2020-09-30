print("started")


local spread = Vector(0.03, 0.03, 0.03)


local crab = SpawnEntityFromKeyValues("npc_headcrab", null)

// ent_fire player runscriptfile weapon

local canFire = true
function PlayerRunCommand()
{
    // If the player is holding ATTACK3, add the device
    if (command.GetButtons() & IN.ATTACK3) {
		if (canFire) {
			local k = self.ShootPosition() + Vector(self.EyeDirection3D().x * 13, self.EyeDirection3D().y * 13, 0)
			local info = CreateFireBulletsInfo(1, k, self.EyeDirection3D(), spread, 1, self)
			crab.FireBullets(info)
				
			print("-----")
			print("\n")
			print(self)
			print("\n")
			print(k)
			print("\n")
			print(self.ShootPosition())
			print("\n")
			print(self.EyeDirection3D())
			print("\n")
			print(self.GetLocalOrigin())
			print("\n")
			print(self.GetLocalAngles())
			print("\n")

			print(spread)
			print("\n")
			print("-----")
			print("\n")
			
		}
		canFire = false
	} else {
		canFire = true
	}
	
}