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

public class PlayGround extends PApplet {

Player player;

PVector mouseVec;
PVector powerVec;

PVector anchorVec;
boolean anchorLock = false;

float ballSize = 50.5f;

public void setup(){

	surface.setTitle("PlayGround");
  	
  	frameRate(60);

  	player = new Player(100, 100, ballSize);

  	mouseVec = new PVector(mouseX, mouseY);
  	powerVec = new PVector(0, 0);
  	anchorVec = new PVector(0, 0);
}

public void draw(){

	background(255, 255, 255);

	mouseVec.set(mouseX, mouseY);

	player.Update();
}

//Smooth lerp between colors
public int LerpColor( float intensity){
  
	return lerpColor(color(0,255,0,100), color(255,0,0,100), intensity);
}



class Player{

	PVector ballVec;
	float cS;

	Player(int xStartPos, int yStartPos, float ballSize){


	}

	public void Update(){

		if(mousePressed == true){

			stroke(0, 0, 0, 150);
			strokeWeight(ballSize);

			ballVec.set(mouseVec);

			if(!anchorLock){

				anchorVec.set(mouseVec);
				powerVec.set(0, 0);
				anchorLock = true;
			} else {

				powerVec.set( PVector.sub(anchorVec, mouseVec) );
				powerVec.mult(0.1f);

				//Anchor line
				stroke( 0, 0, 0);
				strokeWeight(5);
				line(anchorVec.x, anchorVec.y, mouseVec.x, mouseVec.y);
			}

		} else {

			anchorLock = false;

			// Add power to ball
			ballVec.add(powerVec);
		}

		boolean isColl;
		isColl = Collisions();
		Gravity(isColl);

		// Draw ball
		stroke(0, 0, 0);
		strokeWeight(1);
		ellipse(ballVec.x, ballVec.y, cS, cS);
	}

	public boolean Collisions(){

		boolean returnValue = false;

		// Check if ball hit walls horizontal
		if(ballVec.x - (cS/2) < 0 || ballVec.x + (cS/2) > width){

			powerVec.x *= -1;
			returnValue = true;
		}

		if(ballVec.y - (cS/2) < 0 || ballVec.y + (cS/2) > height){

			powerVec.y *= -1;
			returnValue = true;
		}

		return returnValue;
	}

	public void Gravity(boolean inCollision){

		if(!inCollision){

			powerVec.y += 0.5f;
			println(powerVec.y);
		}
	}
}
  public void settings() { 	size(1024, 1024); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "PlayGround" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
