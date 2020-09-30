"GameMenu"
{
	"1"
	{
		"label" "             "
		"command" "ResumeGame"
		"InGameOrder" "10"
		"OnlyInGame" "1"
	}
	"5"	
	{
		"label" "NEW GAME"
		"command" "OpenNewGameDialog"
		"InGameOrder" "40"
		"notmulti" "1"
	}
	"6"
	{
		"label" "L             "
		"command" "OpenLoadGameDialog"
		"InGameOrder" "30"
		"notmulti" "1"
	}
	"7"
	{
		"label" "S             "
		"command" "OpenSaveGameDialog"
		"InGameOrder" "20"
		"notmulti" "1"
		"OnlyInGame" "1"
	}
	"7_5"
	{
		"label" "V             "
		"command" "engine vr_activate"
		"InGameOrder" "40"
		"OnlyWhenVREnabled" "1"
		"OnlyWhenVRInactive" "1"
	}
	"7_6"
	{
		"label" "V             "
		"command" "engine vr_deactivate"
		"InGameOrder" "40"
		"OnlyWhenVREnabled" "1"
		"OnlyWhenVRActive" "1"
	}
	"8"
	{
		"label" "B             "
		"command" "OpenBonusMapsDialog"
		"InGameOrder" "50"
	}
	"9"
	{
		"label" "C             "
		"command" "OpenControllerDialog"
		"InGameOrder" "60"
		"ConsoleOnly" "1"
	}
	"10"
	{
		"label" "O             "
		"command" "OpenOptionsDialog"
		"InGameOrder" "70"
	}
	"11"
	{
		"label" "Q             "
		"command" "Quit"
		"InGameOrder" "80"
	}
}

