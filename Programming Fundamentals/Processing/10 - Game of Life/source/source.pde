int cellSize = 5;
int xLength;
int yLength; 

Cell[][] cells;

boolean pause;

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
			
			if(x > 1 && x < xLength - 1 && y > 1 && y < yLength - 1){

				if((int)random(5) == 0){

					cells[x][y].alive = true;
				}
			}
		}	
	}
}

void draw(){

	background(50, 166, 240);

	fill(255, 0, 0);
	text(frameRate, 20, 20);

	checkNeighbours();

	for(int y = 0; y < yLength; y++){
	
		for(int x = 0; x < xLength; x++){

			if(cells[x][y].alive){

				cells[x][y].draw();
			}
		}	
	}

	playGod();
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