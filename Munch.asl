state("Munch", "v3.0.3 03-04-2025 wjb1114#8967, LegnaX#7777 and Fxyz")
{
	byte levelId : 0x332188;
	byte isLoad : 0x318351;
	byte gameState : 0x35AF64;
	string2 loadScreenIndex : 0x358587;	
	int gnFrame : 0x354318;
	short fuzzle : 0x358994, 0x8, 0x4, 0x8, 0x0, 0x0, 0x1C;
	short mudokon : 0x358994, 0x8, 0x4, 0x0, 0x8, 0x0, 0x1C;
	short egg : 0x358994, 0x8, 0x0, 0x8, 0x8, 0x4, 0x8, 0x1C;
	byte fuzzlelvl : 0x358994, 0x8, 0x4, 0x8, 0x0, 0x0, 0x14;
	byte mudokonlvl : 0x358994, 0x8, 0x4, 0x0, 0x8, 0x0, 0x14;
	byte egglvl : 0x358994, 0x8, 0x0, 0x8, 0x8, 0x4, 0x8, 0x14;
	double lvltimer : 0x356CF8, 0x1C;
	short mudokon2 : 0x78CF8, 0x94;
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
	vars.GNFrameWhenPaused = 0;
	vars.EpochQS = 0;
	vars.TimeSpentQuiksaving = "";
	vars.TSQ = 0;
	vars.QuikSaveTime = 2900; // Milliseconds added after every quiksave. This SHOULD NOT be modified unless a new amount is agreeded between the moderators. Seriously: touch this and you are literally cheating on the game. You have been warned.
	vars.EpochExtraQS = 0; // This is used when vars.QuikSaveTime pass after the quiksave. It will register the epoch after the vars.QuikSaveTime and then substract it from the load time. (Hybrid mode).
	vars.ThisIsNOTAFuckingCinematic = false; // 
	vars.fuzzle = 0;
	vars.mudokon = 0;
	vars.egg = 0;
	vars.total = 0;
	vars.fuzzlemax = 0;
	vars.mudokonmax = 0;
	vars.eggmax = 0;
	vars.totalmax = 0;
	vars.fuzzlemem = 0;
	vars.mudokonmem = 0;
	vars.eggmem = 0;
	vars.totalmem = 0;
	vars.totalmem2 = 0;
	vars.fuzzlememlvl = 0;
	vars.mudokonmemlvl = 0;
	vars.eggmemlvl = 0;
	vars.stop = 0;
	vars.stopcount = 0;
	vars.level = 0;
	vars.reset = 0;
	vars.NoMultipleSplits = 0;
	vars.labordone = 0;

	settings.Add("badEnding", false, "Bad Ending");
	settings.SetToolTip("badEnding", "Ends the run on the Bad Ending cutscene at the end of Loading Dock. Ensure that IL mode and Good Ending are disabled!");
	
	settings.Add("hundredPercent", false, "Good Ending");
	settings.SetToolTip("hundredPercent", "Ends the run on the Good Ending cutscene at the end of Vykkers Suites. Ensure that IL mode and Bad Ending are disabled!");
	
	settings.Add("Counters", false, "Counters");
	settings.SetToolTip("Counters", "Displays counters for Fuzzles, Mudokons, Eggs and total number rescued");
	
	settings.Add("ilMode", false, "IL Mode");
	settings.SetToolTip("ilMode", "Enable IL mode. Ensure that both Good Ending and Bad Ending are disabled! Make sure to select the sub-option for the level you want to run.");

	settings.Add("nag", true, "REFRESH RATE OF THE AUTOSPLITTER");
	settings.SetToolTip("nag", "Sets the autosplitter to refresh 30 times per second. Leaving all options unckeched will set refresh rate to 30 by default anyway.");

	//groups content

	settings.CurrentDefaultParent = "nag";
	
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
	
	
	// IL Settings
	
	settings.CurrentDefaultParent = "IL Mode";
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
	
	//Counters automatic display in LiveSplit
	
	vars.SetTextComponent = (Action<string, string>)((id, text) =>
	{
        var textSettings = timer.Layout.Components.Where(x => x.GetType().Name == "TextComponent").Select(x => x.GetType().GetProperty("Settings").GetValue(x, null));
        var textSetting = textSettings.FirstOrDefault(x => (x.GetType().GetProperty("Text1").GetValue(x, null) as string) == id);
        if (textSetting == null){
            var textComponentAssembly = Assembly.LoadFrom("Components\\LiveSplit.Text.dll");
            var textComponent = Activator.CreateInstance(textComponentAssembly.GetType("LiveSplit.UI.Components.TextComponent"), timer);
            timer.Layout.LayoutComponents.Add(new LiveSplit.UI.Components.LayoutComponent("LiveSplit.Text.dll", textComponent as LiveSplit.UI.Components.IComponent));
            textSetting = textComponent.GetType().GetProperty("Settings", BindingFlags.Instance | BindingFlags.Public).GetValue(textComponent, null);
            textSetting.GetType().GetProperty("Text1").SetValue(textSetting, id);
        }
        if (textSetting != null);
            textSetting.GetType().GetProperty("Text2").SetValue(textSetting, text);
	});
}

