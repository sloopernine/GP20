class CellManager{
	
	Cell[][] cells;

	int cellSize = 5;
	int xLength;
	int yLength; 

	CellManager(){

		prepareArray();
	}

	void update(){

		if(isPaused || drawMode){

			for(int y = 0; y < yLength; y++){
		
				for(int x = 0; x < xLength; x++){

					if(drawMode){

						if(mouseButton == LEFT){

							cells[mouseX/cellSize][mouseY/cellSize].alive = true;
						}

						if(mouseButton == RIGHT){

							cells[mouseX/cellSize][mouseY/cellSize].alive = false;
						}
					}

					if(cells[x][y].alive){

						cells[x][y].draw();
					}
				}	
			}
		} else {

			for(int y = 0; y < yLength; y++){
		
				for(int x = 0; x < xLength; x++){

					checkNeighbours(x, y);

					if(cells[x][y].alive){

						cells[x][y].draw();
					}
				}	
			}

			playGod();
		}	
	}

	void prepareArray(){

		xLength = width/cellSize;
		yLength = height/cellSize; 

		cells = new Cell[xLength][yLength];

		for(int y = 0; y < yLength; y++){
		
			for(int x = 0; x < xLength; x++){

				cells[x][y] = new Cell(x, y, cellSize);
				
				if(x > 0 && x < xLength - 1 && y > 0 && y < yLength - 1){

					if((int)random(5) == 0){

						cells[x][y].alive = true;
					}
				}
			}	
		}
	}

	void checkNeighbours(int x, int y){

		if(x > 0 && x < xLength - 1 && y > 0 && y < yLength - 1){

			// TODO TRY TO REMOVE IF STATEMENTS BY CHANGING ALIVE BOOL TO INT
			// ALSO TRY TO ONLY CHECK DEAD CELLS AROUND ALIVE CELLS TO DETERMINE IF THEY ARE ALOWED TO SPAWN

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

	// TODO CHANGE THIS FUNCTION NAME TO SOMETHING BETTER
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
}