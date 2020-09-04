color rgb;

void setup(){
  size(768, 432);
  noFill();
}

void draw(){

  background( -73, 104, 162 );
  
  rgb = lerpColor(color(255, 255, 255), color(255, 255, 255), 0.5);
  

R(210, 20, 13.2);
O(290, 20, 13.2);
B(376, 20, 13.2);
I(448, 20, 13.2);
N(530, 20, 13.2);

O(376, 120, 13.2);
N(432, 210, 13.2);
O(376, 306, 13.2);

}

void R(int x, int y, float sW){
  strokeWeight( sW );
  stroke( random(255), random(255), random(255) );

  line( x, y+118, x, y );
  curve(x-330, y+202, x, y, x, y+61, x-600, y+15);
  line( x+65, y+118, x+36, y+59 );
}

void O(int x, int y, float sW){
  strokeWeight( sW );
  stroke( random(255), random(255), random(255) );

  circle(x+32, y+85, 73);
}

void B(int x, int y, float sW){
  strokeWeight( sW );
  stroke( random(255), random(255), random(255) );

  line( x, y+0, x, y+118 );
  curve(x+185, y+221, x+0, y+7, x+4, y+68, x-600, y+300);
  curve(x-357, y+111, x+30, y+56, x+2, y+117, x-102, y-113);
}

void I(int x, int y, float sW){
  strokeWeight( sW );
  stroke( random(255), random(255), random(255) );

  line( x, y+50, x, y+118 );
  line( x, y+27, x, y+12 );
}

void N(int x, int y, float sW){
  strokeWeight( sW );
  stroke( random(255), random(255), random(255) );

  line( x+-53, y+50, x+-52, y+118 );
  curve(x+-415, y+387, x+-47, y+62, x+5, y+117, x+28, y+-34);
}


class Col{

  void ColRed(int c){

  }

  void ColGre(int c){

  }

}

