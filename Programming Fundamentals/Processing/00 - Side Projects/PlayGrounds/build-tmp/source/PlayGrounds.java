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

public class PlayGrounds extends PApplet {

Ball ball;
Wall wall;

PVector mouseVec;

PVector anchorVec;
boolean anchorLock = false;

float ballSize = 50.5f;

public void setup(){

	surface.setTitle("Robin Bono | 03 - Vectors");
  	
  	frameRate(60);

  	ball = new Ball(100, 100, ballSize);
  	wall = new Wall(500, 0, 40);

  	mouseVec = new PVector(mouseX, mouseY);
  	anchorVec = new PVector(0, 0);
}

public void draw(){

	background(255, 255, 255);

	mouseVec.set(mouseX, mouseY);

	ball.Update();
	wall.Update();

	ball.TriggerCollision(wall.Collision(ball.ballVec, ball.powerVec, ball.GetBallSize()));
}

class Wall{

	int xP;
	int yP;
	int wWidth;

	Wall(int xPos, int yPos, int wallWidth){

		xP = xPos;
		yP = yPos;
		wWidth = wallWidth;
	}

	public void Update(){

		rect(xP, yP, wWidth, height);
	}

	public int Collision(PVector player, PVector power, float pSize){

		// 0 = no collision
		// 1 = X axis collision
		// 2 = Y axis collision

		int returnColl = 0;

		if(player.x + (pSize/2) > xP && player.x - (pSize/2) < xP + wWidth){

			returnColl = 1;
		}

		return returnColl;
	}
}

class Ball{

	PVector ballVec;
	PVector powerVec;

	float bS; // Ball size

	Ball(int xStartPos, int yStartPos, float bSize){

		ballVec = new PVector( xStartPos, yStartPos);
	  	powerVec = new PVector(0, 0);
		bS = bSize;
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

	public void TriggerCollision(int coll){

		if(coll == 1){

			powerVec.x *= -1;
		}

		if(coll == 2){

			powerVec.y *= -1;
		}
	}

	public float GetBallSize(){

		return bS;
	}
}
  public void settings() { 	size(1024, 1024); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "PlayGrounds" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
