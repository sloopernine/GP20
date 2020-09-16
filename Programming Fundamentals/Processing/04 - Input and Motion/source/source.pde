PVector pos;
PVector vel;
PVector acc;

float maxVelCon = 5.5;
float velCon = 1;
float accCon = 8.5;
float decCon = 10.5;

float deltaTime;
long oldTime;
long currentTime;

void setup(){

	size(1024,768);
  	ellipseMode(CENTER);

	pos = new PVector(width/2, height/2);
	vel = new PVector(0, 0);
	acc = new PVector(0, 0);

	frameRate(30);

	currentTime = millis();
}

void draw(){

	currentTime = millis();
	println("deltaTime: "+deltaTime);
	background(50, 166, 240);

	if (moveLeft) {

		if(vel.x < 10){

			vel.x -= (velCon * accCon) * deltaTime;
		}
	}else if(moveRight){

		if(vel.x < 10){

			vel.x += (velCon * accCon) * deltaTime;
		}
	}else{

		if(vel.x > 0.5){

			vel.x -= (velCon * decCon) * deltaTime;
		}else if( vel.x < -0.5){

			vel.x += (velCon * decCon) * deltaTime;
		}else{

			vel.x = 0;
		}
	}

	if (moveUp) {

		if(vel.y < 10){

			vel.y -= (velCon * accCon) * deltaTime;
		}
	}else if(moveDown){

		if(vel.y < 10){

			vel.y += (velCon * accCon) * deltaTime;
		}
	}else{

		if(vel.y > 0.5){

			vel.y -= (velCon * decCon) * deltaTime;
		}else if( vel.y < -0.5){

			vel.y += (velCon * decCon) * deltaTime;
		}else{

			vel.y = 0;
		}
	}

	println("vel.x: "+vel.x);
	println("vel.x: "+vel.y);
	pos.x += vel.x;
	pos.y += vel.y;

	ellipse(pos.x, pos.y, 20, 20);

	deltaTime = (currentTime - oldTime) * 0.001;
	oldTime = currentTime;
}