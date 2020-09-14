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

BallClass ball;

PVector mouseVec;
PVector powerVec;

PVector anchorVec;
boolean anchorLock = false;

float ballSize = 50.5f;

public void setup(){

	surface.setTitle("Robin Bono | 03 - Vectors");
  	
  	frameRate(60);

  	ball = new BallClass(100, 100, ballSize);

  	mouseVec = new PVector(mouseX, mouseY);
  	powerVec = new PVector(0, 0);
  	anchorVec = new PVector(0, 0);
}

public void draw(){

	background(255, 255, 255);

	mouseVec.set(mouseX, mouseY);

	ball.Update();
}

class BallClass{

	PVector ballVec;
	float bS;

	BallClass(int xStartPos, int yStartPos, float bSize){

		ballVec = new PVector( xStartPos, yStartPos);
		bS=bSize;
	}

	public void Update(){

		if(mousePressed == true){

			ballVec.set(mouseVec);

			if(!anchorLock){

				anchorVec.set(mouseVec);
				powerVec.set(0, 0);
				anchorLock = true;
			} else {

				powerVec.set( PVector.sub(anchorVec, mouseVec) );
				powerVec.mult(0.1f);

				// Anchor line
				stroke( 0, 0, 0);
				strokeWeight(5);
				line(anchorVec.x, anchorVec.y, mouseVec.x, mouseVec.y);
			}
		} else {

			anchorLock = false;

			// Add power to ball
			ballVec.add(powerVec);
		}

		// Check if ball hit walls horizontal
		if(ballVec.x - (bS/2) < 0 || ballVec.x + (bS/2) > width){

			powerVec.x *= -1;
		}

		// Check if ball hit walls vertical
		if(ballVec.y - (bS/2) < 0 || ballVec.y + (bS/2) > height){

			powerVec.y *= -1;
		}

		// Draw ball
		stroke(0, 0, 0);
		strokeWeight(6);
		ellipse(ballVec.x, ballVec.y, bS, bS);
	}
}
  public void settings() { 	size(1024, 1024); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "source" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
