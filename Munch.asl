state("Munch", "v4.0.0 19-05-2026 wjb1114#8967, LegnaX#7777 and Fxyz")
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
	byte Entity1 : 0x358450, 0x14, 0x0, 0x140, 0x90, 0x58, 0xC, 0x70;
	byte Entity2 : 0x358450, 0x1C, 0x0, 0x140, 0x90, 0x58, 0xC, 0x70;
	byte Entity3 : 0x358450, 0x24, 0x0, 0x140, 0x90, 0x58, 0xC, 0x70;
	byte Entity4 : 0x358450, 0x2C, 0x0, 0x140, 0x90, 0x58, 0xC, 0x70;
	byte Entity5 : 0x358450, 0x4C, 0x0, 0x140, 0x90, 0x58, 0xC, 0x70;	//this one for both A Bittersweet reunion & Archers at Dawn
	byte Entity6 : 0x358450, 0x12C, 0x0, 0x140, 0x90, 0x58, 0xC, 0x70;
	byte Entity7 : 0x358450, 0x134, 0x0, 0x140, 0x90, 0x58, 0xC, 0x70;
	byte Entity8 : 0x358450, 0x13C, 0x0, 0x140, 0x90, 0x58, 0xC, 0x70;
	byte Entity9 : 0x358450, 0x1EC, 0x0, 0x140, 0x90, 0x58, 0xC, 0x70;
	byte Entity10 : 0x358450, 0x3C, 0x0, 0x140, 0x90, 0x58, 0xC, 0x70;
	byte Entity11 : 0x358450, 0x44, 0x0, 0x140, 0x90, 0x58, 0xC, 0x70;
	byte Entity12 : 0x358450, 0x54, 0x0, 0x140, 0x90, 0x58, 0xC, 0x70;
	byte Entity13 : 0x358450, 0x5C, 0x0, 0x140, 0x90, 0x58, 0xC, 0x70;
	byte Entity14 : 0x358450, 0x64, 0x0, 0x140, 0x90, 0x58, 0xC, 0x70;
	byte Entity15 : 0x358450, 0x6C, 0x0, 0x140, 0x90, 0x58, 0xC, 0x70;
	byte Entity16 : 0x358450, 0x74, 0x0, 0x140, 0x90, 0x58, 0xC, 0x70;
	float Entity10HPmax : 0x358450, 0x3C, 0x0, 0x140, 0x38;				//HP: Natives: 1000 Tomahawkers: 1200 Mudarchers: 1100
	float Entity11HPmax : 0x358450, 0x44, 0x0, 0x140, 0x38;
	float Entity12HPmax : 0x358450, 0x54, 0x0, 0x140, 0x38;
	float Entity13HPmax : 0x358450, 0x5C, 0x0, 0x140, 0x38;
	float Entity14HPmax : 0x358450, 0x64, 0x0, 0x140, 0x38;
	float Entity15HPmax : 0x358450, 0x6C, 0x0, 0x140, 0x38;
	float Entity16HPmax : 0x358450, 0x74, 0x0, 0x140, 0x38;
	float Entity5HPmax : 0x358450, 0x4C, 0x0, 0x140, 0x38;
	float BroHP : 0x358450, 0x39C, 0x0, 0x140, 0x30;
	byte BroStatus : 0x358450, 0x39C, 0x0, 0x140, 0x90, 0x58, 0xC, 0x70;	//17 if asleep
	double lvltimer : 0x356CF8, 0x1C;
	short mudarchers : 0x78CF8, 0x94;
	int spooce : 0x360E2C;
	int mine : 0x34D9D4;
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
	vars.reset = 0;
	vars.NoMultipleSplits = 0;
	vars.labordone = 0;
	vars.NGplus = 0;
	vars.spooce = 0;
	vars.Entity1 = 0;
	vars.Entity2 = 0;
	vars.Entity3 = 0;
	vars.Entity4 = 0;
	vars.Entity5 = 0;
	vars.Entity6 = 0;
	vars.Entity7 = 0;
	vars.Entity8 = 0;
	vars.Entity9 = 0;
	vars.Entity10 = 0;
	vars.Entity11 = 0;
	vars.Entity12 = 0;
	vars.Entity13 = 0;
	vars.Entity14 = 0;
	vars.Entity15 = 0;
	vars.Entity16 = 0;
	vars.spooceshrubMuds = 0;
	vars.mudarchers = 0;
	vars.mudokonAchievement = 0;
	vars.TotalAchievementsCounter = 0;
	vars.LastAchievementUnlocked = "";
	vars.LeavetheCave = "Missing";
	vars.SpoocedOut = "Missing";
	vars.FuzzleTestSuccess = "Missing";
	vars.Vatlldoit = "Missing";
	vars.FluorideTanks = "Missing";
	vars.Dontsnoozeonthejob = "Missing";
	vars.Onlybloodisdrawnfromthesepens = "Missing";
	vars.Toomucheathformyliking = "Missing";
	vars.EscapetheFortress = "Missing";
	vars.SloghutSurvivor = "Missing";
	vars.Runner = "Missing";
	vars.MeepHarder = "Missing";
	vars.BrewersYeesh = "Missing";
	vars.AllFueledUp = "Missing";
	vars.DrivenCrazy = "Missing";
	vars.CrymeaRiver = "Missing";
	vars.AMuddyEscape = "Missing";
	vars.AnnoyingBoils = "Missing";
	vars.Luluwillbepleased = "Missing";
	vars.ReservedRow = "Missing";
	vars.IdontwantnoScrubs = "Missing";
	vars.Theshareholderswillbeunhappy = "Missing";
	vars.DonewithDocking = "Missing";
	vars.GreatEggscape = "Missing";
	vars.Suiteness = "Missing";
	vars.Spoocey = "Missing";
	vars.VerySpoocey = "Missing";
	vars.SuperSpoocey = "Missing";
	vars.UltraSpoocey = "Missing";
	vars.Demonic = "Missing";
	vars.WheelieSelfish = "Missing";
	vars.Zenandtheartofwheelchairmaintenance = "Missing";
	vars.RidingHigh = "Missing";
	vars.NotMine = "Missing";
	vars.Abittersweetreunion = "Missing";
	vars.ArchersatDawn = "Missing";
	vars.WereFreeeeeee = "Missing";
	vars.APeacefulDeath = "Missing";

	settings.Add("badEnding", false, "Bad Ending");
	settings.SetToolTip("badEnding", "Ends the run on the Bad Ending cutscene at the end of Loading Dock. Ensure that IL mode, Good Ending and All Achievements are disabled!");
	
	settings.Add("hundredPercent", false, "Good Ending");
	settings.SetToolTip("hundredPercent", "Ends the run on the Good Ending cutscene at the end of Vykkers Suites. Ensure that IL mode, Bad Ending and All Achievements are disabled!");
	
	settings.Add("AllAchievements", false, "All Achievements");
	settings.SetToolTip("AllAchievements", "Ends the run on the Quarma screen at the end of Vykkers Suites. Ensure that IL mode, Bad Ending and Good Ending are disabled!");
	
	settings.Add("Counters", false, "Counters");
	settings.SetToolTip("Counters", "Displays counters for 100% and All Achievements categories");
	
	settings.Add("ilMode", false, "IL Mode");
	settings.SetToolTip("ilMode", "Enable IL mode. Ensure that both Good Ending and Bad Ending are disabled! Make sure to select the sub-option for the level you want to run.");

	settings.Add("nag", true, "REFRESH RATE OF THE AUTOSPLITTER");
	settings.SetToolTip("nag", "Sets the autosplitter to refresh 30 times per second. Leaving all options unckeched will set refresh rate to 30 by default anyway.");

	//Counters
	
	settings.CurrentDefaultParent = "Counters";
	
	settings.Add("100Counters", false, "100% Counters");
	settings.SetToolTip("100Counters", "Displays counters for Fuzzles, Mudokons, Eggs and total number rescued for the 100% category");
	
	settings.Add("AllAchievementsTrackers", false, "All Achievements Trackers");
	settings.SetToolTip("AllAchievementsTrackers", "Displays trackers for the All Achievements category");
	
	settings.CurrentDefaultParent = "100Counters";
	
	settings.Add("FuzzleCounter", false, "Fuzzle Counter");
	settings.SetToolTip("FuzzleCounter", "Displays a Fuzzle counter");
	
	settings.Add("MudokonCounter", false, "Mudokon Counter");
	settings.SetToolTip("MudokonCounter", "Displays a Mudokon counter");
	
	settings.Add("EggCounter", false, "Egg Counter");
	settings.SetToolTip("EggCounter", "Displays an Egg counter");
	
	settings.Add("TotalCounter", false, "Total Counter");
	settings.SetToolTip("TotalCounter", "Displays a counter of the total Fuzzles, Mudokons and Eggs already saved so far in the run");
	
	settings.CurrentDefaultParent = "AllAchievementsTrackers";
	
	settings.Add("TotalAchievementsCounter", false, "Total Achievements Counter");
	settings.SetToolTip("TotalAchievementsCounter", "Displays a counter of achievements unlocked");
	
	settings.Add("LastAchievementUnlocked", false, "Last Achievement Unlocked");
	settings.SetToolTip("LastAchievementUnlocked", "Displays the name of that last achievement unlocked");
	
	settings.Add("AchievementsList", false, "Achievements List");
	settings.SetToolTip("AchievementsList", "Displays a list of every achievements and their current status");

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
	
	// Note: for testing/development only. Using the debug var viewer WILL invalidate your run!
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
	
	if(settings["FuzzleCounter"])
	{
		vars.SetTextComponent("Fuzzles", (vars.fuzzle).ToString() + " / " + (vars.fuzzlemax).ToString());
	}
	
	if(settings["MudokonCounter"])
	{
		vars.SetTextComponent("Mudokons", (vars.mudokon).ToString() + " / " + (vars.mudokonmax).ToString());
	}	
	
	if(settings["EggCounter"])
	{
		vars.SetTextComponent("Eggs", (vars.egg).ToString() + " / " + (vars.eggmax).ToString());
	}	
	
	if(settings["TotalCounter"])
	{	
		vars.SetTextComponent("Total", (vars.total).ToString() + " / " + (vars.totalmax).ToString());
	}
	
	if(settings["TotalAchievementsCounter"])
	{
		vars.SetTextComponent("Achievements Unlocked", (vars.TotalAchievementsCounter).ToString() + " / " + "38");
	}
	
	if(settings["LastAchievementUnlocked"])
	{
		vars.SetTextComponent("Last Achievement Unlocked", (vars.LastAchievementUnlocked).ToString());
	}
	
	if(settings["AchievementsList"])
	{
		vars.SetTextComponent("Leave the Cave.", (vars.LeavetheCave).ToString());
		vars.SetTextComponent("Spooced Out", (vars.SpoocedOut).ToString());
		vars.SetTextComponent("Fuzzle Test Success!", (vars.FuzzleTestSuccess).ToString());
		vars.SetTextComponent("Vat'll do it!", (vars.Vatlldoit).ToString());
		vars.SetTextComponent("Fluoride Tanks", (vars.FluorideTanks).ToString());
		vars.SetTextComponent("Don't snooze on the job", (vars.Dontsnoozeonthejob).ToString());
		vars.SetTextComponent("Only blood is drawn from these pens...", (vars.Onlybloodisdrawnfromthesepens).ToString());
		vars.SetTextComponent("Too much death for my liking...", (vars.Toomucheathformyliking).ToString());
		vars.SetTextComponent("Escape the Fortress", (vars.EscapetheFortress).ToString());
		vars.SetTextComponent("Sloghut Survivor", (vars.SloghutSurvivor).ToString());
		vars.SetTextComponent("Runner", (vars.Runner).ToString());
		vars.SetTextComponent("Meep Harder", (vars.MeepHarder).ToString());
		vars.SetTextComponent("Brewer's Yeesh", (vars.BrewersYeesh).ToString());
		vars.SetTextComponent("All Fueled Up", (vars.AllFueledUp).ToString());
		vars.SetTextComponent("Driven Crazy", (vars.DrivenCrazy).ToString());
		vars.SetTextComponent("Cry me a River", (vars.CrymeaRiver).ToString());
		vars.SetTextComponent("A Muddy Escape", (vars.AMuddyEscape).ToString());
		vars.SetTextComponent("Annoying Boils", (vars.AnnoyingBoils).ToString());
		vars.SetTextComponent("Lulu will be pleased", (vars.Luluwillbepleased).ToString());
		vars.SetTextComponent("Reserved Row", (vars.ReservedRow).ToString());
		vars.SetTextComponent("I don't want no Scrubs...", (vars.IdontwantnoScrubs).ToString());
		vars.SetTextComponent("The shareholders will be unhappy", (vars.Theshareholderswillbeunhappy).ToString());
		vars.SetTextComponent("Done with Docking", (vars.DonewithDocking).ToString());
		vars.SetTextComponent("Great Egg-scape", (vars.GreatEggscape).ToString());
		vars.SetTextComponent("Suite-ness", (vars.Suiteness).ToString());
		vars.SetTextComponent("Spoocey!", (vars.Spoocey).ToString());
		vars.SetTextComponent("Very Spoocey!", (vars.VerySpoocey).ToString());
		vars.SetTextComponent("Super Spoocey!", (vars.SuperSpoocey).ToString());
		vars.SetTextComponent("Ultra Spoocey!", (vars.UltraSpoocey).ToString());
		vars.SetTextComponent("Demonic", (vars.Demonic).ToString());
		vars.SetTextComponent("Wheelie Selfish", (vars.WheelieSelfish).ToString());
		vars.SetTextComponent("Zen and the art of wheelchair maintenance", (vars.Zenandtheartofwheelchairmaintenance).ToString());
		vars.SetTextComponent("Riding High", (vars.RidingHigh).ToString());
		vars.SetTextComponent("Not Mine", (vars.NotMine).ToString());
		vars.SetTextComponent("A bittersweet reunion?", (vars.Abittersweetreunion).ToString());
		vars.SetTextComponent("Archers at Dawn", (vars.ArchersatDawn).ToString());
		vars.SetTextComponent("We're Freeeeeee!", (vars.WereFreeeeeee).ToString());
		vars.SetTextComponent("A Peaceful Death", (vars.APeacefulDeath).ToString());
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
		
		//All Achievements
		
		//Any% Part
		
		else if(settings["AllAchievements"] && vars.NGplus == 0)
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
				vars.fuzzlemem = (current.fuzzle);
				vars.mudokonmem = (current.mudokon);
				vars.eggmem = (current.egg);
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
					vars.NGplus++;
					return true;
				}
			}
		}
		
		//100% Part
		
		if(settings["AllAchievements"] && vars.NGplus != 0)
		{
			if(current.lvltimer < 5 && vars.NGplus == 1)
			{
				vars.curLvl = current.levelId;
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
				vars.reset = 0;
				vars.curLvl = -1;
				vars.NoMultipleSplits = 0;
				vars.labordone = 0;
				vars.spooceshrubMuds = 0;
				vars.mudarchers = 0;
				vars.NGplus++;
			}
		
			else if((current.levelId == (old.levelId + 1) || (current.levelId > old.levelId && old.levelId == 0 && vars.curLvl == (current.levelId - 1))) && vars.curLvl <= 23)
			{
				print("Standard split");
			
				if (vars.raisinFix == true)
				{
					vars.raisinFix = false;
				}
				
				if (current.levelId == 19)
				{
					vars.executiveFix = true;
				}
			
				vars.curLvl = (current.levelId + 2);
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
			}
			else if (vars.curLvl == 25 && vars.TotalAchievementsCounter == 38)
			{
				vars.curLvl = 26;
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
		//Fuzzle counter
		
		if(current.fuzzle != old.fuzzle)
		{
			vars.fuzzle = (current.fuzzle);
		}
		
		//Mudokon counter
		
		if(current.loadScreenIndex == "24" || settings["vykker"])
		{
			if(current.mudarchers != old.mudarchers)
			{
				vars.mudokon = (current.mudarchers);
			}
		}
		
		else if(current.mudokon != old.mudokon)
		{
			vars.mudokon = (current.mudokon);
		}	
		
		
		//Egg counter
		
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
		if(current.lvltimer > 5 && vars.stop == 1 || current.levelId == (old.levelId + 1) && vars.stop == 1)
		{
			vars.stop--;
		}
		
		if(current.lvltimer < 5 && vars.stopcount == 0)
		{
			vars.stopcount++;
			vars.totalmem2 = ((vars.fuzzlemem) + (vars.mudokonmem) + (vars.eggmem));
			vars.totalmem = ((vars.totalmem) + (vars.totalmem2));
			vars.mudokonAchievement = ((vars.mudokonAchievement) + (vars.mudokonmem));
		}
		
		if(current.lvltimer > old.lvltimer)
		{
			vars.total = ((vars.totalmem) + (vars.fuzzle) + (vars.mudokon) + (vars.egg));
		}
		
		if(current.lvltimer > 5 && vars.stopcount == 1 || current.levelId == (old.levelId + 1) && vars.stopcount == 1)
		{
			vars.stopcount--;
		}
	}
	
	//All Achievements
	
	{
	//Spooce
		
		if(current.spooce == (old.spooce +1))
		{
			vars.spooce++;
		}
		
		//Spoocey!
		
		if(vars.spooce == 1 && vars.Spoocey == "Missing")
		{
			vars.Spoocey = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Spoocey!";
		}
		
		//Very Spoocey!
		
		if(vars.spooce == 250 && vars.VerySpoocey == "Missing")
		{
			vars.VerySpoocey = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Very Spoocey!";
		}
		
		//Super Spoocey!
		
		if(vars.spooce == 600 && vars.SuperSpoocey == "Missing")
		{
			vars.SuperSpoocey = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Super Spoocey!";
		}
		
		//Ultra Spoocey!
		
		if(vars.spooce == 1250 && vars.UltraSpoocey == "Missing")
		{
			vars.UltraSpoocey = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Ultra Spoocey!";
		}
		
		
	//End of Levels
	
		//Leave the Cave.
		
		if(current.levelId == 1 && vars.LeavetheCave == "Missing")
		{
			vars.LeavetheCave = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Leave the Cave.";
		}
		
		//Spooced Out
		
		if(current.levelId == 2 && vars.SpoocedOut == "Missing")
		{
			vars.SpoocedOut = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Spooced Out";
		}
		
		//Fuzzle Test Success!
		
		if(current.levelId == 3 && vars.FuzzleTestSuccess == "Missing")
		{
			vars.FuzzleTestSuccess = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Fuzzle Test Success!";
		}
		
		//Vat'll do it!
		
		if(current.levelId == 4 && vars.Vatlldoit == "Missing")
		{
			vars.Vatlldoit = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Vat'll do it!";
		}
		
		//Fluoride Tanks
		
		if(current.levelId == 5 && vars.FluorideTanks == "Missing")
		{
			vars.FluorideTanks = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Fluoride Tanks";
		}
		
		//Don't snooze on the job
		
		if(current.levelId == 6 && vars.Dontsnoozeonthejob == "Missing")
		{
			vars.Dontsnoozeonthejob = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Don't snooze on the job";
		}
		
		//Only blood is drawn from these pens...
		
		if(current.levelId == 7 && vars.Onlybloodisdrawnfromthesepens == "Missing")
		{
			vars.Onlybloodisdrawnfromthesepens = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Only blood is drawn from these pens...";
		}
		
		//Too much death for my liking...
		
		if(current.levelId == 8 && vars.Toomucheathformyliking == "Missing")
		{
			vars.Toomucheathformyliking = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Too much death for my liking...";
		}
		
		//Escape the Fortress
		
		if(current.levelId == 9 && vars.EscapetheFortress == "Missing")
		{
			vars.EscapetheFortress = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Escape the Fortress";
		}
		
		//Sloghut Survivor
		
		if(current.levelId == 10 && vars.SloghutSurvivor == "Missing")
		{
			vars.SloghutSurvivor = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Sloghut Survivor";
		}
		
		//Runner
		
		if(current.levelId == 11 && vars.Runner == "Missing")
		{
			vars.Runner = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Runner";
		}
		
		//Meep Harder
		
		if(current.levelId == 12 && vars.MeepHarder == "Missing")
		{
			vars.MeepHarder = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Meep Harder";
		}
		
		//Brewer's Yeesh
		
		if(current.levelId == 13 && vars.BrewersYeesh == "Missing")
		{
			vars.BrewersYeesh = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Brewer's Yeesh";
		}
		
		//All Fueled Up
		
		if(current.levelId == 14 && vars.AllFueledUp == "Missing")
		{
			vars.AllFueledUp = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "All Fueled Up";
		}
		
		//Driven Crazy
		
		if(current.levelId == 15 && vars.DrivenCrazy == "Missing")
		{
			vars.DrivenCrazy = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Driven Crazy";
		}
		
		//Cry me a River
		
		if(current.levelId == 16 && vars.CrymeaRiver == "Missing")
		{
			vars.CrymeaRiver = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Cry me a River";
		}
		
		//A Muddy Escape
		
		if(current.levelId == 17 && vars.AMuddyEscape == "Missing")
		{
			vars.AMuddyEscape = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "A Muddy Escape";
		}
		
		//Annoying Boils
		
		if(current.levelId == 18 && vars.AnnoyingBoils == "Missing")
		{
			vars.AnnoyingBoils = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Annoying Boils";
		}
		
		//Lulu will be pleased
		
		if(current.levelId == 19 && vars.Luluwillbepleased == "Missing")
		{
			vars.Luluwillbepleased = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Lulu will be pleased";
		}
		
		//Reserved Row
		
		if(current.levelId == 20 && vars.ReservedRow == "Missing")
		{
			vars.ReservedRow = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Reserved Row";
		}
		
		//I don't want no Scrubs...
		
		if(current.levelId == 21 && vars.IdontwantnoScrubs == "Missing")
		{
			vars.IdontwantnoScrubs = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "I don't want no Scrubs...";
		}
		
		//The shareholders will be unhappy
		
		if(current.levelId == 22 && vars.Theshareholderswillbeunhappy == "Missing")
		{
			vars.Theshareholderswillbeunhappy = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "The shareholders will be unhappy";
		}
		
		//Done with Docking
		
		if(vars.curLvl == 23 && vars.DonewithDocking == "Missing")
		{
			vars.DonewithDocking = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Done with Docking";
		}
		
		//Great Egg-scape
		
		if(vars.curLvl == 24 && vars.GreatEggscape == "Missing")
		{
			vars.GreatEggscape = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Great Egg-scape";
		}
		
		//Suite-ness
		
		if(vars.curLvl == 25 && vars.Suiteness == "Missing")
		{
			vars.Suiteness = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Suite-ness";
		}
		
	//Quarma
		
		//Demonic
		
		if(current.gameState == 11 && vars.executiveFix == false && current.levelId == 22 && vars.Demonic == "Missing")
		{
			vars.Demonic = "Done";
			vars.TotalAchievementsCounter++;
			vars.WheelieSelfish = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Demonic";
		}
		
		//Wheelie Selfish
		
		if(current.gameState == 9 && vars.executiveFix == false && current.levelId == 22 && vars.WheelieSelfish == "Missing")
		{
			vars.WheelieSelfish = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Wheelie Selfish";
		}
		
		//Riding High
		
		if(vars.curLvl == 25 && current.gameState == 13 && vars.RidingHigh == "Missing")
		{
			vars.RidingHigh = "Done";
			vars.TotalAchievementsCounter++;
			vars.Zenandtheartofwheelchairmaintenance = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Riding High";
		}
		
		//Zen and the art of wheelchair maintenance
		
		if(vars.curLvl == 25 && current.gameState == 10 && vars.Zenandtheartofwheelchairmaintenance == "Missing")
		{
			vars.Zenandtheartofwheelchairmaintenance = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Zen and the art of wheelchair maintenance";
		}
		
	//Challenges
		
		//Not Mine
		
		if(current.levelId == 5 && current.mine == 0 && vars.NotMine == "Missing")
		{
			vars.NotMine = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "Not Mine";
		}
		
		//We're Freeeeeee
		
		if(vars.mudokonAchievement >= 119 && vars.curLvl == 25 && vars.WereFreeeeeee == "Missing")
		{
			vars.WereFreeeeeee = "Done";
			vars.TotalAchievementsCounter++;
			vars.LastAchievementUnlocked = "We're Freeeeeee!";
		}
		
		//A bittersweet reunion?
		
		if(vars.Abittersweetreunion == "Missing" && current.levelId == 1)
		{
			//Entity 1
			if(current.Entity1 == 17 && vars.Entity1 == 0)
			{
				vars.Entity1++;
			}
			
			if(vars.Entity1 == 1 && current.Entity1 == 7)
			{
				vars.spooceshrubMuds++;
				vars.Entity1 = current.lvltimer;
			}
			
			if(vars.Entity1 > current.lvltimer)
			{
				vars.Entity1 = 0;
			}
			
			//Entity 2
			if(current.Entity2 == 17 && vars.Entity2 == 0)
			{
				vars.Entity2++;
			}
			
			if(vars.Entity2 == 1 && current.Entity2 == 7)
			{
				vars.spooceshrubMuds++;
				vars.Entity2 = current.lvltimer;
			}
			
			if(vars.Entity2 > current.lvltimer)
			{
				vars.Entity2 = 0;
			}
			
			//Entity 3
			if(current.Entity3 == 17 && vars.Entity3 == 0)
			{
				vars.Entity3++;
			}
			
			if(vars.Entity3 == 1 && current.Entity3 == 7)
			{
				vars.spooceshrubMuds++;
				vars.Entity3 = current.lvltimer;
			}
			
			if(vars.Entity3 > current.lvltimer)
			{
				vars.Entity3 = 0;
			}
			
			//Entity 4
			if(current.Entity4 == 17 && vars.Entity4 == 0)
			{
				vars.Entity4++;
			}
			
			if(vars.Entity4 == 1 && current.Entity4 == 7)
			{
				vars.spooceshrubMuds++;
				vars.Entity4 = current.lvltimer;
			}
			
			if(vars.Entity4 > current.lvltimer)
			{
				vars.Entity4 = 0;
			}
			
			//Entity 5
			if(current.Entity5 == 17 && vars.Entity5 == 0)
			{
				vars.Entity5++;
			}
			
			if(vars.Entity5 == 1 && current.Entity5 == 7)
			{
				vars.spooceshrubMuds++;
				vars.Entity5 = current.lvltimer;
			}
			
			if(vars.Entity5 > current.lvltimer)
			{
				vars.Entity5 = 0;
			}
			
			//Entity 6
			if(current.Entity6 == 17 && vars.Entity6 == 0)
			{
				vars.Entity6++;
			}
			
			if(vars.Entity6 == 1 && current.Entity6 == 7)
			{
				vars.spooceshrubMuds++;
				vars.Entity6 = current.lvltimer;
			}
			
			if(vars.Entity6 > current.lvltimer)
			{
				vars.Entity6 = 0;
			}
			
			//Entity 7
			if(current.Entity7 == 17 && vars.Entity7 == 0)
			{
				vars.Entity7++;
			}
			
			if(vars.Entity7 == 1 && current.Entity7 == 7)
			{
				vars.spooceshrubMuds++;
				vars.Entity7 = current.lvltimer;
			}
			
			if(vars.Entity7 > current.lvltimer)
			{
				vars.Entity7 = 0;
			}
			
			//Entity 8
			if(current.Entity8 == 17 && vars.Entity8 == 0)
			{
				vars.Entity8++;
			}
			
			if(vars.Entity8 == 1 && current.Entity8 == 7)
			{
				vars.spooceshrubMuds++;
				vars.Entity8 = current.lvltimer;
			}
			
			if(vars.Entity8 > current.lvltimer)
			{
				vars.Entity8 = 0;
			}
			
			//Entity 9
			if(current.Entity9 == 17 && vars.Entity9 == 0)
			{
				vars.Entity9++;
			}
			if(vars.Entity9 == 1 && current.Entity9 == 7)
			{
				vars.spooceshrubMuds++;
				vars.Entity9 = current.lvltimer;
			}
			
			if(vars.Entity9 > current.lvltimer)
			{
				vars.Entity9 = 0;
			}
			
			//Total
			
			if(vars.spooceshrubMuds == 9)
			{
				vars.Abittersweetreunion = "Done";
				vars.TotalAchievementsCounter++;
				vars.LastAchievementUnlocked = "A bittersweet reunion?";
				vars.Entity5 = 0;
			}
		}
		
		//Archers at Dawn
		
		if(current.levelId == 15 && vars.ArchersatDawn == "Missing")
		{
			//Entity 10
			if(current.Entity10HPmax == 1100)
			{
				if(current.Entity10 == 17 && vars.Entity10 == 0)
				{
					vars.Entity10++;
				}
				
				if(vars.Entity10 == 1 && current.Entity10 == 7)
				{
					vars.mudarchers++;
					vars.Entity10 = current.lvltimer;
				}
				
				if(vars.Entity10 > current.lvltimer)
				{
					vars.Entity10 = 0;
				}
			}
			
			//Entity 11
			if(current.Entity11HPmax == 1100)
			{
				if(current.Entity11 == 17 && vars.Entity11 == 0)
				{
					vars.Entity11++;
				}
				
				if(vars.Entity11 == 1 && current.Entity11 == 7)
				{
					vars.mudarchers++;
					vars.Entity11 = current.lvltimer;
				}
				
				if(vars.Entity11 > current.lvltimer)
				{
					vars.Entity11 = 0;
				}
			}
			
			//Entity 12
			if(current.Entity12HPmax == 1100)
			{
				if(current.Entity12 == 17 && vars.Entity12 == 0)
				{
					vars.Entity12++;
				}
				
				if(vars.Entity12 == 1 && current.Entity12 == 7)
				{
					vars.mudarchers++;
					vars.Entity12 = current.lvltimer;
				}
				
				if(vars.Entity12 > current.lvltimer)
				{
					vars.Entity12 = 0;
				}
			}
			
			//Entity 13
			if(current.Entity13HPmax == 1100)
			{
				if(current.Entity13 == 17 && vars.Entity13 == 0)
				{
					vars.Entity13++;
				}
				
				if(vars.Entity13 == 1 && current.Entity13 == 7)
				{
					vars.mudarchers++;
					vars.Entity13 = current.lvltimer;
				}
				
				if(vars.Entity13 > current.lvltimer)
				{
					vars.Entity13 = 0;
				}
			}
			
			//Entity 14
			if(current.Entity14HPmax == 1100)
			{
				if(current.Entity14 == 17 && vars.Entity14 == 0)
				{
					vars.Entity14++;
				}
				
				if(vars.Entity14 == 1 && current.Entity14 == 7)
				{
					vars.mudarchers++;
					vars.Entity14 = current.lvltimer;
				}
				
				if(vars.Entity14 > current.lvltimer)
				{
					vars.Entity14 = 0;
				}
			}
			
			//Entity 15
			if(current.Entity15HPmax == 1100)
			{
				if(current.Entity15 == 17 && vars.Entity15 == 0)
				{
					vars.Entity15++;
				}
				
				if(vars.Entity15 == 1 && current.Entity15 == 7)
				{
					vars.mudarchers++;
					vars.Entity15 = current.lvltimer;
				}
				
				if(vars.Entity15 > current.lvltimer)
				{
					vars.Entity15 = 0;
				}
			}
			
			//Entity 16
			if(current.Entity16HPmax == 1100)
			{
				if(current.Entity16 == 17 && vars.Entity16 == 0)
				{
					vars.Entity16++;
				}
				
				if(vars.Entity16 == 1 && current.Entity16 == 7)
				{
					vars.mudarchers++;
					vars.Entity16 = current.lvltimer;
				}
				
				if(vars.Entity16 > current.lvltimer)
				{
					vars.Entity16 = 0;
				}
			}
			
			//Entity 5
			if(current.Entity5HPmax == 1100)
			{
				if(current.Entity5 == 17 && vars.Entity5 == 0)
				{
					vars.Entity5++;
				}
				
				if(vars.Entity5 == 1 && current.Entity5 == 7)
				{
					vars.mudarchers++;
					vars.Entity5 = current.lvltimer;
				}
				
				if(vars.Entity5 > current.lvltimer)
				{
					vars.Entity5 = 0;
				}
			}
			
			//Total
			
			if(vars.mudarchers == 8)
			{
				vars.ArchersatDawn = "Done";
				vars.TotalAchievementsCounter++;
				vars.LastAchievementUnlocked = "Archers at Dawn";
			}
		}
		
		//A Peaceful Death
		
		if(current.levelId == 18 && current.BroHP == 0 && current.BroStatus == 17 && vars.APeacefulDeath == "Missing")
		{
				vars.APeacefulDeath = "Done";
				vars.TotalAchievementsCounter++;
				vars.LastAchievementUnlocked = "A Peaceful Death";
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
		if (vars.gameCrashed == true || vars.raisinFix == true && current.lvltimer < 0.5 || settings["AllAchievements"] && vars.NGplus == 1)
		{
			return false;
		}
		
		else if(current.levelId == 0 && current.gameState == 13 && old.gameState == 17 || current.levelId == 0 && current.gameState == 13 && old.gameState == 10)
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
			vars.reset = 0;
			vars.curLvl = -1;
			vars.NoMultipleSplits = 0;
			vars.labordone = 0;
			vars.NGplus = 0;
			vars.spooce = 0;
			vars.spooceshrubMuds = 0;
			vars.Entity1 = 0;
			vars.Entity2 = 0;
			vars.Entity3 = 0;
			vars.Entity4 = 0;
			vars.Entity5 = 0;
			vars.Entity6 = 0;
			vars.Entity7 = 0;
			vars.Entity8 = 0;
			vars.Entity9 = 0;
			vars.Entity10 = 0;
			vars.Entity11 = 0;
			vars.Entity12 = 0;
			vars.Entity13 = 0;
			vars.Entity14 = 0;
			vars.Entity15 = 0;
			vars.Entity16 = 0;
			vars.mudarchers = 0;
			vars.mudokonAchievement = 0;
			vars.TotalAchievementsCounter = 0;
			vars.LastAchievementUnlocked = "";
			vars.LeavetheCave = "Missing";
			vars.SpoocedOut = "Missing";
			vars.FuzzleTestSuccess = "Missing";
			vars.Vatlldoit = "Missing";
			vars.FluorideTanks = "Missing";
			vars.Dontsnoozeonthejob = "Missing";
			vars.Onlybloodisdrawnfromthesepens = "Missing";
			vars.Toomucheathformyliking = "Missing";
			vars.EscapetheFortress = "Missing";
			vars.SloghutSurvivor = "Missing";
			vars.Runner = "Missing";
			vars.MeepHarder = "Missing";
			vars.BrewersYeesh = "Missing";
			vars.AllFueledUp = "Missing";
			vars.DrivenCrazy = "Missing";
			vars.CrymeaRiver = "Missing";
			vars.AMuddyEscape = "Missing";
			vars.AnnoyingBoils = "Missing";
			vars.Luluwillbepleased = "Missing";
			vars.ReservedRow = "Missing";
			vars.IdontwantnoScrubs = "Missing";
			vars.Theshareholderswillbeunhappy = "Missing";
			vars.DonewithDocking = "Missing";
			vars.GreatEggscape = "Missing";
			vars.Suiteness = "Missing";
			vars.Spoocey = "Missing";
			vars.VerySpoocey = "Missing";
			vars.SuperSpoocey = "Missing";
			vars.UltraSpoocey = "Missing";
			vars.Demonic = "Missing";
			vars.WheelieSelfish = "Missing";
			vars.Zenandtheartofwheelchairmaintenance = "Missing";
			vars.RidingHigh = "Missing";
			vars.NotMine = "Missing";
			vars.Abittersweetreunion = "Missing";
			vars.ArchersatDawn = "Missing";
			vars.WereFreeeeeee = "Missing";
			vars.APeacefulDeath = "Missing";
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
			vars.curLvl = -1;
			vars.NoMultipleSplits = 0;
			vars.labordone = 0;
			vars.NGplus = 0;
			vars.spooce = 0;
			vars.spooceshrubMuds = 0;
			vars.Entity1 = 0;
			vars.Entity2 = 0;
			vars.Entity3 = 0;
			vars.Entity4 = 0;
			vars.Entity5 = 0;
			vars.Entity6 = 0;
			vars.Entity7 = 0;
			vars.Entity8 = 0;
			vars.Entity9 = 0;
			vars.Entity10 = 0;
			vars.Entity11 = 0;
			vars.Entity12 = 0;
			vars.Entity13 = 0;
			vars.Entity14 = 0;
			vars.Entity15 = 0;
			vars.Entity16 = 0;
			vars.mudarchers = 0;
			vars.mudokonAchievement = 0;
			vars.TotalAchievementsCounter = 0;
			vars.LastAchievementUnlocked = "";
			vars.LeavetheCave = "Missing";
			vars.SpoocedOut = "Missing";
			vars.FuzzleTestSuccess = "Missing";
			vars.Vatlldoit = "Missing";
			vars.FluorideTanks = "Missing";
			vars.Dontsnoozeonthejob = "Missing";
			vars.Onlybloodisdrawnfromthesepens = "Missing";
			vars.Toomucheathformyliking = "Missing";
			vars.EscapetheFortress = "Missing";
			vars.SloghutSurvivor = "Missing";
			vars.Runner = "Missing";
			vars.MeepHarder = "Missing";
			vars.BrewersYeesh = "Missing";
			vars.AllFueledUp = "Missing";
			vars.DrivenCrazy = "Missing";
			vars.CrymeaRiver = "Missing";
			vars.AMuddyEscape = "Missing";
			vars.AnnoyingBoils = "Missing";
			vars.Luluwillbepleased = "Missing";
			vars.ReservedRow = "Missing";
			vars.IdontwantnoScrubs = "Missing";
			vars.Theshareholderswillbeunhappy = "Missing";
			vars.DonewithDocking = "Missing";
			vars.GreatEggscape = "Missing";
			vars.Suiteness = "Missing";
			vars.Spoocey = "Missing";
			vars.VerySpoocey = "Missing";
			vars.SuperSpoocey = "Missing";
			vars.UltraSpoocey = "Missing";
			vars.Demonic = "Missing";
			vars.WheelieSelfish = "Missing";
			vars.Zenandtheartofwheelchairmaintenance = "Missing";
			vars.RidingHigh = "Missing";
			vars.NotMine = "Missing";
			vars.Abittersweetreunion = "Missing";
			vars.ArchersatDawn = "Missing";
			vars.WereFreeeeeee = "Missing";
			vars.APeacefulDeath = "Missing";
			return true;
		}
	}
}
