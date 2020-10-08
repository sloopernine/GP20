class Player extends Character
{
	//Ansvarig: Johan B
  // Edited Robin B
	float topSpeed = 7;
	float decelerationSpeed = 0.85;
	int ballDiameter = 20;
	float xInput = 0;
	float yInput = 0;
	float v = 1;
  float vectorMag = 15f;

  float curCooldownTime;
  float cooldownTime = 0.45;

  int shield;

  Animation animationLeft;
  Animation animationRight;
  Animation animationCenter;
  Animation animationShield;
  Animation animationExplode;

public Player(int x, int y)
{
  super();
	//ellipseMode(CENTER);
	position = new PVector(x, y);

	velocity = new PVector(0,0);
	xInput = 0;
  yInput = 0;

  shield = 2;

  animationLeft = new Animation(2, 2, "shipLeft", 30, 4);
  animationRight = new Animation(2, 2, "shipRight", 30, 4);
  animationCenter = new Animation(2, 2, "shipCenter", 30, 4);
  animationShield = new Animation(2, 4, "shieldAnim", 80, 5);
  animationExplode = new Animation(4, 4, "expl1", 30, 5);
}

void update()
{

  if (inputMoveLeft)
  {
    xInput -= v;
  }
  if (inputMoveRight)
  {
    xInput += v;
  }
  //If there is no player input the xInput will reset to start deceleration.
  if (!inputMoveLeft && !inputMoveRight)
  {
    xInput = 0;
  }

  if (inputShoot && curCooldownTime <= 0){

    if(alive){

      bulletManager.spawnBullet(position.x, position.y+2);
      curCooldownTime = cooldownTime;
    }
  }

  if (curCooldownTime >= 0){

    curCooldownTime -= deltaTime;
  }
  
  //Creates a acceleration vector with player input and sets the magnitude of that vector.
  PVector acceleration = new PVector(xInput, yInput);
  acceleration.setMag(vectorMag);

  //Deceleration if no input is registered.
  if (xInput == 0)
    velocity.x *= decelerationSpeed;
  else
    velocity.add(acceleration.mult(deltaTime));

  xInput = constrain(xInput, -topSpeed, topSpeed);
  position.y = constrain(position.y, 0+ballDiameter/2, height-ballDiameter/2);
  position.x = constrain(position.x, 0+ballDiameter, width-ballDiameter);

  //Limits the velocity vector and adds to vector to the character location vector.
  velocity.limit(topSpeed);
  position.add(velocity);

  animationShield.UpdatePosition(position.x, position.y);
}

  void draw()
  {

    if(alive){

      if(inputMoveLeft){

        animationLeft.loop(position.x, position.y);
      } else {
        
        animationLeft.stop();
      }

      if(inputMoveRight){

        animationRight.loop(position.x, position.y);
      } else {

        animationRight.stop();
      }

      if(!inputMoveLeft && !inputMoveRight){

        animationCenter.loop(position.x, position.y);
      } else {

        animationCenter.stop();
      }
    }
  }

  // Robin B
  boolean checkCollision(GameObject obj){

    boolean hit = super.collision(obj);

    if(hit && alive){

      GetDamage();
    } else {

      hit = false;
    }

    return hit;
  }

  // Robin B
  void GetDamage(){

    if(shield > 0){

      animationShield.play(position.x, position.y);
      shield -= 1;
    } else {

      animationLeft.stop();
      animationRight.stop();
      animationCenter.stop();
      animationExplode.play(position.x, position.y);

      alive = false;
    }
  }
}
