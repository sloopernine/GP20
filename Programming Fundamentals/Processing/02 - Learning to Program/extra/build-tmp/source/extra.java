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


int spaceOffset = 20;

PCurve pCurve1 = new PCurve(20, 20, 20);

public void setup(){

	surface.setTitle("Robin Bono | 02 - Learning to Program");
  	
}

public void draw(){

	BackgroundStuff();

	pCurve1.Update();
}


public void BackgroundStuff(){

	background(255, 255, 255);
}

class PCurve{

	int x;
	int y;
	int nL;

	PCurve(int xPos, int yPos, int numLines){

		x = x;
		y = y;
		nL = numLines;
	}

	public void Update(){

		for(int i=0; i<nL*spaceOffset; i+=spaceOffset){

			if(i % 3 == 0){
  			
 	 			strokeWeight(2.5f);
				stroke(0, 0, 0, 150);
			} else {
  
      			strokeWeight(2);
				stroke(175, 175, 175, 150);
			}
		

			line(0, height-i, i, 0);
		}
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
