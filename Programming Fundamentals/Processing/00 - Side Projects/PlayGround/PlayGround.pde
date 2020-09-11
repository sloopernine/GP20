Player player;

PVector mouseVec;

boolean anchorLock = false;

float ballSize = 50.5;

void setup(){

	surface.setTitle("PlayGround");
  	size(1024, 1024);
  	frameRate(60);

  	player = new Player(100, 100, ballSize);

  	mouseVec = new PVector(mouseX, mouseY);
}

void draw(){

	background(255, 255, 255);

	mouseVec.set(mouseX, mouseY);

	player.Update();
}

//Smooth lerp between colors
color LerpColor( float intensity){
  
	return lerpColor(color(0,255,0,100), color(255,0,0,100), intensity);
}