boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;

boolean gravityOn;
boolean gravityButtonBlock;

void keyPressed()
{
    if (keyCode == LEFT || key == 'a'){
      moveLeft = true;
    }
    else if (keyCode == RIGHT || key == 'd'){
      moveRight = true;
    }

    if (keyCode == UP || key == 'w'){
      moveUp = true;
    }
    else if (keyCode == DOWN || key == 's'){
      moveDown = true;
    }

    if(key == 'g' && gravityButtonBlock == false){

    	SwitchGravity();
    	gravityButtonBlock = true;
    }
}

void keyReleased()
{
    if (keyCode == LEFT || key == 'a'){
      moveLeft = false;
    }
    else if (keyCode == RIGHT || key == 'd'){
      moveRight = false;
    }
    if (keyCode == UP || key == 'w'){
      moveUp = false;
    }
    else if (keyCode == DOWN || key == 's'){
      moveDown = false;
    }

    if(key == 'g'){

    	gravityButtonBlock = false;
    }
}

PVector InputDirection(){

	PVector dir = new PVector(0, 0);

	if(moveLeft){

		dir.x -= 1;
	}
	if(moveRight){

		dir.x += 1;
	}
	if(moveUp){

		dir.y -= 1;
	}
	if(moveDown){

		dir.y += 1;
	}

	dir.normalize();

	return dir;
}

void SwitchGravity(){

	gravityOn = !gravityOn;
}