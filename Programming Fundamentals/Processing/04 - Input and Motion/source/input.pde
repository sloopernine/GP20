boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;
boolean keyPress;

//Key pressed, set our variables to true
void keyPressed()
{

	if(keyCode == LEFT || key == 'a'){

		moveLeft = true;
	}else if(keyCode == RIGHT || key == 'd'){

		moveRight = true;
	}else if(keyCode == UP || key == 'w'){

		moveUp = true;
	}else if(keyCode == DOWN || key == 's'){

		moveDown = true;
	}
 }

//When a key is released, we will set our variable to false
void keyReleased()
{

	if(keyCode == LEFT || key == 'a'){
		
		moveLeft = false;
	}else if(keyCode == RIGHT || key == 'd'){
		
		moveRight = false;
	}else if(keyCode == UP || key == 'w'){

		moveUp = false;
	}else if(keyCode == DOWN || key == 's'){

		moveDown = false;
	}
}