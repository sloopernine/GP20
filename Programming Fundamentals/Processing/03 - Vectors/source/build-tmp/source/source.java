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

MyCircle eliCircle;

PVector mouseVec;
PVector powerVec;

PVector anchorVec;
boolean anchorLock = false;

float ballSize = 50.5f;

public void setup(){

	surface.setTitle("Robin Bono | 03 - Vectors");
  	

  	eliCircle = new MyCircle(100, 100, ballSize);
  	mouseVec = new PVector(mouseX, mouseY);
  	powerVec = new PVector(0, 0);
  	anchorVec = new PVector(0, 0);
}

public void draw(){

	Background();
	MouseStuff();
	eliCircle.Update();
	
}

public void Background(){

	background(255, 255, 255);
}

public void MouseStuff(){

	mouseVec.set(mouseX, mouseY);
}

//Smooth lerp between colors
public int LerpColor( float intensity){
  
  println(intensity);
	return lerpColor(color(0,243,0,100), color(251,0,0,100), intensity);
}

class MyCircle{

	PVector vec;
	float cS;

	MyCircle(int xStartPos, int yStartPos, float cSize){

		vec = new PVector( xStartPos, yStartPos);
		cS=cSize;
	}

	public void Update(){

		if(mousePressed == true){

			stroke(0, 0, 0, 150);
			strokeWeight(ballSize);
			line(vec.x, vec.y, mouseVec.x, mouseVec.y);

			vec.set(mouseVec);

			if(!anchorLock){

				anchorVec.set(mouseVec);
				powerVec.set(0, 0);
				anchorLock = true;
			} else {

				// Trace
				powerVec.set( PVector.sub(anchorVec, mouseVec) );
				powerVec.mult(0.1f);

				println(powerVec);

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

			vec.add(powerVec);
		}

		// Check if ball hit walls horizontal
		if(vec.x - (cS/2) < 0 || vec.x + (cS/2) > width){

			powerVec.x *= -1;
		}

		// Check if ball hit walls vertical
		if(vec.y - (cS/2) < 0 || vec.y + (cS/2) > height){

			powerVec.y *= -1;
		}

		// Draw ball
		stroke(0, 0, 0);
		strokeWeight(1);
		ellipse(vec.x, vec.y, cS, cS);
	}

	public float xPos(){

		return vec.x;
	}

	public float yPos(){

		return vec.y;
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
