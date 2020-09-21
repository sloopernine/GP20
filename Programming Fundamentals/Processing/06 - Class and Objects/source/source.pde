//- Player
float playerSize = 20;
float playerSpeed = 80;
float playerMaxSpeed = 10;
float playerAccelerationModifier = 0.5;
float playerDecelerationModifier = 0.1;

Player player;
//- Balls
int numberOfBalls = 10;
float ballSize = 20;

Ball[] balls;
//- Delta time
float deltaTime;
long currentTime;
long oldTime;
//-

void setup(){

	frameRate(60);

	size(1024,768);
  	ellipseMode(CENTER);

  	player = new Player(
  		new PVector(width/2, height/2),
  		playerSize,
  		playerSpeed,
  		playerMaxSpeed,
  		playerAccelerationModifier,
  		playerDecelerationModifier
  	);

  	balls = new Ball[numberOfBalls];

	for(int i = 0; i < balls.length; i++){

		balls[i] = new Ball(
			color(random(10, 245), random(10, 245), random(10, 245)),
			ballSize, 
			random(0, width), 
			random(0, height)
		);
	}

	currentTime = millis();
}

void draw(){

	currentTime = millis();
	deltaTime = (currentTime - oldTime) * 0.001;
	//println("deltaTime: "+deltaTime);

	background(50, 166, 240);

	player.Update();

	for(int i = 0; i < balls.length; i++){

		balls[i].Update();
	}

	oldTime = currentTime;
}

//Check collision, 2 circles
//x1, y1 is the position of the first circle
//size1 is the radius of the first circle
//then the same data for circle number two

//function will return true (collision) or false (no collision)
//boolean is the return type

boolean roundCollision(int x1, int y1, int size1, int x2, int y2, int size2)
{
  int maxDistance = size1 + size2;

  //first a quick check to see if we are too far away in x or y direction
  //if we are far away we dont collide so just return false and be done.
  if(abs(x1 - x2) > maxDistance || abs(y1 - y2) > maxDistance)
  {
    return false;
  }
  //we then run the slower distance calculation
  //dist uses Pythagoras to get exact distance, if we still are to far away we are not colliding.
  else if(dist(x1, y1, x2, y2) > maxDistance)
  {
    return false;
  }
  //We now know the points are closer then the distance so we are colliding!
  else
  {
   return true;
  }
}
//A better way to do this is to have a circle object and pass the objects in to the function,
//then we just have to pass 2 objects instead of 6 different values.