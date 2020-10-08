// Robin B
class Animation{
	
	PVector position;
	String name;

	PImage spriteSheet;
	PImage[] spriteAnimation;
	int spriteSizeX;
	int spriteSizeY;
	int col;
	int row;
	int maxLength;
	int sFrame;
	int eFrame;
	int animationCounter = 0;
	int animSpeed = 30; // Higher value = slower animation
	int zLayer = 0;

	boolean playLock = false;
	boolean loopLock = false;
	boolean frameLock = false;

	int lastTime = millis();

	Animation(int rows, int columns, String fileName, int animationSpeed, int zDrawOrder){

		position = new PVector(0, 0);

		spriteSheet = loadImage("data/sprites/" + fileName + ".png");
		spriteAnimation = new PImage[rows * columns];

		name = fileName;
		col = columns;
		row = rows;
		zLayer = zDrawOrder;

		maxLength = col * row - 1;

		animSpeed = animationSpeed;

		spriteSizeX = spriteSheet.width / col;
		spriteSizeY = spriteSheet.height / row;

		prepareAnimation();

		animationManager.register(this);
	}

	void update(){

		image(spriteAnimation[animationCounter], position.x - (spriteSizeX / 2), position.y - (spriteSizeY / 2));

		if(frameLock){

			if(animationCounter < eFrame){

				if(millis() - lastTime > animSpeed){

					animationCounter++;
					lastTime = millis();
				}
			} else {

				animationCounter = sFrame;
				playLock = false;
			}
		} else {

			if(animationCounter < maxLength){

				if(millis() - lastTime > animSpeed){

					animationCounter++;
					lastTime = millis();
				}
			} else {

				animationCounter = 0;
				playLock = false;
			}	
		}
	}

	void play(float xPos, float yPos){

		if(playLock == false){

			position = new PVector(xPos, yPos);
			animationCounter = 0;
			playLock = true;
		}
	}

	void play(float xPos, float yPos, int startFrame, int endFrame){

		if(playLock == false){

			position = new PVector(xPos, yPos);
			
			if(startFrame < 0){sFrame = 0;} else {sFrame = startFrame;}
			if(endFrame > col * row){eFrame = col * row;} else { eFrame = endFrame;}

			animationCounter = startFrame;
			frameLock = true;
			playLock = true;
		}
	}

	void loop(float xPos, float yPos){

		position = new PVector(xPos, yPos);
		loopLock = true;
	}

	void loop(float xPos, float yPos, int startFrame, int endFrame){

		position = new PVector(xPos, yPos);

		if(startFrame < 0){sFrame = 0;} else {sFrame = startFrame;}
		if(endFrame > col * row){eFrame = col * row;} else { eFrame = endFrame;}
		
		animationCounter = startFrame;
		frameLock = true;
		loopLock = true;
	}

	void stop(){

		animationCounter = 0;
		playLock = false;
		frameLock = false;	
		loopLock = false;
	}

	void UpdatePosition(float xPos, float yPos){

		position = new PVector(xPos, yPos);
	}

	boolean isPlaying(){

		boolean returnValue;

		if(playLock == false && loopLock == false){

			returnValue = false;
		} else {

			returnValue = true;
		}

		return returnValue;
	}

	void prepareAnimation(){

		int counter = 0;

		for(int y = 0; y < col; y++){
			for(int x = 0; x < row; x++){

				spriteAnimation[counter] = spriteSheet.get(x * spriteSizeX, y * spriteSizeY, spriteSizeX, spriteSizeY);

				counter++;
			}
		}
	}
}