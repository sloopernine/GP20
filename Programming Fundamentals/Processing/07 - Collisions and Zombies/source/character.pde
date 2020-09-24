class Character{

	PVector position;
	PVector velocity;

	color cColor;
	float size;

	boolean alive;

	Character(){

        position = new PVector(Spawner().x, Spawner().y);
        velocity = new PVector(0, 0);

        velocity.x = random(11) - 5;
        velocity.y = random(11) - 5;

        size = 20;
	}


	void Update(){

	    position.x += velocity.x;
		position.y += velocity.y;
	}

	void Draw(){

		fill(cColor);
		ellipse(MoveLogic().x, MoveLogic().y, size, size);
	}

	PVector MoveLogic(){

    	//Edge warp
    	if(position.x < -1){

    		position.x = width - 1;
    	}

   		if(position.x > width + 1){

    		position.x = 1;
    	}

    	if(position.y < -1){

    		position.y = height-1;
    	}

    	if(position.y > height + 1){

    		position.y = 1;
    	}

    	return position;
	}

	PVector Spawner(){

		return new PVector(random(20, width - 20), random(20, height - 20));
	}

	void Kill(){

		cColor = color(0, 120, 30);
		alive = false;
	}
}