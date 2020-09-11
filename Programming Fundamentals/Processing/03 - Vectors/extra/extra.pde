MyBall ball;
Background bGround;
DeltaTime deltaTime;

PVector mouseVec;
PVector powerVec;

PVector anchorVec;
boolean anchorLock = false;

float ballSize = 90;
float rEffect = 40; //Rubber impact effect
float rRestoreTime = 2.5; //Rubber restore

void setup(){

	surface.setTitle("Robin Bono | 03 - Vectors");
  	size(1024, 1024);

  	ball = new MyBall(100, 100, ballSize);
  	bGround = new Background(color(255, 255, 255));
  	deltaTime = new DeltaTime();

  	mouseVec = new PVector(mouseX, mouseY);
  	powerVec = new PVector(0, 0);
  	anchorVec = new PVector(0, 0);

  	bGround.SetAltColor(color(255, 199, 78, 150));
}

void draw(){

	bGround.Update();
	MouseStuff();
	ball.Update();
	deltaTime.Update();
}


void MouseStuff(){

	mouseVec.set(mouseX, mouseY);
}

//Smooth lerp between colors
color LerpColor( float intensity){
  
	return lerpColor(color(0,255,0,100), color(255,0,0,100), intensity);
}


class MyBall{

	PVector ballVec;
	PVector rubberVec;
	float bS; //Ball size

	MyBall(int xStartPos, int yStartPos, float cSize){

		ballVec = new PVector( xStartPos, yStartPos);
		rubberVec = new PVector(.0, .0);
		bS=cSize;
	}

	void Update(){

		if(mousePressed == true){

			ballVec.set(mouseVec);

			if(!anchorLock){

				anchorVec.set(mouseVec);
				powerVec.set(0, 0);
				anchorLock = true;
			} else {

				powerVec.set( PVector.sub(anchorVec, mouseVec) );
				powerVec.mult(3.50 * deltaTime.Get());

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

			ballVec.add(powerVec);
		}

		//Check if ball hit walls horizontal
		if(ballVec.x - (bS/2) + rubberVec.x < 0 || ballVec.x + (bS/2) - rubberVec.x > width){

			powerVec.x *= -1;
			Clash("x");
			bGround.Trigger();
		}

		//Check if ball hit walls vertical
		if(ballVec.y - (bS/2) + rubberVec.y < 0 || ballVec.y + (bS/2) - rubberVec.y > height){

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

	void Clash(String axis){

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

	float xPos(){

		return ballVec.x;
	}

	float yPos(){

		return ballVec.y;
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
		
		//println(c);
	}

	void SetAltColor(color rgb){

		aBColor = rgb;
	}

	void Trigger(){

		c = 1.1;
	}
}

class DeltaTime{

	int lastTime;
	
	DeltaTime(){

		lastTime = millis();
	}

	void Update(){

		lastTime = millis();
	}

	float Get(){
  
  		int returnValue = 0;

  		returnValue = millis() - lastTime;
  
  		return (float)returnValue/1000.0;
	}
}
