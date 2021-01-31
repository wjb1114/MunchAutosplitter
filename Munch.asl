state("Munch", "1.0 31-01-2021 wjb1114#8967")
{
	byte levelId : 0x332188;
	byte isLoad : 0x318351;
	byte gameState : 0x35AF64;
}

startup {
	// script startup
	
	vars.curLvl = -1;
	vars.executiveFix = false;
	vars.gameCrashed = false;
	vars.raisinFix = false;
	vars.crashLastLvl = -1;

	settings.Add("nag", true, "REFRESH RATE OF THE AUTOSPLITTER");
	settings.SetToolTip("nag", "Sets the autosplitter to refresh 30 times per second. Leaving all options unckeched will set refresh rate to 30 by default anyway.");
	
	settings.Add("10Rate", false, "10 refreshes per second (potato mode ACTIVATED)", "nag");
	settings.SetToolTip("10Rate", "Sets the autosplitter to refresh 10 times per second. Perfect for potato computers. Inaccurate times may happen.");
	
	settings.Add("30Rate", true, "30 refreshes per second (DEFAULT)", "nag");
	settings.SetToolTip("30Rate", "Sets the autosplitter to refresh 30 times per second. Leaving all options unckeched will set refresh rate to 30 by default anyway.");
	
	settings.Add("60Rate", false, "60 refreshes per second", "nag");
	settings.SetToolTip("60Rate", "Sets the autosplitter to refresh 60 times per second. Should help getting a bit more accurate times.");
	
	settings.Add("90Rate", false, "90 refreshes per second", "nag");
	settings.SetToolTip("90Rate", "Sets the autosplitter to refresh 90 times per second. Should help getting very accurate times.");
	
	settings.Add("120Rate", false, "120 refreshes per second", "nag");
	settings.SetToolTip("120Rate", "Sets the autosplitter to refresh 120 times per second. R U crazy or wut m8?");	
}

init
{
	// game startup
	
	version = "1.0 31-01-2021 wjb1114#8967";
	
	if (vars.curLvl != -1)
	{
		vars.gameCrashed = true;
		vars.crashLastLvl = vars.curLvl;
	}
	
	vars.debugVars = "levelId: " + current.levelId + " | isLoad: " + current.isLoad + " | gameState: " + current.gameState + " | curLvl: " + vars.curLvl + " | old levelId: " + old.levelId + " | exec: " + vars.executiveFix + " | crashed: " + vars.gameCrashed + " | process: " + game.ProcessName;
}



update
{
	//vars.watchers.UpdateAll(game);

//	print("Level ID      = " + current.levelId.ToString());
//	print("Loading       = " + current.isLoad.ToString());
//	print("Current State = " + current.gameState.ToString());

	vars.debugVars = "levelId: " + current.levelId + " | isLoad: " + current.isLoad + " | gameState: " + current.gameState + " | curLvl: " + vars.curLvl + " | old levelId: " + old.levelId + " | exec: " + vars.executiveFix + " | crashed: " + vars.gameCrashed + " | process: " + game.ProcessName;
	
	if (vars.gameCrashed == true)
	{
		if (current.isLoad == 0)
		{
			vars.curLvl = vars.crashLastLvl;
			vars.gameCrashed = false;
		}
		else
		{
			return;
		}
	}
	
	//if (vars.curLvl != 0 && vars.curLvl != current.levelId && current.levelId != 0)
	//{
	//	vars.curLvl = current.levelId;
	//}
	
	if (vars.curLvl == 22 && current.isLoad == 0 && vars.executiveFix == true)
	{
		vars.executiveFix = false;
	}
	
	if (vars.gameCrashed == true && vars.curLvl > 0)
	{
		vars.gameCrashed = false;
	}
}

start
{
	if ((current.gameState == 9) && (old.gameState == 13))
	{
		vars.curLvl = 0;
		vars.raisinFix = true;
		return true;
	}
}

split
{

	// Refresh rate (dinamically adjustable frame rate)
	if (settings["nag"]){	
		if (settings["120Rate"]){
			refreshRate = 120;
		} else if (settings["90Rate"]){
			refreshRate = 90;
		} else if (settings["60Rate"]){
			refreshRate = 60;
		} else if (settings["10Rate"]){
			refreshRate = 10;
		} else {
			refreshRate = 30;	
		}
	} else {	
		refreshRate = 30;
	}
	
	// Splits
	if(current.levelId == (old.levelId + 1) || (current.levelId > old.levelId && old.levelId == 0 && vars.curLvl == (current.levelId - 1)))
	{
		if (vars.raisinFix == true)
		{
			vars.raisinFix = false;
		}
	
		if (current.levelId == 22)
		{
			vars.executiveFix = true;
		}
	
		vars.curLvl = current.levelId;
		return true;
	}
	else if ((current.levelId == 22) && (current.gameState == 7) && (old.levelId == 22) && (vars.curLvl == 22) && (old.gameState == 0) && vars.executiveFix == false) // handling for end of Loading Dock any% / black quarma
	{
		return true;
	}
	else if (old.levelId == 23 && current.levelId == 23 && current.isLoad == 1 && old.isLoad == 0) // split from labor egg storage to vykker's suites
	{
		vars.curLvl = 24;
		return true;
	}
	else if (current.isLoad == 0 && current.gameState == 7 && vars.curLvl == 24) // split after vykker's suites
	{
		return true;
	}
}

isLoading
{
	if ((current.isLoad == 1) && (old.isLoad == 0))
	{
		return true;
	}
	else if ((current.isLoad == 1) && (old.isLoad == 1))
	{
		return true;
	}
	else
	{
		return false;
	}
}

reset
{
	if (vars.gameCrashed == true || vars.raisinFix == true)
	{
		return false;
	}
	else if(current.levelId == 0 && current.gameState == 10)
	{
		vars.curLvl = -1;
		return true;
	}
	//else if (((current.levelId == 0) && (vars.curLvl != -1) && (vars.curLvl != 0)) || (current.gameState == 17 && current.levelId == 0) || (current.gameState == 10 && current.levelId == 0))
	//{
	//	vars.curLvl = -1;
	//	return true;
	//}
}