// Robin B
class StarLine extends GameObject{
	
	Animation animation;

	float speed;

	StarLine(){
		super();

		active = false;
		animation = new Animation(2, 2, "dustLineAnim", 80, 3);
	}


	void update(){

		if(position.y > height + 10){

			animation.stop();
			active = false;
		} else {

			animation.loop(position.x, position.y);
			position.y += speed * deltaTime;
		}
	}
}

class StarNear extends GameObject{

	float speed = 30;
	PImage starSprite;

	StarNear(){
		super();

		starSprite = loadImage("data/sprites/star255.png");
	}

	void update(){

		image(starSprite, position.x, position.y);

		if(position.y > height){

			position.y = 0;
		} else {

			position.y += speed * deltaTime;
		}
	}
}

class Star extends GameObject{

	float speed = 25;
	PImage starSprite;

	Star(){
		super();

		starSprite = loadImage("data/sprites/star170.png");
	}

	void update(){

		image(starSprite, position.x, position.y);

		if(position.y > height){

			position.y = 0;
		} else {

			position.y += speed * deltaTime;
		}
	}
}

class StarFar extends GameObject{

	float speed = 20;
	PImage starSprite;

	StarFar(){
		super();

		starSprite = loadImage("data/sprites/star85.png");
	}

	void update(){

		image(starSprite, position.x, position.y);

		if(position.y > height){

			position.y = 0;
		} else {

			position.y += speed * deltaTime;
		}
	}
}