state("Munch", "v2.1.1 25-02-2021 wjb1114#8967 and LegnaX#7777")
{
	byte levelId : 0x332188;
	byte isLoad : 0x318351;
	byte gameState : 0x35AF64;
	string2 loadScreenIndex : 0x358587;	
	int gnFrame : 0x354318;
}

startup {
	// script startup
	
	// legal vars
	vars.You_can_show_the_following_variables_on_runs = "Ahh, I see!";
	vars.IGT = "Ingame timer will be displayed here";
	vars.RTA = "Real time will be displayed here";
	vars.IGTandRTAInline = "Both timers will be displayed here.";
	
	// 'legal' vars (for now)
	
	vars.____________________________________ = "Ignore this.";
	vars.You_can_NOT_show_the_following_variables_on_runs = "Only the 3 above ones can be used.";
	
	// illegal vars
	vars.curLvl = -1;
	vars.executiveFix = false;
	vars.gameCrashed = false;
	vars.raisinFix = false;
	vars.crashLastLvl = -1;
	vars.loading = false;
	vars.trueLoad = false;
	vars.loadingFix = false;		
	vars.StartgnFrame = 0;
	vars.GNFrame = 0;
	vars.Epoch = 0;
	vars.MillisecondsPaused = 0;
	vars.PauseStartTime = -1;
	vars.fps = 60; // FPS of the game. OBVIOUSLY 60! It can be seen on the FUCKING GAME!!
	vars.GNFrameWhenPaused = 0;
	vars.EpochQS = 0;
	vars.TimeSpentQuiksaving = "";
	vars.TSQ = 0;
	vars.QuikSaveTime = 2900; // Milliseconds added after every quiksave. This SHOULD NOT be modified unless a new amount is agreeded between the moderators. Seriously: touch this and you are literally cheating on the game. You have been warned.
	vars.EpochExtraQS = 0; // This is used when vars.QuikSaveTime pass after the quiksave. It will register the epoch after the vars.QuikSaveTime and then substract it from the load time. (Hybrid mode).
	vars.ThisIsNOTAFuckingCinematic = false; // 

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
	
	settings.Add("500Rate", false, "500 refreshes per second (TESTS ONLY)", "nag");
	settings.SetToolTip("500Rate", "Sets the autosplitter to refresh 500 times per second. Computer will cry.");	
	
	settings.Add("1000Rate", false, "1000 refreshes per second (TESTS ONLY)", "nag");
	settings.SetToolTip("1000Rate", "Sets the autosplitter to refresh 1000 times per second. This is a bad idea.");	
	
	settings.Add("anyPercent", false, "Any% (No FPS cap)");
	settings.SetToolTip("anyPercent", "Use this option ONLY when doing full game runs or ILs on Any% (no 60FPS).");
	
	settings.Add("badEnding", true, "Bad Ending");
	settings.SetToolTip("badEnding", "Ends the run on the Bad Ending cutscene at the end of Loading Dock. Ensure that IL mode and Good Ending are disabled!");
	
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
	
	version = "v2.11 wjb1114#8967  25-02-21 (Hybrid)";
	
	if (vars.curLvl != -1)
	{
		vars.gameCrashed = true;
		vars.crashLastLvl = vars.curLvl;
	}
	
	// Note: for testing/development onnly. Using the debug var viewer WILL invalidate your run!
	vars.debugVars = "levelId: " + current.levelId + " | isLoad: " + current.isLoad + " | gameState: " + current.gameState + " | curLvl: " + vars.curLvl + " | old levelId: " + old.levelId + " | lsi: |" + current.loadScreenIndex + "|";
}



