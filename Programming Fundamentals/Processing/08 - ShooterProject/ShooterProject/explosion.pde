// Robin B
class Explosion extends GameObject{
	
	Animation animation;

	Explosion(){
		super();

		animation = new Animation(4, 4, "expl2", 30, 5);

		active = false;
	}

	void explode(float xPos, float yPos){

		active = true;
		animation.play(xPos, yPos);
	}
}