class Cell{

	boolean alive;
	boolean nextAliveState;

	int xPos;
	int yPos;

	int cellSize;
	int neighbours;

	Cell(int xPosition, int yPosition, int size){

		cellSize = size;

		xPos = cellSize * xPosition;
		yPos = cellSize * yPosition;
		alive = false;
	}

	void draw(){

		if(alive){

			fill(255, 255, 255);
		} else {

			fill(125, 125, 125);
		}
		
		rect(xPos, yPos, cellSize, cellSize);		
	}
}