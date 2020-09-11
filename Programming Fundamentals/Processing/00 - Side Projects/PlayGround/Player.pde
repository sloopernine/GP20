class Player{

	PVector anchorVec;
	PVector ballVec;
	PVector powerVec;

	float cS;

	Player(int xStartPos, int yStartPos, float ballSize){

		  	powerVec = new PVector(0, 0);
  			anchorVec = new PVector(0, 0);
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

		// Draw ball
		stroke(0, 0, 0);
		strokeWeight(1);
		ellipse(ballVec.x, ballVec.y, cS, cS);
	}

	boolean Collisions(){

		boolean returnValue = false;

		// Check if ball hit walls horizontal
		if(ballVec.x - (cS/2) < 0 || ballVec.x + (cS/2) > width){

			powerVec.x *= -1;
			returnValue = true;
		}

		if(ballVec.y - (cS/2) < 0 || ballVec.y + (cS/2) > height){

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
}
