Ball ball;
Wall wall;

PVector mouseVec;

PVector anchorVec;
boolean anchorLock = false;

float ballSize = 50;

void setup(){

	surface.setTitle("Robin Bono | 00 - PlayGrounds");
  	size(1024, 1024);
  	frameRate(60);

  	ball = new Ball(100, 100, ballSize);
  	wall = new Wall(500, 0, 200, 40);

  	mouseVec = new PVector(mouseX, mouseY);
  	anchorVec = new PVector(0, 0);
}

void draw(){

	background(255, 255, 255);

	mouseVec.set(mouseX, mouseY);

	ball.Update();
	wall.Update();

	ball.TriggerCollision(wall.Collision(ball.ballVec, ball.GetBallSize()));
}

class Wall{

	int xP;
	int yP;
	int wLength;
	int wWidth;

	Wall(int xPos, int yPos, int walllength, int wallWidth){

		xP = xPos;
		yP = yPos;
		wLength = walllength;
		wWidth = wallWidth;
	}

	void Update(){

		rect(xP, yP, wWidth, wLength);
	}

	PVector Collision(PVector player, float ballSize){

		PVector returnColl = new PVector(0, 0);

		if(player.x + (ballSize/2) > xP && player.x - (ballSize/2) < xP + wWidth &&
			player.y + (ballSize/2) > yP && player.y + (ballSize/2) < yP + wLength){

			if(player.x < xP){

				returnColl.x = -1;
				return returnColl;
			}
			if(player.x > xP + wWidth){

				returnColl.x = -1;
				return returnColl;
			}
			if(player.y > yP){

				returnColl.y = -1;
				return returnColl;
			}
			if(player.y < yP + wLength){

				returnColl.y = -1;
				return returnColl;
			}
		}

		return returnColl;
	}
}

class Ball{

	PVector ballVec;
	PVector powerVec;

	float bS; // Ball size

	Ball(int xStartPos, int yStartPos, float bSize){

		ballVec = new PVector( xStartPos, yStartPos);
	  	powerVec = new PVector(0, 0);
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

	void TriggerCollision(PVector coll){

		if(coll.x != 0){

			powerVec.x *= -1;
		}
		if(coll.y != 0){

			powerVec.y *= -1;
		}
	}

	float GetBallSize(){

		return bS;
	}
}
