PVector position;
PVector velocity;
PVector acceleration;

float ballSize = 20;

float speed = 60;
float maxSpeed = 10;
float accelerationModifier= 0.6;
float decelerationModifier = 0.1;

float deltaTime;
long currentTime;
long oldTime;

void setup(){

speed = 80;
maxSpeed = 10;
accelerationModifier= 0.5;
float decelerationModifier = 0.1;


	size(1024,768);
  	ellipseMode(CENTER);

	position = new PVector(width/2, height/2);
	velocity = new PVector(0, 0);
	acceleration = new PVector(0, 0);

	frameRate(60);

	currentTime = millis();
}

void draw(){

	currentTime = millis();
	deltaTime = (currentTime - oldTime) * 0.001;
	//println("deltaTime: "+deltaTime);

	background(50, 166, 240);

	ellipse(MoveLogic().x, MoveLogic().y, ballSize, ballSize);

	DebugInfo();
	oldTime = currentTime;
}

PVector MoveLogic(){

	acceleration = InputDirection();

	acceleration.mult(accelerationModifier * speed * deltaTime);

	if(acceleration.magSq() == 0){

    	acceleration.x -= velocity.x * decelerationModifier * speed * deltaTime;
    	acceleration.y -= velocity.y * decelerationModifier * speed * deltaTime;
	}

	velocity.add(acceleration);
	velocity.limit(maxSpeed);

	//Velocity.copy() needed, else velocity will change its own value?
    position.add(velocity.copy().mult(speed * deltaTime));

    //Edge behaviours
    if(position.x < -1){

    	position.x = width - 1;
    }

   	if(position.x > width + 1){

    	position.x = 1;
    }

    if(position.y < (ballSize/2)){

    	position.y = ballSize/2;
    }

    if(position.y > height - (ballSize/2)){

    	position.y = height - (ballSize/2);
    }

    return position;
}

void DebugInfo(){

	textSize(16);

	text("Gravity: "+gravityOn, 10, 30);
	text("acceleration: "+acceleration, 10, 60);
	text("velocity: "+velocity, 10, 90);
}