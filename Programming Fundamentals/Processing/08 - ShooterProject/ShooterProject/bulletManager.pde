class BulletManager{

	//Ansvarig: Johan B
	// Edited/Reworked Robin B
	Bullet[] bullets;

	BulletManager(){
		
		setup();
	}

	void setup(){

		bullets = new Bullet[10];

		for (int i = 0; i < bullets.length; ++i){

			bullets[i] = new Bullet();
		}
	}

	void update(){

		for (int i = 0; i < bullets.length; i++){

			if(bullets[i].active){

       	  		bullets[i].update();
    	  		bullets[i].draw();

	    	  	boolean hit = enemyManager.checkCollision(bullets[i]);
    	  		
    	  		if(bullets[i].position.y < -10 || hit == true){

    	  			bullets[i].animation.stop();
    	  			bullets[i].active = false;
    	  		}
    		}
		}
	}

	void spawnBullet(float xPos, float yPos){

		Bullet bullet = getFreeBullet();

		if(bullet != null){

			bullet.position = new PVector(xPos, yPos);
			bullet.active = true;
		}
	}

	Bullet getFreeBullet(){

		Bullet returnValue = null;

		for(int i = 0; i < bullets.length; i++){

			if(!bullets[i].active){

				return bullets[i];
			}
		}

		return returnValue;
	}
}