init
{
	// game startup
	
	version = "v2.12 wjb1114#8967  22-01-22 (Hybrid)";
	
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
	//vars.RTA = "RTA: [" + System.Convert.ToString(timer.CurrentTime.RealTime).Replace("0000", "").Replace("00:", "") + "]";
	//vars.IGT = "IGT: [" + System.Convert.ToString(timer.CurrentTime.GameTime).Replace("0000", "").Replace("00:", "") + "]";
	// Note: for testing/development onnly. Using the debug var viewer WILL invalidate your run!
	vars.debugVars = "levelId: " + current.levelId + " | isLoad: " + current.isLoad + " | gameState: " + current.gameState + " | curLvl: " + vars.curLvl + " | old levelId: " + old.levelId + " | lsi: |" + current.loadScreenIndex + "|";
	//vars.IGTandRTAInline = vars.RTA + " | " + vars.IGT;
	
	vars.RTA = "Real Time = " + TimeSpan.Parse(System.Convert.ToString(timer.CurrentTime.RealTime)).ToString(@"h\:mm\:ss\.fff");
	if (timer.CurrentTime.GameTime != null) {
		vars.IGT = "Loadless Time = " + TimeSpan.Parse(System.Convert.ToString(timer.CurrentTime.GameTime.Value)).ToString(@"h\:mm\:ss\.fff");
	} else {
		vars.IGT = "Loadless Time = N/A";
	}
	
	vars.IGTandRTAInline = vars.RTA + "\n" + vars.IGT;
	
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
	
	//Counters
	
	if(settings["Counters"]){
		vars.SetTextComponent("Fuzzles", (vars.fuzzle).ToString() + " / " + (vars.fuzzlemax).ToString());
		vars.SetTextComponent("Mudokons", (vars.mudokon).ToString() + " / " + (vars.mudokonmax).ToString());
		vars.SetTextComponent("Eggs", (vars.egg).ToString() + " / " + (vars.eggmax).ToString());
		vars.SetTextComponent("Total", (vars.total).ToString() + " / " + (vars.totalmax).ToString());
		return;
	}
	
}

