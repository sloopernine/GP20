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

ArrayList<Wall[]> walls = new ArrayList<Wall[]>();

Player player;

PVector mouseVec;

boolean anchorLock = false;

float ballSize = 50.5f;

boolean inMenu = false;

public void setup(){

	surface.setTitle("PlayGround");
  	
  	frameRate(60);

  	player = new Player(100, 100, ballSize);

  	mouseVec = new PVector(mouseX, mouseY);
}

public void draw(){

	if(inMenu){

		Menu();
	} else {

		background(255, 255, 255);

		mouseVec.set(mouseX, mouseY);

		player.Update();
	}
}

//Smooth lerp between colors
public int LerpColor( float intensity){
  
	return lerpColor(color(0,255,0,100), color(255,0,0,100), intensity);
}

public void Menu(){

	background(0, 0, 255);
}
class Player{

	PVector anchorVec;
	PVector ballVec;
	PVector powerVec;

	float airFriction = 0.0001f;
	float colFriction = 0.1f;

	float bSize;

	Player(int xStartPos, int yStartPos, float ballSize){

  			anchorVec = new PVector(0, 0);
  			ballVec = new PVector(xStartPos, yStartPos);
		  	powerVec = new PVector(0, 0);

		  	bSize = ballSize;

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
		AirFriction(isColl);

		// Draw ball
		stroke(125, 125, 125);
		strokeWeight(5);
		ellipse(ballVec.x, ballVec.y, bSize, bSize);
	}

	public boolean Collisions(){

		boolean returnValue = false;

		//Left
		if(ballVec.x - (bSize/2) < 0){

			powerVec.x *= -1;
			returnValue = true;
		}

		//Right
		if(ballVec.x + (bSize/2) > width){

			powerVec.x *= -1;
			returnValue = true;
		}

		//Top
		if(ballVec.y - (bSize/2) < 0){

			powerVec.y *= -1;
			returnValue = true;
		}

		//Bottom
		if(ballVec.y + (bSize/2) > height){

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

	public void AirFriction(boolean inCollision){

		if(!inCollision){

			powerVec.y -= (powerVec.y * airFriction);
			powerVec.x -= (powerVec.x * airFriction);
		}
	}
}
class Wall{
	
	int wallWidth = 50;

	int xPos;
	int yPos;
	int gStart;

	Wall(){
	}

	public void Update(){

		
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
