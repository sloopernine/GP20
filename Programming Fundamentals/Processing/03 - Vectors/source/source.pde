MyCircle eliCircle;

PVector mouseVec;
PVector powerVec;

PVector anchorVec;
boolean anchorLock = false;

float ballSize = 50.5;

void setup(){

	surface.setTitle("Robin Bono | 03 - Vectors");
  	size(1024, 1024);
  	frameRate(60);

  	eliCircle = new MyCircle(100, 100, ballSize);

  	mouseVec = new PVector(mouseX, mouseY);
  	powerVec = new PVector(0, 0);
  	anchorVec = new PVector(0, 0);
}

void draw(){

	background(255, 255, 255);

	mouseVec.set(mouseX, mouseY);

	eliCircle.Update();
}

//Smooth lerp between colors
color LerpColor( float intensity){
  
	return lerpColor(color(0,255,0,100), color(255,0,0,100), intensity);
}

class MyCircle{

	PVector vec;
	float cS;

	MyCircle(int xStartPos, int yStartPos, float cSize){

		vec = new PVector( xStartPos, yStartPos);
		cS=cSize;
	}

	void Update(){

		if(mousePressed == true){

			stroke(0, 0, 0, 150);
			strokeWeight(ballSize);

			vec.set(mouseVec);

			if(!anchorLock){

				anchorVec.set(mouseVec);
				powerVec.set(0, 0);
				anchorLock = true;
			} else {

				powerVec.set( PVector.sub(anchorVec, mouseVec) );
				powerVec.mult(0.1);

				//Anchor line
				stroke( 0, 0, 0);
				strokeWeight(5);
				line(anchorVec.x, anchorVec.y, mouseVec.x, mouseVec.y);
			}

		} else {

			anchorLock = false;

			// Add power to ball
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
}
