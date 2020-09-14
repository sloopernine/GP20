BallClass ball;

PVector mouseVec;
PVector powerVec;

PVector anchorVec;
boolean anchorLock = false;

float ballSize = 50.5;

void setup(){

	surface.setTitle("Robin Bono | 03 - Vectors");
  	size(1024, 1024);
  	frameRate(60);

  	ball = new BallClass(100, 100, ballSize);

  	mouseVec = new PVector(mouseX, mouseY);
  	powerVec = new PVector(0, 0);
  	anchorVec = new PVector(0, 0);
}

void draw(){

	background(255, 255, 255);

	mouseVec.set(mouseX, mouseY);

	ball.Update();
}

class BallClass{

	PVector ballVec;
	float bS; // Ball size

	BallClass(int xStartPos, int yStartPos, float bSize){

		ballVec = new PVector( xStartPos, yStartPos);
		bS = bSize;
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
				powerVec.mult(0.1);

				// Anchor line
				stroke( 0, 0, 0);
				strokeWeight(5);
				line(anchorVec.x, anchorVec.y, mouseVec.x, mouseVec.y);
			}
		} else {

			anchorLock = false;

			// Add power to ball
			ballVec.add(powerVec);
		}

		// Check if ball hit walls horizontal
		if(ballVec.x - (bS/2) < 0 || ballVec.x + (bS/2) > width){

			powerVec.x *= -1;
		}

		// Check if ball hit walls vertical
		if(ballVec.y - (bS/2) < 0 || ballVec.y + (bS/2) > height){

			powerVec.y *= -1;
		}

		// Draw ball
		stroke(0, 0, 0);
		strokeWeight(6);
		ellipse(ballVec.x, ballVec.y, bS, bS);
	}
}
