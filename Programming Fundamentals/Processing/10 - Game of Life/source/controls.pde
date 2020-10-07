void ChangeSettings(){

	if(isPaused){

		textSize(32);
		textAlign(CENTER);
		fill(0, 0, 0);
		text("Press P or SPACE to unpause", width/2, height/2);
		text("Press R to randomize", width/2, height/2+60);
		text("Press W or S to change cell size", width/2, height/2+120);
		text("Cell Size: " + cellManager.cellSize, width/2, height/2+180);
		text("Press E to turn effects on/off", width/2, height/2+240);


		text("Hold D to draw with RMB, erase LMB while simulation run", width/2, height/2+380);

		if(doReset){

			cellManager.prepareArray();

			doReset = false;
		}

		if(increaseCellSize && cellManager.cellSize < cellMaxSize){

			cellManager.cellSize++;
			cellManager.prepareArray();
			increaseCellSize = false;
		}

		if(decreaseCellSize && cellManager.cellSize > 1){

			cellManager.cellSize--;
			cellManager.prepareArray();
			decreaseCellSize = false;
		}		
	}

	if(frameRateMode){

		textSize(30);
		textAlign(LEFT);
		fill(255, 0, 0);
		text(frameRate, 20, 60);
	}
}