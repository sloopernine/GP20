boolean inputMoveRight;
boolean inputMoveLeft;
boolean inputShoot;

boolean gravityOn = false;
PVector vectorInput = new PVector(0,0);
//Johan B.
void keyPressed()
{
	if (key == 'a'){

		inputMoveLeft = true;
	} else if (key == 'd'){

		inputMoveRight = true;
	}

	if (key == 32){

		inputShoot = true;
	}
}

void keyReleased()
{
	if (key == 'a'){

		inputMoveLeft = false;
	} else if (key == 'd'){

		inputMoveRight = false;
	}

	if (key == 32){

		inputShoot = false;
	}
}
