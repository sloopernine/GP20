boolean isPaused = true;
boolean pauseButtonBlock;

boolean doReset = false;
boolean increaseCellSize = false;
boolean decreaseCellSize = false;
boolean drawMode = false;

boolean frameRateMode = false;
boolean frameRateModeBlock;

boolean increaseFillValue;
boolean decreaseFillValue;

void keyPressed()
{

	if(key == 'd'){

		drawMode = true;
	}

	if(key == 'p' || key == 32 && pauseButtonBlock == false){

		isPaused =! isPaused;

		pauseButtonBlock = true;
	}

	if(key == 'f' && frameRateModeBlock == false){

		frameRateMode =! frameRateMode;
		frameRateModeBlock = true;
	}
}

void keyReleased()
{

	if(key == 'd'){

		drawMode = false;
	}

	if(key == 'p' || key == 32){

		pauseButtonBlock = false;
	}

	if(key == 'f'){

		frameRateModeBlock = false;
	}

	if(key == 'r'){
	
		doReset = true;
	}

	if (key == 'w'){

		increaseCellSize = true;
	}
	else if (key == 's'){

		decreaseCellSize = true;
	}

	if (key == 'q'){

		decreaseFillValue = true;
	}
	else if (key == 'e'){

		increaseFillValue = true;
	}
}