state("Munch", "v1.0.0 20-02-2021 wjb1114#8967")
{
	byte levelId : 0x332188;
	byte isLoad : 0x318351;
	byte gameState : 0x35AF64;
	string2 loadScreenIndex : 0x358587;
}

startup {
	// script startup
	
	vars.curLvl = -1;
	vars.executiveFix = false;
	vars.gameCrashed = false;
	vars.raisinFix = false;
	vars.crashLastLvl = -1;
	vars.loading = false;
	vars.trueLoad = false;
	vars.loadingFix = false;
	vars.IGT = "";
	vars.RTA = "";

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
	
	settings.Add("anyPercent", true, "Bad Ending");
	settings.SetToolTip("anyPercent", "Ends the run on the Bad Ending cutscene at the end of Loading Dock. Ensure that IL mode and Good Ending are disabled!");
	
	settings.Add("hundredPercent", false, "Good Ending");
	settings.SetToolTip("hundredPercent", "Ends the run on the Good Ending cutscene at the end of Vykkers Suites. Ensure that IL mode and Bad Ending are disabled!");
	
	// IL Settings
	
	settings.Add("ilMode", false, "IL Mode");
	settings.SetToolTip("ilMode", "Enable IL mode. Ensure that both Good Ending and Bad Ending are disabled! Make sure to select the sub-option for the level you want to run.");
	
	settings.Add("raisin", false, "Raisin's Cave", "ilMode");
	settings.SetToolTip("raisin", "Raisin's Cave");
	
	settings.Add("spooce", false, "Spooceshrub Forest", "ilMode");
	settings.SetToolTip("spooce", "Spooceshrub Forest");
	
	settings.Add("fuzzle", false, "Fuzzle Testing", "ilMode");
	settings.SetToolTip("fuzzle", "Fuzzle Testing");
	
	settings.Add("hydro", false, "Hydroponic Vats", "ilMode");
	settings.SetToolTip("hydro", "Hydroponic Vats");
	
	settings.Add("fluoride", false, "Fluoride Tanks", "ilMode");
	settings.SetToolTip("fluoride", "Fluoride Tanks");
	
	settings.Add("snoozie", false, "Snoozie Lab", "ilMode");
	settings.SetToolTip("snoozie", "Snoozie Lab");
	
	settings.Add("mudPens", false, "Mudokon Pens", "ilMode");
	settings.SetToolTip("mudPens", "Mudokon Pens");
	
	settings.Add("slogOne", false, "Sloghut 1027", "ilMode");
	settings.SetToolTip("slogOne", "Sloghut 1027");
	
	settings.Add("fortress", false, "Mudokon Fortress", "ilMode");
	settings.SetToolTip("fortress", "Mudokon Fortress");
	
	settings.Add("slogTwo", false, "Sloghut 2813", "ilMode");
	settings.SetToolTip("slogTwo", "Sloghut 2813");
	
	settings.Add("paramite", false, "Paramite Run", "ilMode");
	settings.SetToolTip("paramite", "Paramite Run");
	
	settings.Add("meep", false, "Meep Herder Village", "ilMode");
	settings.SetToolTip("meep", "Meep Herder Village");
	
	settings.Add("brewery", false, "Brewery To Be", "ilMode");
	settings.SetToolTip("brewery", "Brewery To Be");
	
	settings.Add("fuel", false, "Fuel Fields", "ilMode");
	settings.SetToolTip("fuel", "Fuel Fields");
	
	settings.Add("magog", false, "Magog Motors", "ilMode");
	settings.SetToolTip("magog", "Magog Motors");
	
	settings.Add("river", false, "Dead River", "ilMode");
	settings.SetToolTip("river", "Dead River");
	
	settings.Add("noMuds", false, "No Muds Land", "ilMode");
	settings.SetToolTip("noMuds", "No Muds Land");
	
	settings.Add("boiler", false, "Boiler Room", "ilMode");
	settings.SetToolTip("boiler", "Boiler Room");
	
	settings.Add("splinter", false, "Splinterz Manufacturing", "ilMode");
	settings.SetToolTip("splinter", "Splinterz Manufacturing");
	
	settings.Add("reservoir", false, "Reservoir Row", "ilMode");
	settings.SetToolTip("reservoir", "Reservoir Row");
	
	settings.Add("scrubPens", false, "Flub Fuels Scrub Pens", "ilMode");
	settings.SetToolTip("scrubPens", "Flub Fuels Scrub Pens");
	
	settings.Add("flubco", false, "Flubco Executive Office", "ilMode");
	settings.SetToolTip("flubco", "Flubco Executive Office");
	
	settings.Add("dockBad", false, "Loading Dock (Bad Ending)", "ilMode");
	settings.SetToolTip("dockBad", "Loading Dock (Bad Ending)");
	
	settings.Add("dockGood", false, "Loading Dock (Good Ending)", "ilMode");
	settings.SetToolTip("dockGood", "Loading Dock (Good Ending)");
	
	settings.Add("labor", false, "Labor Egg Storage", "ilMode");
	settings.SetToolTip("labor", "Labor Egg Storage");
	
	settings.Add("vykker", false, "Vykkers Suites", "ilMode");
	settings.SetToolTip("vykker", "Vykkers Suites");
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
	
	// Note: for testing/development onnly. Using the debug var viewer WILL invalidate your run!
	vars.debugVars = "levelId: " + current.levelId + " | isLoad: " + current.isLoad + " | gameState: " + current.gameState + " | curLvl: " + vars.curLvl + " | old levelId: " + old.levelId + " | lsi: |" + current.loadScreenIndex + "|";
	vars.gameVars = "RTA: " + vars.RTA + " | IGT: " + vars.IGT;
}