start
{
	bool IStart = false;
	if (settings["ilMode"] == false)
	{
		if (current.lvltimer > old.lvltimer)
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
	if (settings["ilMode"])
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
				if (old.loadScreenIndex == "1" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["fuzzle"])
			{
				if (old.loadScreenIndex == "2" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["hydro"])
			{
				if (old.loadScreenIndex == "3" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["fluoride"])
			{
				if (old.loadScreenIndex == "4" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["snoozie"])
			{
				if (old.loadScreenIndex == "5" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["mudPens"])
			{
				if (old.loadScreenIndex == "6" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["slogOne"])
			{
				if (old.loadScreenIndex == "7" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["fortress"])
			{
				if (old.loadScreenIndex == "8" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["slogTwo"])
			{
				if (old.loadScreenIndex == "9" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["paramite"])
			{
				if (old.loadScreenIndex == "10" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["meep"])
			{
				if (old.loadScreenIndex == "11" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["brewery"])
			{
				if (old.loadScreenIndex == "12" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["fuel"])
			{
				if (old.loadScreenIndex == "13" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["magog"])
			{
				if (old.loadScreenIndex == "14" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["river"])
			{
				if (old.loadScreenIndex == "15" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["noMuds"])
			{
				if (old.loadScreenIndex == "16" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["boiler"])
			{
				if (old.loadScreenIndex == "17" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["splinter"])
			{
				if (old.loadScreenIndex == "18" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["reservoir"])
			{
				if (old.loadScreenIndex == "19" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["scrubPens"])
			{
				if (old.loadScreenIndex == "20" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["flubco"])
			{
				if (old.loadScreenIndex == "21" && current.lvltimer > old.lvltimer)
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
				if (old.loadScreenIndex == "22" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["labor"])
			{
				if (old.loadScreenIndex == "23" && current.lvltimer > old.lvltimer)
				{
					IStart = true;
				}
			}
			else if (settings["vykker"])
			{
				if (old.loadScreenIndex == "24" && current.lvltimer > old.lvltimer)
				{
					vars.vykkerFix = true;
					IStart = true;
				}
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
				vars.fuzzlemem = (current.fuzzle);
				vars.mudokonmem = (current.mudokon);
				vars.eggmem = (current.egg);
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
			if (current.levelId == 1 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["spooce"])
		{
			if (current.levelId == 2 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["fuzzle"])
		{
			if (current.levelId == 3 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["hydro"])
		{
			if (current.levelId == 4 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["fluoride"])
		{
			if (current.levelId == 5 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["snoozie"])
		{
			if (current.levelId == 6 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["mudPens"])
		{
			if (current.levelId == 7 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["slogOne"])
		{
			if (current.levelId == 8 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["fortress"])
		{
			if (current.levelId == 9 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["slogTwo"])
		{
			if (current.levelId == 10 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["paramite"])
		{
			if (current.levelId == 11 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["meep"])
		{
			if (current.levelId == 12 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["brewery"])
		{
			if (current.levelId == 13 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["fuel"])
		{
			if (current.levelId == 14 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["magog"])
		{
			if (current.levelId == 15 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["river"])
		{
			if (current.levelId == 16 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["noMuds"])
		{
			if (current.levelId == 17 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["boiler"])
		{
			if (current.levelId == 18 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["splinter"])
		{
			if (current.levelId == 19 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["reservoir"])
		{
			if (current.levelId == 20 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["scrubPens"])
		{
			if (current.levelId == 21 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["flubco"])
		{
			if (current.levelId == 22 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		else if (settings["dockGood"])
		{
			if (current.levelId == 23 && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		//non-standard split for ending labor egg storage
		else if (settings["labor"])
		{
			if (current.levelId == 23 && current.loadScreenIndex == "24" && vars.NoMultipleSplits == 0)
			{
				vars.NoMultipleSplits++;
				return true;
			}
		}
		// non-standard splits for ending game
		else if (settings["dockBad"])
		{
			
			if ((current.levelId == 22) && (current.gameState == 7) && (old.levelId == 22) && (old.gameState == 0) && vars.NoMultipleSplits == 0)
			{
				if (vars.dockFix == true)
				{
					vars.dockFix = false;
					return false;
				}
				else
				{
					vars.NoMultipleSplits++;
					return true;
				}
			}
		}
		else if (settings["vykker"])
		{
			if (current.levelId == 23 && current.gameState == 7 && old.gameState == 0 && vars.NoMultipleSplits == 0)
			{
				if (vars.vykkerFix == true)
				{
					vars.vykkerFix = false;
					return false;
				}
				else
				{
					vars.NoMultipleSplits++;
					return true;
				}
			}
		}
	}
	//Counters
	
	if(settings["Counters"])
	
	{
		//Fuzzle counters
		
		if(current.fuzzle != old.fuzzle)
		{
			vars.fuzzle = (current.fuzzle);
		}
		
		//Mudokon counters
		
		if(current.loadScreenIndex == "24" || settings["vykker"])
		{
			if(current.mudokon2 != old.mudokon2)
			{
				vars.mudokon = (current.mudokon2);
			}
		}
		
		else if(current.mudokon != old.mudokon)
		{
			vars.mudokon = (current.mudokon);
		}	
		
		
		//Egg counters
		
		if(current.egg != old.egg)
		{
			vars.egg = (current.egg);
		}		
		
		
		//Total
		
		//to prevent weird behavior when entering Vykers Suites
		if(current.levelId == 23 && current.fuzzle == 0 && current.mudokon == 0 && current.egg == 0 && old.fuzzle == 12 && old.mudokon == 14 && old.egg == 36 && vars.labordone == 0)
		{
			vars.fuzzlemem = (old.fuzzle);
			vars.mudokonmem = (old.mudokon);
			vars.eggmem = (old.egg);
			vars.labordone++;
		}
		
		if(current.lvltimer < 5 && vars.stop == 0)
		{
			vars.fuzzlemax = (current.fuzzlelvl);
			vars.mudokonmax = (current.mudokonlvl);
			vars.eggmax = (current.egglvl);
			vars.totalmax = ((vars.totalmax) + (vars.fuzzlemax) + (vars.mudokonmax) + (vars.eggmax));
			vars.stop++;
		}
		if(current.lvltimer > 5 && vars.stop == 1)
		{
			vars.stop--;
		}
		
		if(current.lvltimer > 5 && vars.level == current.levelId && current.lvltimer != old.lvltimer)
		{
			vars.level++;
		}
		
		if(current.lvltimer < 5 && vars.stopcount == 0)
		{
			vars.stopcount++;
			vars.totalmem2 = ((vars.fuzzlemem) + (vars.mudokonmem) + (vars.eggmem));
			vars.totalmem = ((vars.totalmem) + (vars.totalmem2));
		}
		
		if(current.lvltimer > old.lvltimer)
		{
			vars.total = ((vars.totalmem) + (vars.fuzzle) + (vars.mudokon) + (vars.egg));
		}
		
		if(current.lvltimer > 5 && vars.stopcount == 1)
		{
			vars.stopcount--;
		}
	}	
}



isLoading
{	
	if(current.lvltimer == old.lvltimer && current.gameState != 5 && current.gameState != 11 && current.gameState != 12 && current.gameState != 14 && current.gameState != 15 && current.gameState != 9 && current.gameState != 6 && current.gameState != 10){
		return true;
	}
	
	else {
	return false;
	}
}

reset
{
	if (settings["ilMode"] == false)
	{
		if (vars.gameCrashed == true || vars.raisinFix == true && current.lvltimer < 0.5)
		{
			return false;
		}
		else if(current.levelId == 0 && current.gameState == 13)
		{
			vars.fuzzlemax = 0;
			vars.mudokonmax = 0;
			vars.eggmax = 0;
			vars.fuzzle = 0;
			vars.mudokon = 0;
			vars.egg = 0;
			vars.totalmax = 0;
			vars.fuzzlemem = 0;
			vars.mudokonmem = 0;
			vars.eggmem = 0;
			vars.fuzzlememlvl = 0;
			vars.eggmemlvl = 0;
			vars.total = 0;
			vars.totalmem = 0;
			vars.totalmem2 = 0;
			vars.stop = 0;
			vars.stopcount = 0;
			vars.level = 0;
			vars.reset = 0;
			vars.curLvl = -1;
			vars.NoMultipleSplits = 0;
			vars.labordone = 0;
			return true;
		}
	}
	else
	{
		if (vars.gameCrashed == true)
		{
			return false;
		}
		else if(current.gameState == 9 && vars.reset == 0 || current.gameState == 10)
		{
			vars.reset = 1;
		}
			if(vars.reset == 1 && current.lvltimer < 5)
		{
			vars.fuzzlemax = 0;
			vars.mudokonmax = 0;
			vars.eggmax = 0;
			vars.fuzzle = 0;
			vars.mudokon = 0;
			vars.egg = 0;
			vars.totalmax = 0;
			vars.fuzzlemem = 0;
			vars.mudokonmem = 0;
			vars.eggmem = 0;
			vars.fuzzlememlvl = 0;
			vars.eggmemlvl = 0;
			vars.total = 0;
			vars.totalmem = 0;
			vars.totalmem2 = 0;
			vars.stop = 0;
			vars.reset = 0;
			vars.stopcount = 0;
			vars.level = 0;
			vars.curLvl = -1;
			vars.NoMultipleSplits = 0;
			vars.labordone = 0;
			return true;
		}
	}
}
