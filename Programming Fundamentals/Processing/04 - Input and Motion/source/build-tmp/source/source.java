import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class source extends PApplet {

PVector position;
PVector velocity;
PVector acceleration;

float ballSize = 20;

float speed = 60;
float maxSpeed = 10;
float accelerationModifier= 0.6f;
float decelerationModifier = 0.1f;

float deltaTime;
long currentTime;
long oldTime;

public void setup(){

speed = 80;
maxSpeed = 10;
accelerationModifier= 0.5f;
float decelerationModifier = 0.1f;


	
  	ellipseMode(CENTER);

	position = new PVector(width/2, height/2);
	velocity = new PVector(0, 0);
	acceleration = new PVector(0, 0);

	frameRate(60);

	currentTime = millis();
}

public void draw(){

	currentTime = millis();
	deltaTime = (currentTime - oldTime) * 0.001f;
	//println("deltaTime: "+deltaTime);

	background(50, 166, 240);

	ellipse(MoveLogic().x, MoveLogic().y, ballSize, ballSize);

	DebugInfo();
	oldTime = currentTime;
}

public PVector MoveLogic(){

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

public void DebugInfo(){

	textSize(16);

	text("Gravity: "+gravityOn, 10, 30);
	text("acceleration: "+acceleration, 10, 60);
	text("velocity: "+velocity, 10, 90);
}
boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;

boolean gravityOn;
boolean gravityButtonBlock;

public void keyPressed()
{
    if (keyCode == LEFT || key == 'a'){
      moveLeft = true;
    }
    else if (keyCode == RIGHT || key == 'd'){
      moveRight = true;
    }

    if (keyCode == UP || key == 'w'){
      moveUp = true;
    }
    else if (keyCode == DOWN || key == 's'){
      moveDown = true;
    }

    if(key == 'g' && gravityButtonBlock == false){

    	SwitchGravity();
    	gravityButtonBlock = true;
    }
}

public void keyReleased()
{
    if (keyCode == LEFT || key == 'a'){
      moveLeft = false;
    }
    else if (keyCode == RIGHT || key == 'd'){
      moveRight = false;
    }
    if (keyCode == UP || key == 'w'){
      moveUp = false;
    }
    else if (keyCode == DOWN || key == 's'){
      moveDown = false;
    }

    if(key == 'g'){

    	gravityButtonBlock = false;
    }
}

public PVector InputDirection(){

	PVector dir = new PVector(0, 0);

	if(moveLeft){

		dir.x -= 1;
	}
	if(moveRight){

		dir.x += 1;
	}
	if(moveUp){

		dir.y -= 1;
	}
	if(moveDown){

		dir.y += 1;
	}

	dir.normalize();

	return dir;
}

public void SwitchGravity(){

	gravityOn = !gravityOn;
}
  public void settings() { 	size(1024,768); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "source" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