update
{
	vars.RTA = "[" + System.Convert.ToString(timer.CurrentTime.RealTime).Replace("0000", "").Replace("00:", "") + "]";
	vars.IGT = "[" + System.Convert.ToString(timer.CurrentTime.GameTime).Replace("0000", "").Replace("00:", "") + "]";
	// Note: for testing/development onnly. Using the debug var viewer WILL invalidate your run!
	vars.debugVars = "levelId: " + current.levelId + " | isLoad: " + current.isLoad + " | gameState: " + current.gameState + " | curLvl: " + vars.curLvl + " | old levelId: " + old.levelId + " | lsi: |" + current.loadScreenIndex + "|";
	vars.gameVars = "RTA: " + vars.RTA + " | IGT: " + vars.IGT;
	
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
	
	if (current.isLoad == 1 && old.isLoad == 0)
	{
		vars.loading = true;
	}
	
	if (vars.loading == true && current.gameState != 0 && current.gameState != 5)
	{
		vars.trueLoad = true;
	}
	
	if (vars.gameCrashed == true && vars.curLvl > 0)
	{
		vars.gameCrashed = false;
	}
	
	if (vars.raisinFix == false && current.levelId > 0 && vars.curLvl <= 0 && current.gameState != 0 && current.gameState != 5)
	{
		vars.curLvl = current.levelId;
	}
	
	if (vars.loading == true && vars.trueLoad == true && current.isLoad == 0)
	{
		vars.loading = false;
		vars.trueLoad = false;
	}
	
	if (vars.curLvl > 0 && vars.raisinFix == true)
	{
		vars.raisinFix = false;
	}
	
	
}

