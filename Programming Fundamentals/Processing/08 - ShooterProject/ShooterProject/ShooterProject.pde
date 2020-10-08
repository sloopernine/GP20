import processing.sound.*;

SoundFile music;

float deltaTime;
float time;

boolean debug = false;

Player player;
SceneManager sceneManager;
GameManager gameManager;
BulletManager bulletManager;
EnemyManager enemyManager;
ExplosionManager explosionManager;
AnimationManager animationManager;

void setup(){

	//This should be placed in gameManager, but something went wrong with starfield generation. 
	//Lack of time to figure out why this happened I had to put it here. Robin B
	music = new SoundFile(this, "data/sounds/spacetravelLoweredSound.wav");
	music.loop();

	size(1024, 768);
	animationManager = new AnimationManager();
	player = new Player(width/2, height-height/5);
	bulletManager = new BulletManager();
	enemyManager = new EnemyManager();
	sceneManager = new SceneManager();
	gameManager = new GameManager();
	explosionManager = new ExplosionManager();
}

void draw(){

	long currentTime = millis();
	deltaTime = (currentTime - time) * 0.001f;

	background(0, 0, 20);

	sceneManager.update();

	player.update();
	player.draw();

	explosionManager.update();
	enemyManager.update();
	animationManager.update();

	gameManager.update();

	bulletManager.update();

	time = currentTime;
}