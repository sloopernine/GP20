MyCircle eliCircle;
Background bGround;

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
  	bGround = new Background(color(255, 255, 255));

  	mouseVec = new PVector(mouseX, mouseY);
  	powerVec = new PVector(0, 0);
  	anchorVec = new PVector(0, 0);

  	bGround.SetAltColor(color(255, 199, 78, 150));
}

void draw(){

	bGround.Update();
	MouseStuff();
	eliCircle.Update();
	
}


void MouseStuff(){

	mouseVec.set(mouseX, mouseY);
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

			// Trace
			stroke(0, 0, 0, 150);
			strokeWeight(ballSize);
			line(vec.x, vec.y, mouseVec.x, mouseVec.y);

			vec.set(mouseVec);

			if(!anchorLock){

				anchorVec.set(mouseVec);
				powerVec.set(0, 0);
				anchorLock = true;
			} else {

				powerVec.set( PVector.sub(anchorVec, mouseVec) );
				powerVec.mult(0.1);

				//Modify distance to better fit with color lerp
				float modDist;
				modDist = PVector.dist(mouseVec, anchorVec) / 800;
				//Anchor line
				stroke( LerpColor(modDist));
				strokeWeight(5 + (modDist * 12.3));
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

	float xPos(){

		return vec.x;
	}

	float yPos(){

		return vec.y;
	}	
}

class Background{

color sBColor;
color aBColor;
float c;

	Background(color rgb){

		sBColor = rgb;
	}

	void Update(){

		if(c > 0){

			background(lerpColor(sBColor, aBColor, c));
			c -= 0.1;
		} else {

			background(sBColor);
		}
		
		println(c);
	}

	void SetAltColor(color rgb){

		aBColor = rgb;
	}

	void Trigger(){

		c = 1.1;
	}
}
