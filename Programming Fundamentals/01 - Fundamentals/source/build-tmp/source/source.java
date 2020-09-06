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

int rgb;
int rgbFrom;
int rgbTarget;
float rgbCounter = .0f;

int lastTime = 0;

public void setup(){

  
  noFill();
  lastTime = millis();

  rgbFrom = color(random(255), random(255), random(255));
  rgbTarget = color(random(255), random(255), random(255));
}

public void draw(){

  background( 0, 0, 8 );
  
  rgb = randomLerpColor();

  R(210, 20, 13.2f, rgb);
  O(290, 20, 13.2f, rgb);
  B(376, 20, 13.2f, rgb);
  I(448, 20, 13.2f, rgb);
  N(530, 20, 13.2f, rgb);

  O(376, 120, 13.2f, rgb);
  N(432, 210, 13.2f, rgb);
  O(376, 306, 13.2f, rgb);
}

public void R(int x, int y, float sW, int col){

  strokeWeight( sW );
  stroke( col );

  line( x, y+118, x, y );
  curve(x-330, y+202, x, y, x, y+61, x-600, y+15 );
  line( x+65, y+118, x+36, y+59 );
}

public void O(int x, int y, float sW, int col){

  strokeWeight( sW );
  stroke( col );

  circle(x+32, y+85, 73);
}

public void B(int x, int y, float sW, int col){

  strokeWeight( sW );
  stroke( col );

  line( x, y+0, x, y+118 );
  curve( x+185, y+221, x+0, y+7, x+4, y+68, x-600, y+300 );
  curve( x-357, y+111, x+30, y+56, x+2, y+117, x-102, y-113 );
}

public void I(int x, int y, float sW, int col){

  strokeWeight( sW );
  stroke( col );

  line( x, y+50, x, y+118 );
  line( x, y+27, x, y+12 );
}

public void N(int x, int y, float sW, int col){

  strokeWeight( sW );
  stroke( col );

  line( x+-53, y+50, x+-52, y+118 );
  curve( x+-415, y+387, x+-47, y+62, x+5, y+117, x+28, y+-34 );
}

public float DeltaTime(){
  
  int returnValue = 0;

  returnValue = millis() - lastTime;
  lastTime = millis();  

  return (float)returnValue/1000.0f;
}

public int randomLerpColor(){

  int currentColor = lerpColor(rgbFrom, rgbTarget, rgbCounter);

  if( currentColor != rgbTarget){

    rgbCounter += 0.6f * DeltaTime();
    currentColor = lerpColor(rgbFrom, rgbTarget, rgbCounter);
  } else {

    rgbCounter = .0f;
    rgbFrom = rgbTarget;
    rgbTarget = color(random(255), random(255), random(255));
  }

  return currentColor;
}
  public void settings() {  size(768, 432); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "source" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
