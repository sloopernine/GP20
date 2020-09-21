import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class source extends PApplet {

//- Player
float playerSize = 20;
float playerSpeed = 80;
float playerMaxSpeed = 10;
float playerAccelerationModifier = 0.5f;
float playerDecelerationModifier = 0.1f;

Player player;
//- Balls
int numberOfBalls = 10;
float ballSize = 20;

Ball[] balls;
//- Delta time
float deltaTime;
long currentTime;
long oldTime;
//-

public void setup(){

	frameRate(60);

	
  	ellipseMode(CENTER);

  	player = new Player(
  		new PVector(width/2, height/2),
  		playerSize,
  		playerSpeed,
  		playerMaxSpeed,
  		playerAccelerationModifier,
  		playerDecelerationModifier
  	);

  	balls = new Ball[numberOfBalls];

	for(int i = 0; i < balls.length; i++){

		balls[i] = new Ball(
			color(random(10, 245), random(10, 245), random(10, 245)),
			ballSize, 
			random(0, width), 
			random(0, height)
		);
	}

	currentTime = millis();
}

public void draw(){

	currentTime = millis();
	deltaTime = (currentTime - oldTime) * 0.001f;
	//println("deltaTime: "+deltaTime);

	background(50, 166, 240);

	player.Update();

	for(int i = 0; i < balls.length; i++){

		balls[i].Update();
	}

	oldTime = currentTime;
}

class Ball
{
    //Our class variables
    PVector position; //Ball position
    PVector velocity; //Ball direction
    float size;
    int c;

    //Ball Constructor, called when we type new Ball(x, y);
    Ball(int rgb, float mSize, float x, float y)
    {
        
        c = rgb;
        size = mSize;

        //Set our position when we create the code.
        position = new PVector(x, y);

        //Create the velocity vector and give it a random direction.
        velocity = new PVector();
        velocity.x = random(11) - 5;
        velocity.y = random(11) - 5;
    }

    //Update our ball
    public void Update()
    {
        position.x += velocity.x;
        position.y += velocity.y;

        Bounce();

        fill(c);
        stroke(0, 0, 0);
        ellipse(position.x, position.y, size, size);
    }

    public void Bounce(){

        // Check if ball hit walls horizontal
        if(position.x - (size/2) < 0 || position.x + (size/2) > width){

            velocity.x *= -1;
        }

        // Check if ball hit walls vertical
        if(position.y - (size/2) < 0 || position.y + (size/2) > height){

            velocity.y *= -1;
        }
    }
}
boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;

boolean gravityOn;
boolean gravityButtonBlock;

public void keyPressed()
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

public void keyReleased()
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

public PVector InputDirection(){

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

public void SwitchGravity(){

	gravityOn = !gravityOn;
}
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

	public void Update(){

		fill(255, 255, 255);
		stroke(255, 255, 255);
		ellipse(MoveLogic().x, MoveLogic().y, ballSize, ballSize);
	}

	public PVector MoveLogic(){

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
  public void settings() { 	size(1024,768); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "source" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
