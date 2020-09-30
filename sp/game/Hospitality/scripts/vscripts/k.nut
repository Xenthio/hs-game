//class weptest extends CBaseCombatWeapon {
//	function PrimaryAttack() {
//		print("stink")
//	}
//}

local proppreviewKV =
{
	targetname = "proppreview"
	model = "models/props_junk/wood_crate001a.mdl"
	//solid = "0"
	origin = self.GetOrigin()
}


local spriteKV = 
{
	targetname = "sprite"
	model = "sprites/glow01.spr"
	rendercolor = "255 255 255"
	scale = "0.25"
	origin = self.GetOrigin()
}

local measuredirKV =
{
	targetname = "measuredir"
	MeasureReference = "!player"
	MeasureTarget = "!player"
	MeasureType = "1"
	Target = "proppreview"
	TargetReference = "measuremove"
	origin = self.GetOrigin()
	mask = "1174421507"
}


local measuremoveKV =
{
	targetname = "measuremove"
	MeasureReference = "!player"
	MeasureTarget = "!player"
	MeasureType = "1"
	Target = "measuremove"
	TargetReference = "!player"
	origin = self.GetOrigin()
}

local noCollideKV =
{
	attachment1 = "proppreview"
	attachment2 = "proppreview"
	startdisabled = "1"
}
local proppreviewENT = SpawnEntityFromTable("prop_dynamic", proppreviewKV)
//local spriteENT = SpawnEntityFromTable("env_sprite", spriteKV)
local measuremoveENT = SpawnEntityFromTable("logic_measure_movement", measuremoveKV)
local measuredirENT = SpawnEntityFromTable("logic_measure_direction", measuredirKV)
//local noCollideENT = SpawnEntityFromTable("logic_collision_pair", noCollideKV)

local currentProp = "models/props_junk/wood_crate001a.mdl"

local canFire = true
function PlayerRunCommand()
{
    // If the player is holding ATTACK3, add the device
    if (command.GetButtons() & IN.ATTACK2) {
		if (canFire) {
			currentProp = "models/props_borealis/bluebarrel001.mdl"
			EntFireByHandle( proppreviewENT, "SetModel", currentProp, 0.00, self, self )
		}
		canFire = false
	} else if (command.GetButtons() & IN.ATTACK) {
		if (canFire) {
			local tempKV =
			{
				model = currentProp
				origin = proppreviewENT.GetOrigin()
			}
			SpawnEntityFromTable("prop_physics",tempKV)
		}
		canFire = false
	} else {
		canFire = true
	}
	
}

//a.SetLocalOrigin(Vector(10000, 10000, 10000))