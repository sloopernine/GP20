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

int spaceOffset = 20;

public void setup(){

	surface.setTitle("Robin Bono | 02 - Learning to Program");
  	
}

public void draw(){

	background(255, 255, 255);

	ParabolicCurve();
}

public void ParabolicCurve(){

	for(int l=0; l<height; l+=spaceOffset){

		if(l % 3 == 0){
  			
 	 		strokeWeight(2.5f);
			stroke(0, 0, 0, 150);
		} else {
  
      		strokeWeight(2);
			stroke(175, 175, 175, 150);
		}
		
		//Top left corner
		line(0, height-l, l, 0);
		//Top right corner
		line(l, 0, height, l);
		//Bottom right corner
		line(height, l, height-l, height);
		//Bottom left corner
		line(l, height, 0, l);
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
