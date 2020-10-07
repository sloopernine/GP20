int cellSize = 5;
int maxSize = 50;
int xLength;
int yLength; 

Cell[][] cells;

void setup(){

	size(1100, 1100);
	frameRate(200);
	PrepareArrays();
}

void PrepareArrays(){

	xLength = width/cellSize;
	yLength = height/cellSize; 

	cells = new Cell[xLength][yLength];

	for(int y = 0; y < yLength; y++){
	
		for(int x = 0; x < xLength; x++){

			cells[x][y] = new Cell(x, y, cellSize);
			
			if(x > 0 && x < xLength - 1 && y > 0 && y < yLength - 1){

				if((int)random(10) == 0){

					cells[x][y].alive = true;
				}
			}
		}	
	}
}

void draw(){

	background(50, 166, 240);

	if(!isPaused)
		checkNeighbours();

	for(int y = 0; y < yLength; y++){
	
		for(int x = 0; x < xLength; x++){

			if(cells[x][y].alive){

				cells[x][y].draw();
			}
		}	
	}

	if(!isPaused)
		playGod();

	ChangeSettings();
}

void checkNeighbours(){

	for(int y = 1; y < yLength-1; y++){

		for(int x = 1; x < xLength-1; x++){

			if(cells[x - 1][y - 1].alive){

				cells[x][y].neighbours++;
			}

			if(cells[x][y - 1].alive){

				cells[x][y].neighbours++;
			}

			if(cells[x + 1][y - 1].alive){

				cells[x][y].neighbours++;
			}

			if(cells[x - 1][y].alive){

				cells[x][y].neighbours++;
			}

			if(cells[x + 1][y].alive){

				cells[x][y].neighbours++;
			}

			if(cells[x - 1][y + 1].alive){

				cells[x][y].neighbours++;
			}

			if(cells[x][y + 1].alive){

				cells[x][y].neighbours++;
			}

			if(cells[x + 1][y + 1].alive){

				cells[x][y].neighbours++;
			}
		}	
	}
}

void playGod(){

	for(int y = 1; y < yLength-1; y++){

		for(int x = 1; x < xLength-1; x++){

			if(cells[x][y].alive){

				if(cells[x][y].neighbours >= 2 && cells[x][y].neighbours <= 3){

					cells[x][y].nextAliveState = true;
				} else {

					cells[x][y].nextAliveState = false;
				} 
			} else {

				if(cells[x][y].neighbours == 3){

					cells[x][y].nextAliveState = true;
				} 
			}

		}	
	}

	for(int y = 1; y < yLength-1; y++){

		for(int x = 1; x < xLength-1; x++){

			cells[x][y].alive = cells[x][y].nextAliveState;
			cells[x][y].neighbours = 0;
		}	
	}
}

void ChangeSettings(){

	if(isPaused){

		textSize(32);
		textAlign(CENTER);
		fill(0, 0, 0);
		text("Press P to unpause", width/2, height/2);
		text("Cell Size: " + cellSize, width/2, height/2+60);

		if(doReset){

			PrepareArrays();

			doReset = false;
		}

		if(increaseCellSize && cellSize < maxSize){

			cellSize++;
			PrepareArrays();
			increaseCellSize = false;
		}

		if(decreaseCellSize && cellSize > 1){

			cellSize--;
			PrepareArrays();
			decreaseCellSize = false;
		}		
	} else {

		textSize(30);
		textAlign(LEFT);
		fill(255, 0, 0);
		text(frameRate, 20, 60);
	}
}