//Random lerp color function
color rgb;
color rgbFrom;
color rgbTarget;
float rgbCounter = .0;

//Delta time
int lastTime = 0;

void setup(){
  surface.setTitle("Robin Bono | 01 - Fundamentals");
  size(768, 432);
  noFill();

  //If millis() already got some value while loading
  lastTime = millis();

  //Set init color values
  rgbFrom = color(random(255), random(255), random(255));
  rgbTarget = color(random(255), random(255), random(255));
}

void draw(){

  background( 0, 0, 8 );
  
  rgb = randomLerpColor();

  R(210, 20, 13.2, rgb);
  O(290, 20, 13.2, rgb);
  B(376, 20, 13.2, rgb);
  I(448, 20, 13.2, rgb);
  N(530, 20, 13.2, rgb);

  O(376, 120, 13.2, rgb);
  N(432, 210, 13.2, rgb);
  O(376, 306, 13.2, rgb);
}

//Letter functions
void R(int x, int y, float sW, color col){

  strokeWeight( sW );
  stroke( col );

  line( x, y+118, x, y );
  curve(x-330, y+202, x, y, x, y+61, x-600, y+15 );
  line( x+65, y+118, x+36, y+59 );
}

void O(int x, int y, float sW, color col){

  strokeWeight( sW );
  stroke( col );

  circle(x+32, y+85, 73);
}

void B(int x, int y, float sW, color col){

  strokeWeight( sW );
  stroke( col );

  line( x, y+0, x, y+118 );
  curve( x+185, y+221, x+0, y+7, x+4, y+68, x-600, y+300 );
  curve( x-357, y+111, x+30, y+56, x+2, y+117, x-102, y-113 );
}

void I(int x, int y, float sW, color col){

  strokeWeight( sW );
  stroke( col );

  line( x, y+50, x, y+118 );
  line( x, y+27, x, y+12 );
}

void N(int x, int y, float sW, color col){

  strokeWeight( sW );
  stroke( col );

  line( x+-53, y+50, x+-52, y+118 );
  curve( x+-415, y+387, x+-47, y+62, x+5, y+117, x+28, y+-34 );
}

//Delta time to avoid different results on different computers
float DeltaTime(){
  
  int returnValue = 0;

  returnValue = millis() - lastTime;
  lastTime = millis();  

  return (float)returnValue/1000.0;
}

//Smooth lerp between colors
color randomLerpColor(){

  color currentColor = lerpColor(rgbFrom, rgbTarget, rgbCounter);

  if( currentColor != rgbTarget){
    //Step through the lerp
    rgbCounter += 0.6 * DeltaTime();
    currentColor = lerpColor(rgbFrom, rgbTarget, rgbCounter);
  } else {
    //Get new target color and reset
    rgbCounter = .0;
    rgbFrom = rgbTarget;
    rgbTarget = color(random(255), random(255), random(255));
  }

  //Return amazing colors
  return currentColor;
}
