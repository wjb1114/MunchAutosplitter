state("Munch")
{
	byte levelId : 0x332188;
	byte isLoad : 0x318351;
	byte gameState : 0x35AF64;
}

startup {
	refreshRate = 120;
}

init
{
	// more startup actions, not sure if needed
	
	vars.curLvl = -1;
}



update
{
	//vars.watchers.UpdateAll(game);

//	print("Level ID      = " + current.levelId.ToString());
//	print("Loading       = " + current.isLoad.ToString());
//	print("Current State = " + current.gameState.ToString());
}

start
{
	if ((current.gameState == 9) && (old.gameState == 13))
	{
		vars.curLvl = 0;
		return true;
	}
}

split
{
	if(current.levelId == (old.levelId + 1))
	{
		vars.curLvl = current.levelId;
		return true;
	}
	else if ((current.levelId == 22) && (current.gameState == 7) && (old.levelId == 22) && (old.gameState == 0)) // handling for end of Loading Dock any% / black quarma
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
	if (((current.levelId == 0) && (vars.curLvl != -1) && (vars.curLvl != 0)) || (current.gameState == 17 && current.levelId == 0) || (current.gameState == 10 && current.levelId == 0))
	{
		vars.curLvl = -1;
		return true;
	}
}

