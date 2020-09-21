class Player{
	
	PVector position = new PVector(0, 0);
	PVector velocity = new PVector(0, 0);
	PVector acceleration = new PVector(0, 0);

	float size;
	float speed;
	float maxSpeed;
	float accelerationModifier;
	float decelerationModifier;

	Player(PVector pPosition,float pSize, float pSpeed, float pMaxSpeed, float pAccModifier, float pDecModifier){

		size = pSize;
		position = pPosition;
		speed = pSpeed;
		maxSpeed = pMaxSpeed;
		accelerationModifier = pAccModifier;
		decelerationModifier = pDecModifier;
	}

	void Update(){

		fill(255, 255, 255);
		stroke(255, 255, 255);
		ellipse(MoveLogic().x, MoveLogic().y, ballSize, ballSize);
	}

	PVector MoveLogic(){

		acceleration = InputDirection();

		acceleration.mult(accelerationModifier * speed * deltaTime);

		if(acceleration.magSq() == 0){

    		acceleration.x -= velocity.x * decelerationModifier * speed * deltaTime;
    		acceleration.y -= velocity.y * decelerationModifier * speed * deltaTime;
		}

		velocity.add(acceleration);
		velocity.limit(maxSpeed);

		//Velocity.copy() needed, else velocity will change its own value?
		position.add(velocity.copy().mult(speed * deltaTime));

    	//Edge behaviours
    	if(position.x < -1){

    		position.x = width - 1;
    	}

   		if(position.x > width + 1){

    		position.x = 1;
    	}

    	if(position.y < (size/2)){

    		position.y = size/2;
    	}

    	if(position.y > height - (size/2)){

    		position.y = height - (size/2);
    	}

    	return position;
	}
}