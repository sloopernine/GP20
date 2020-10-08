// Robin B
class ExplosionManager{
	
	int amountExplosions = 5;

	Explosion[] explosions;

	ExplosionManager(){

		explosions = new Explosion[amountExplosions];

		for(int i = 0; i < explosions.length; i++){

			explosions[i] = new Explosion();
		}
	}


	void update(){

		for(int i = 0; i < explosions.length; i++){

			explosions[i].active = explosions[i].animation.isPlaying();
		}
	}

	void spawnExplosion(float xPos, float yPos){

		Explosion explosion = getFreeExplosion();

		if(explosion != null){

			explosion.explode(xPos, yPos);
		} else {

			println("No free explosion to spawn FIX!");	
		}
	}

	Explosion getFreeExplosion(){

		Explosion returnValue = null;

		for(int i = 0; i < explosions.length; i++){

			if(!explosions[i].active){

				return explosions[i];
			}
		}

		return returnValue;
	}
}