start
{
	if (settings["ilMode"] == false)
	{
		if ((current.gameState == 9) && (old.gameState == 13))
		{
			vars.curLvl = 0;
			vars.raisinFix = true;
			vars.loading = false;
			vars.trueLoad = false;
			return true;
		}
	}
	else
	{
		if (settings["raisin"])
		{
			if ((current.gameState == 9) && (old.gameState == 13))
			{
				vars.curLvl = 0;
				vars.raisinFix = true;
				vars.loading = false;
				vars.trueLoad = false;
				return true;
			}
		}
		else if (settings["spooce"])
		{
			if (current.loadScreenIndex == "1" && current.levelId == 1 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["fuzzle"])
		{
			if (current.loadScreenIndex == "2" && current.levelId == 2 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["hydro"])
		{
			if (current.loadScreenIndex == "3" && current.levelId == 3 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["fluoride"])
		{
			if (current.loadScreenIndex == "4" && current.levelId == 4 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["snoozie"])
		{
			if (current.loadScreenIndex == "5" && current.levelId == 5 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["mudPens"])
		{
			if (current.loadScreenIndex == "6" && current.levelId == 6 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["slogOne"])
		{
			if (current.loadScreenIndex == "7" && current.levelId == 7 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["fortress"])
		{
			if (current.loadScreenIndex == "8" && current.levelId == 8 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["slogTwo"])
		{
			if (current.loadScreenIndex == "9" && current.levelId == 9 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["paramite"])
		{
			if (current.loadScreenIndex == "10" && current.levelId == 10 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["meep"])
		{
			if (current.loadScreenIndex == "11" && current.levelId == 11 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["brewery"])
		{
			if (current.loadScreenIndex == "12" && current.levelId == 12 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["fuel"])
		{
			if (current.loadScreenIndex == "13" && current.levelId == 13 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["magog"])
		{
			if (current.loadScreenIndex == "14" && current.levelId == 14 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["river"])
		{
			if (current.loadScreenIndex == "15" && current.levelId == 15 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["noMuds"])
		{
			if (current.loadScreenIndex == "16" && current.levelId == 16 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["boiler"])
		{
			if (current.loadScreenIndex == "17" && current.levelId == 17 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["splinter"])
		{
			if (current.loadScreenIndex == "18" && current.levelId == 18 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["reservoir"])
		{
			if (current.loadScreenIndex == "19" && current.levelId == 19 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["scrubPens"])
		{
			if (current.loadScreenIndex == "20" && current.levelId == 20 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["flubco"])
		{
			if (current.loadScreenIndex == "21" && current.levelId == 21 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["dockBad"] || settings["dockGood"])
		{
			if (current.loadScreenIndex == "22" && current.levelId == 22 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["labor"])
		{
			if (current.loadScreenIndex == "23" && current.levelId == 23 && current.isLoad == 1)
			{
				return true;
			}
		}
		else if (settings["vykker"])
		{
			if (current.loadScreenIndex == "24" && current.levelId == 23 && current.isLoad == 1)
			{
				return true;
			}
		}
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
	if (settings["ilMode"] == false)
	{
		if (settings["anyPercent"])
		{
			if(current.levelId == (old.levelId + 1) || (current.levelId > old.levelId && old.levelId == 0 && vars.curLvl == (current.levelId - 1)))
			{
				print("Standard split");
			
				if (vars.raisinFix == true)
				{
					vars.raisinFix = false;
				}
			
				if (current.levelId == 21)
				{
					vars.executiveFix = true;
				}
			
				vars.curLvl = current.levelId;
				return true;
			}
			else if ((current.levelId == 22) && (current.gameState == 7) && (old.levelId == 22) && (vars.curLvl == 22) && (old.gameState == 0)) // handling for end of Loading Dock any% / black quarma
			{
				if (vars.executiveFix == true)
				{
					print("any% workaround triggered");
					vars.executiveFix = false;
					return false;
				}
				else
				{
					print("Any% end split");
					return true;
				}
			}
		}
		else if (settings["hundredPercent"])
		{
			if((current.levelId == (old.levelId + 1) || (current.levelId > old.levelId && old.levelId == 0 && vars.curLvl == (current.levelId - 1))) && vars.curLvl <= 23)
			{
				print("Standard split");
			
				if (vars.raisinFix == true)
				{
					vars.raisinFix = false;
				}
			
				if (current.levelId == 21)
				{
					vars.executiveFix = true;
				}
			
				vars.curLvl = current.levelId;
				return true;
			}
			
			else if (vars.curLvl == 23 && current.loadScreenIndex == "24")
			{
				vars.curLvl = 24;
				return true;
			}
			else if (vars.curLvl == 24 && current.gameState == 7 && old.gameState == 0)
			{
				vars.curLvl = 25;
				return true;
			}
		}
	}
	else
	{
		// normal splits
		if (settings["raisin"])
		{
			if (current.levelId == 1)
			{
				return true;
			}
		}
		else if (settings["spooce"])
		{
			if (current.levelId == 2)
			{
				return true;
			}
		}
		else if (settings["fuzzle"])
		{
			if (current.levelId == 3)
			{
				return true;
			}
		}
		else if (settings["hydro"])
		{
			if (current.levelId == 4)
			{
				return true;
			}
		}
		else if (settings["fluoride"])
		{
			if (current.levelId == 5)
			{
				return true;
			}
		}
		else if (settings["snoozie"])
		{
			if (current.levelId == 6)
			{
				return true;
			}
		}
		else if (settings["mudPens"])
		{
			if (current.levelId == 7)
			{
				return true;
			}
		}
		else if (settings["slogOne"])
		{
			if (current.levelId == 8)
			{
				return true;
			}
		}
		else if (settings["fortress"])
		{
			if (current.levelId == 9)
			{
				return true;
			}
		}
		else if (settings["slogTwo"])
		{
			if (current.levelId == 10)
			{
				return true;
			}
		}
		else if (settings["paramite"])
		{
			if (current.levelId == 11)
			{
				return true;
			}
		}
		else if (settings["meep"])
		{
			if (current.levelId == 12)
			{
				return true;
			}
		}
		else if (settings["brewery"])
		{
			if (current.levelId == 13)
			{
				return true;
			}
		}
		else if (settings["fuel"])
		{
			if (current.levelId == 14)
			{
				return true;
			}
		}
		else if (settings["magog"])
		{
			if (current.levelId == 15)
			{
				return true;
			}
		}
		else if (settings["river"])
		{
			if (current.levelId == 16)
			{
				return true;
			}
		}
		else if (settings["noMuds"])
		{
			if (current.levelId == 17)
			{
				return true;
			}
		}
		else if (settings["boiler"])
		{
			if (current.levelId == 18)
			{
				return true;
			}
		}
		else if (settings["splinter"])
		{
			if (current.levelId == 19)
			{
				return true;
			}
		}
		else if (settings["reservoir"])
		{
			if (current.levelId == 20)
			{
				return true;
			}
		}
		else if (settings["scrubPens"])
		{
			if (current.levelId == 21)
			{
				return true;
			}
		}
		else if (settings["flubco"])
		{
			if (current.levelId == 22)
			{
				return true;
			}
		}
		else if (settings["dockGood"])
		{
			if (current.levelId == 23)
			{
				return true;
			}
		}
		//non-standard split for ending labor egg storage
		else if (settings["labor"])
		{
			if (current.levelId == 23 && current.loadScreenIndex == "24")
			{
				return true;
			}
		}
		// non-standard splits for ending game
		else if (settings["dockBad"])
		{
			if ((current.levelId == 22) && (current.gameState == 7) && (old.levelId == 22) && (old.gameState == 0))
			{
				return true;
			}
		}
		else if (settings["vykker"])
		{
			if (current.levelId == 23 && current.gameState == 7 && old.gameState == 0)
			{
				return true;
			}
		}
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
	if (settings["ilMode"] == false)
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
	}
	else
	{
		// unknown if needed, resetting on a single level seems unnecessary when it can be done manually
		return false;
	}
}