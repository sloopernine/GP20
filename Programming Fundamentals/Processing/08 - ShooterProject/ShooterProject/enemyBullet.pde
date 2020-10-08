// Robin B
class EnemyBullet extends GameObject{
	
	float speed = 0.01;

	Animation animation;

	public EnemyBullet(){
		super();

		position = new PVector(0, 0);
		velocity = new PVector(0, 1);
		collider = 26;
		baseColor = color(0, 255, 0);
		animation = new Animation(2, 2, "enemyBullet1", 120, 3);

		active = false;
	}

	void update(){

		PVector bulletFlight = new PVector(0,0);
		bulletFlight = velocity.mult(deltaTime).normalize();

		velocity.add(bulletFlight.mult(speed));
		position.add(velocity);
	}

	void draw(){

		animation.loop(position.x, position.y);

		if(debug){

			fill(baseColor);
			ellipse(position.x, position.y, collider, collider);
		}
	}
}