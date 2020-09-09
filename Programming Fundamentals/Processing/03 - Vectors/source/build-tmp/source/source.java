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
Background bGround;

PVector mouseVec;
PVector powerVec;

PVector anchorVec;
boolean anchorLock = false;

float ballSize = 50.5f;

public void setup(){

	surface.setTitle("Robin Bono | 03 - Vectors");
  	
  	frameRate(60);

  	eliCircle = new MyCircle(100, 100, ballSize);
  	bGround = new Background(color(255, 255, 255));

  	mouseVec = new PVector(mouseX, mouseY);
  	powerVec = new PVector(0, 0);
  	anchorVec = new PVector(0, 0);

  	bGround.SetAltColor(color(255, 199, 78, 150));
}

public void draw(){

	bGround.Update();
	MouseStuff();
	eliCircle.Update();
	
}


public void MouseStuff(){

	mouseVec.set(mouseX, mouseY);
}

//Smooth lerp between colors
public int LerpColor( float intensity){
  
	return lerpColor(color(0,255,0,100), color(255,0,0,100), intensity);
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
			bGround.Trigger();
		}

		// Check if ball hit walls vertical
		if(vec.y - (cS/2) < 0 || vec.y + (cS/2) > height){

			powerVec.y *= -1;
			bGround.Trigger();
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
		
		println(c);
	}

	public void SetAltColor(int rgb){

		aBColor = rgb;
	}

	public void Trigger(){

		c = 1.1f;
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