update
{
	// vars.RTA = "RTA: [" + System.Convert.ToString(timer.CurrentTime.RealTime).Replace("0000", "").Replace("00:", "") + "]";
	// vars.IGT = "IGT: [" + System.Convert.ToString(timer.CurrentTime.GameTime).Replace("0000", "").Replace("00:", "") + "]";
	// Note: for testing/development onnly. Using the debug var viewer WILL invalidate your run!
	vars.debugVars = "levelId: " + current.levelId + " | isLoad: " + current.isLoad + " | gameState: " + current.gameState + " | curLvl: " + vars.curLvl + " | old levelId: " + old.levelId + " | lsi: |" + current.loadScreenIndex + "|";
	// vars.IGTandRTAInline = vars.RTA + " | " + vars.IGT;
	
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
	
	if (current.isLoad == 1 && old.isLoad == 0 && settings["anyPercent"])
	{
		vars.loading = true;
	}
	
	if (vars.loading == true && current.gameState != 0 && current.gameState != 5 && settings["anyPercent"])
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
	
	if (vars.loading == true && vars.trueLoad == true && current.isLoad == 0 && settings["anyPercent"])
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
	bool IStart = false;
	if (settings["ilMode"] == false)
	{
		if ((current.gameState == 9) && (old.gameState == 13))
		{
			vars.curLvl = 0;
			vars.raisinFix = true;
			vars.loading = false;
			vars.trueLoad = false;
			IStart = true;
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
				IStart = true;
			}
		}
		else if (settings["spooce"])
		{
			if (current.loadScreenIndex == "1" && current.levelId == 1 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["fuzzle"])
		{
			if (current.loadScreenIndex == "2" && current.levelId == 2 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["hydro"])
		{
			if (current.loadScreenIndex == "3" && current.levelId == 3 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["fluoride"])
		{
			if (current.loadScreenIndex == "4" && current.levelId == 4 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["snoozie"])
		{
			if (current.loadScreenIndex == "5" && current.levelId == 5 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["mudPens"])
		{
			if (current.loadScreenIndex == "6" && current.levelId == 6 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["slogOne"])
		{
			if (current.loadScreenIndex == "7" && current.levelId == 7 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["fortress"])
		{
			if (current.loadScreenIndex == "8" && current.levelId == 8 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["slogTwo"])
		{
			if (current.loadScreenIndex == "9" && current.levelId == 9 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["paramite"])
		{
			if (current.loadScreenIndex == "10" && current.levelId == 10 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["meep"])
		{
			if (current.loadScreenIndex == "11" && current.levelId == 11 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["brewery"])
		{
			if (current.loadScreenIndex == "12" && current.levelId == 12 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["fuel"])
		{
			if (current.loadScreenIndex == "13" && current.levelId == 13 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["magog"])
		{
			if (current.loadScreenIndex == "14" && current.levelId == 14 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["river"])
		{
			if (current.loadScreenIndex == "15" && current.levelId == 15 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["noMuds"])
		{
			if (current.loadScreenIndex == "16" && current.levelId == 16 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["boiler"])
		{
			if (current.loadScreenIndex == "17" && current.levelId == 17 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["splinter"])
		{
			if (current.loadScreenIndex == "18" && current.levelId == 18 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["reservoir"])
		{
			if (current.loadScreenIndex == "19" && current.levelId == 19 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["scrubPens"])
		{
			if (current.loadScreenIndex == "20" && current.levelId == 20 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["flubco"])
		{
			if (current.loadScreenIndex == "21" && current.levelId == 21 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["dockBad"] || settings["dockGood"])
		{
			if (settings["dockBad"])
			{
				vars.dockFix = true;
			}
			else
			{
				vars.dockFix = false;
			}
			if (current.loadScreenIndex == "22" && current.levelId == 22 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["labor"])
		{
			if (current.loadScreenIndex == "23" && current.levelId == 23 && current.isLoad == 1)
			{
				IStart = true;
			}
		}
		else if (settings["vykker"])
		{
			if (current.loadScreenIndex == "24" && current.levelId == 23 && current.isLoad == 1)
			{
				vars.vykkerFix = true;
				IStart = true;
			}
		}
	}
	if (IStart){		
		vars.StartgnFrame = current.gnFrame;		
		vars.PauseStartTime = -1;
		vars.MillisecondsPaused = 0;
		vars.PreviousTime = 0;
		vars.EpochQS = 0;
		return true;
	}
}

split
{

	if (current.gameState == 5 || current.gameState == 9){ // If the game is paused...
		vars.Epoch = (DateTime.UtcNow.Ticks - 621355968000000000) / 10000;
		if (vars.PauseStartTime == -1){ // Paused for the first time.
			vars.PauseStartTime = vars.Epoch;
			vars.GNFrameWhenPaused = current.gnFrame;
		}		
		
	} else {		
	
		if (vars.PauseStartTime > 0){ // Unpaused for the first time.
			if (vars.TSQ <= vars.QuikSaveTime && vars.TSQ >= (vars.QuikSaveTime / 2)) {
				vars.MillisecondsPaused = vars.MillisecondsPaused + (vars.Epoch - vars.PauseStartTime);
			} else if (vars.TSQ > (vars.QuikSaveTime / 2)) { // If this was a quiksave
										   // Total paused time.          Add new paused time.             Remove extra QS milliseconds.
				vars.MillisecondsPaused = vars.MillisecondsPaused + (vars.Epoch - vars.PauseStartTime) - (vars.Epoch - vars.EpochExtraQS);
			} else {                        
											// Total paused time.          Add new paused time.				
				vars.MillisecondsPaused = vars.MillisecondsPaused + (vars.Epoch - vars.PauseStartTime);
			}
			if (vars.TSQ >= 170 && vars.TSQ <= 300) { // If we did a QuikLoad, we will remove the Quikload time from the Loadless time.
				vars.MillisecondsPaused = vars.MillisecondsPaused - vars.TSQ; // TSQ = Time Spent Quiksaving, or in this case, Quikloading.
			}
			vars.PauseStartTime = -1;
			vars.StartgnFrame = vars.StartgnFrame + (current.gnFrame - vars.GNFrameWhenPaused);
			vars.TSQ = 0;
			vars.EpochExtraQS = 0;
		}
		
	}

	// Refresh rate (dinamically adjustable frame rate)
	refreshRate = 30;
	if (settings["nag"]){	
		if (settings["1000Rate"]){
			refreshRate = 1000;
		} else if (settings["500Rate"]){
			refreshRate = 500;
		} else if (settings["120Rate"]){
			refreshRate = 120;
		} else if (settings["90Rate"]){
			refreshRate = 90;
		} else if (settings["60Rate"]){
			refreshRate = 60;
		} else if (settings["10Rate"]){
			refreshRate = 10;
		}
	}
	
	// Splits
	if (settings["ilMode"] == false)
	{
		if (settings["badEnding"])
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
				if (vars.dockFix == true)
				{
					vars.dockFix = false;
					return false;
				}
				else
				{
					return true;
				}
			}
		}
		else if (settings["vykker"])
		{
			if (current.levelId == 23 && current.gameState == 7 && old.gameState == 0)
			{
				if (vars.vykkerFix == true)
				{
					vars.vykkerFix = false;
					return false;
				}
				else
				{
					return true;
				}
			}
		}
	}
	
}

isLoading
{	
	if (current.gameState == 9 && old.gameState == 5){
		vars.ThisIsNOTAFuckingCinematic = true;
	} else if ((current.gameState < 9 || current.gameState > 9) && vars.ThisIsNOTAFuckingCinematic) {
		vars.ThisIsNOTAFuckingCinematic = false;
	}
	
	if  (settings["anyPercent"]) {
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
			
	} else { // Uses gnFRAME to calculate the game time!! This is so EPIC!!!!!!!1!!1oneoneONE!!	
		
		int gnFrame = current.gnFrame;
		
		if ((current.gameState == 5 || vars.ThisIsNOTAFuckingCinematic == true) && old.gnFrame == current.gnFrame) {
			if (vars.EpochQS > 0){
				vars.TSQ = ((DateTime.UtcNow.Ticks - 621355968000000000) / 10000) - vars.EpochQS;
			}
			vars.TimeSpentQuiksaving = vars.TSQ + "ms";
		}
		else if ((current.gameState == 5 || vars.ThisIsNOTAFuckingCinematic == true) && old.gnFrame < current.gnFrame && vars.GNFrame > 10) {
			vars.EpochQS = (DateTime.UtcNow.Ticks - 621355968000000000) / 10000;
		} else if (vars.EpochQS > 0 && current.gameState == 0){
			if (vars.TSQ > 50) { // This was definitely a quiksave.
				
				if (vars.TSQ >= vars.QuikSaveTime) { // This should ALWAYS happen, unless the quiksave of this runner is like, awesome good.
					// I can add a check here that verifies the time spent quiksaving.
				} else { // Very weird.
					// I can add a check here that verifies the time spent quiksaving.
				}
				vars.TimeSpentQuiksaving = vars.TSQ + "ms";
			}
			vars.EpochQS = 0;
		}
		if (vars.StartgnFrame == 0) {
			vars.StartgnFrame = current.gnFrame;
		}
		
		if (gnFrame > 0) {
			if (current.gameState == 5 || vars.ThisIsNOTAFuckingCinematic){ // if the game is paused...
				
				vars.RTA = "Real Time = " + TimeSpan.Parse(System.Convert.ToString(timer.CurrentTime.RealTime)).ToString(@"h\:mm\:ss\.fff");
				vars.GNFrame = gnFrame - vars.StartgnFrame;
				if (vars.TSQ < vars.QuikSaveTime) { // We only update the timer if the TSQ is less than the QuikSaveTime.
					vars.IGT = "Loadless Time = " + TimeSpan.FromMilliseconds(((vars.GNFrameWhenPaused - vars.StartgnFrame) * 1000 / vars.fps) + vars.MillisecondsPaused + (vars.Epoch - vars.PauseStartTime)).ToString(@"h\:mm\:ss\.fff");
				}
				vars.IGTandRTAInline = vars.RTA + "\n" + vars.IGT;
				if ((TimeSpan.FromMilliseconds(((gnFrame - vars.StartgnFrame) * 1000 / vars.fps) + vars.MillisecondsPaused + (vars.Epoch - vars.PauseStartTime)).TotalMilliseconds) < (timer.CurrentTime.GameTime.Value.TotalSeconds * 1000)){ // Is the ingame timer bigger than the gnFrame timer? We will pause it this frame.
					return true;
				} else {					
					if (vars.TSQ >= vars.QuikSaveTime) { // The current quiksaving time exceeds the quiksave time = we pause the timer.
						if (vars.EpochExtraQS == 0){
							vars.EpochExtraQS = (DateTime.UtcNow.Ticks - 621355968000000000) / 10000; // This is the point where the timer exceeded for the first time.
						}
						return true;						
					} else { // We are good. The timer can continue.
						return false;
					}
				}
			} else {
				vars.RTA = "Real Time = " + TimeSpan.Parse(System.Convert.ToString(timer.CurrentTime.RealTime)).ToString(@"h\:mm\:ss\.fff");
				vars.GNFrame = gnFrame - vars.StartgnFrame;
				vars.IGT = "Loadless Time = " + TimeSpan.FromMilliseconds(((vars.GNFrame) * 1000 / vars.fps) + vars.MillisecondsPaused).ToString(@"h\:mm\:ss\.fff");
				vars.IGTandRTAInline = vars.RTA + "\n" + vars.IGT;
				if ((TimeSpan.FromMilliseconds(((gnFrame - vars.StartgnFrame) * 1000 / vars.fps) + vars.MillisecondsPaused).TotalMilliseconds) < (timer.CurrentTime.GameTime.Value.TotalSeconds * 1000)){ // Is the ingame timer bigger than the gnFrame timer? We will pause it this frame.
					return true;
				} else {
					return false;
				}
			}
		} else {
			return true; // :shrug: 
		}		
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