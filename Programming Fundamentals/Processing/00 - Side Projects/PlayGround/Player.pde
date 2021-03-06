class Player{

	PVector anchorVec;
	PVector ballVec;
	PVector powerVec;

	float airFriction = 0.0001;
	float colFriction = 0.1;

	float bSize;

	Player(int xStartPos, int yStartPos, float ballSize){

  			anchorVec = new PVector(0, 0);
  			ballVec = new PVector(xStartPos, yStartPos);
		  	powerVec = new PVector(0, 0);

		  	bSize = ballSize;

	}

	void Update(){

		if(mousePressed == true){

			stroke(0, 0, 0, 150);
			strokeWeight(ballSize);

			ballVec.set(mouseVec);

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
			ballVec.add(powerVec);
		}

		boolean isColl;
		isColl = Collisions();
		Gravity(isColl);
		AirFriction(isColl);

		// Draw ball
		stroke(125, 125, 125);
		strokeWeight(5);
		ellipse(ballVec.x, ballVec.y, bSize, bSize);
	}

	boolean Collisions(){

		boolean returnValue = false;

		//Left
		if(ballVec.x - (bSize/2) < 0){

			powerVec.x *= -1;
			returnValue = true;
		}

		//Right
		if(ballVec.x + (bSize/2) > width){

			powerVec.x *= -1;
			returnValue = true;
		}

		//Top
		if(ballVec.y - (bSize/2) < 0){

			powerVec.y *= -1;
			returnValue = true;
		}

		//Bottom
		if(ballVec.y + (bSize/2) > height){

			powerVec.y *= -1;
			returnValue = true;
		}

		return returnValue;
	}

	void Gravity(boolean inCollision){

		if(!inCollision){

			powerVec.y += 0.5;
			println(powerVec.y);
		}
	}

	void AirFriction(boolean inCollision){

		if(!inCollision){

			powerVec.y -= (powerVec.y * airFriction);
			powerVec.x -= (powerVec.x * airFriction);
		}
	}
}
