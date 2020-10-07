CellManager cellManager;

int cellMaxSize = 50;

void setup(){

	size(1100, 1100);
	frameRate(200);

	cellManager = new CellManager();
}

void draw(){

	background(50, 166, 240);

	cellManager.update();

	ChangeSettings();
}

