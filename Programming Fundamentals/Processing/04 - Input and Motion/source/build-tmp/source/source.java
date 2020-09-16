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

PVector pos;
PVector vel;
PVector acc;

float maxVelCon = 5.5f;
float velCon = 1;
float accCon = 8.5f;
float decCon = 10.5f;

float deltaTime;
long oldTime;
long currentTime;

public void setup(){

	
  	ellipseMode(CENTER);

	pos = new PVector(width/2, height/2);
	vel = new PVector(0, 0);
	acc = new PVector(0, 0);

	frameRate(30);

	currentTime = millis();
}

public void draw(){

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

		if(vel.x > 0.5f){

			vel.x -= (velCon * decCon) * deltaTime;
		}else if( vel.x < -0.5f){

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

		if(vel.y > 0.5f){

			vel.y -= (velCon * decCon) * deltaTime;
		}else if( vel.y < -0.5f){

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

	deltaTime = (currentTime - oldTime) * 0.001f;
	oldTime = currentTime;
}
boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;
boolean keyPress;

//Key pressed, set our variables to true
public void keyPressed()
{

	if(keyCode == LEFT || key == 'a'){

		moveLeft = true;
	}else if(keyCode == RIGHT || key == 'd'){

		moveRight = true;
	}else if(keyCode == UP || key == 'w'){

		moveUp = true;
	}else if(keyCode == DOWN || key == 's'){

		moveDown = true;
	}
 }

//When a key is released, we will set our variable to false
public void keyReleased()
{

	if(keyCode == LEFT || key == 'a'){
		
		moveLeft = false;
	}else if(keyCode == RIGHT || key == 'd'){
		
		moveRight = false;
	}else if(keyCode == UP || key == 'w'){

		moveUp = false;
	}else if(keyCode == DOWN || key == 's'){

		moveDown = false;
	}
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
