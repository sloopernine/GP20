void ChangeSettings(){

	if(isPaused){

		textSize(32);
		textAlign(CENTER);
		fill(0, 0, 0);
		text("Press P or SPACE to unpause", width/2, height/2);
		text("Cell Size: " + cellManager.cellSize, width/2, height/2+60);

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
	} else {

		textSize(30);
		textAlign(LEFT);
		fill(255, 0, 0);
		text(frameRate, 20, 60);
	}
}