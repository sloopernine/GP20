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

public class extra extends PApplet {

MyBall ball;
Background bGround;
DeltaTime deltaTime;

PVector mouseVec;
PVector powerVec;

PVector anchorVec;
boolean anchorLock = false;

float ballSize = 90;
float rEffect = 20; //Rubber impact effect
float rRestoreTime = 1.1f; //Rubber restore

public void setup(){

	surface.setTitle("Robin Bono | 03 - Vectors");
  	

  	ball = new MyBall(100, 100, ballSize);
  	bGround = new Background(color(255, 255, 255));
  	deltaTime = new DeltaTime();

  	mouseVec = new PVector(mouseX, mouseY);
  	powerVec = new PVector(0, 0);
  	anchorVec = new PVector(0, 0);

  	bGround.SetAltColor(color(255, 199, 78, 150));
}

public void draw(){

	bGround.Update();
	MouseStuff();
	ball.Update();
	deltaTime.Update();
}


public void MouseStuff(){

	mouseVec.set(mouseX, mouseY);
}

//Smooth lerp between colors
public int LerpColor( float intensity){
  
	return lerpColor(color(0,255,0,100), color(255,0,0,100), intensity);
}


class MyBall{

	PVector ballVec;
	PVector rubberVec;
	float bS; //Ball size

	MyBall(int xStartPos, int yStartPos, float cSize){

		ballVec = new PVector( xStartPos, yStartPos);
		rubberVec = new PVector(.0f, .0f);
		bS=cSize;
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
				powerVec.mult(3.50f * deltaTime.Get());

				//Modify distance to better fit with color lerp
				float modDist;
				modDist = PVector.dist(mouseVec, anchorVec) / 800;
				//Anchor line
				stroke( LerpColor(modDist));
				strokeWeight(5 + (modDist * 12.3f));
				line(anchorVec.x, anchorVec.y, mouseVec.x, mouseVec.y);
			}

		} else {

			anchorLock = false;

			ballVec.add(powerVec);
		}

		//Check if ball hit walls horizontal
		if(ballVec.x - (bS/2) < 0 || ballVec.x + (bS/2) > width){

			powerVec.x *= -1;
			Clash("x");
			bGround.Trigger();
		}

		//Check if ball hit walls vertical
		if(ballVec.y - (bS/2) < 0 || ballVec.y + (bS/2) > height){

			powerVec.y *= -1;
			Clash("y");
			bGround.Trigger();
		}

		//Update rubber effect
		if(rubberVec.mag() > 0){

			if(rubberVec.x > 0){

				rubberVec.set(rubberVec.x - rRestoreTime, rubberVec.y);
			}

			if(rubberVec.y > 0){

				rubberVec.set(rubberVec.x, rubberVec.y - rRestoreTime);
			}
		}

		// Draw ball
		stroke(0, 0, 0);
		strokeWeight(10);
		ellipse(ballVec.x, ballVec.y, bS - rubberVec.x, bS - rubberVec.y);
	}

	public void Clash(String axis){

		if( axis == "x"){

			println(axis);
			rubberVec.set(rEffect, rubberVec.y);			
		}

		if(axis == "y"){

			println(axis);
			rubberVec.set(rubberVec.x, rEffect);	
		}

		println(rubberVec.x);
	}

	public float xPos(){

		return ballVec.x;
	}

	public float yPos(){

		return ballVec.y;
	}	
}

class Background{

int sBColor;
int aBColor;
float c;

	Background(int rgb){

		sBColor = rgb;
	}

	public void Update(){

		if(c > 0){

			background(lerpColor(sBColor, aBColor, c));
			c -= 0.1f;
		} else {

			background(sBColor);
		}
		
		//println(c);
	}

	public void SetAltColor(int rgb){

		aBColor = rgb;
	}

	public void Trigger(){

		c = 1.1f;
	}
}

class DeltaTime{

	int lastTime;
	
	DeltaTime(){

		lastTime = millis();
	}

	public void Update(){

		lastTime = millis();
	}

	public float Get(){
  
  		int returnValue = 0;

  		returnValue = millis() - lastTime;
  
  		return (float)returnValue/1000.0f;
	}
}
  public void settings() { 	size(1024, 1024); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "extra" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
