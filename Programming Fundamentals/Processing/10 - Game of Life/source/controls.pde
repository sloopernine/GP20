void ChangeSettings(){

	if(isPaused){

		textSize(32);
		textAlign(CENTER);
		fill(0, 0, 0);
		text("Press P or SPACE to unpause", width/2, height/2);
		text("Press R to randomize", width/2, height/2+60);
		text("Press W or S to change cell size", width/2, height/2+120);
		text("Cell Size: " + cellManager.cellSize, width/2, height/2+180);
		text("Press Q or E to change fill value", width/2, height/2+240);
		text("Fill value: " + 100/cellManager.fillValue + "%", width/2, height/2+300);
		text("Press F to toggle frame rate counter", width/2, height/2+360);

		//text("Press E to turn effects on/off", width/2, height/2+240);


		text("Hold D to draw with RMB, erase LMB while simulation run", width/2, height/2+440);

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

		if(decreaseFillValue && cellManager.fillValue < 10){

			cellManager.fillValue++;
			cellManager.prepareArray();
			decreaseFillValue = false;
		}

		if(increaseFillValue && cellManager.fillValue > 1){

			cellManager.fillValue--;
			cellManager.prepareArray();
			increaseFillValue = false;
		} else if(increaseFillValue && cellManager.fillValue == 1){

			increaseFillValue = false;
		}
	} else {

		doReset = false;
		increaseCellSize = false;
		decreaseCellSize = false;
		increaseFillValue = false;
		decreaseFillValue = false;
	}

	if(frameRateMode){

		textSize(30);
		textAlign(LEFT);
		fill(255, 0, 0);
		text(frameRate, 20, 60);
	}
}