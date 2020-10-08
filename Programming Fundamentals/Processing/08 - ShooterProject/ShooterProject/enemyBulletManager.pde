class EnemyBulletManager{

	//Ansvarig: Johan B
	// Edited/Reworked Robin B	
	EnemyBullet[] bullets;

	EnemyBulletManager(){

		setup();
	}

	void setup(){

		bullets = new EnemyBullet[10];

		for (int i = 0; i < bullets.length; ++i){
			
			bullets[i] = new EnemyBullet();
		}
	}

	void update(){

		for (int i = 0; i < bullets.length; i++){

			if(bullets[i].active){

				bullets[i].update();
				bullets[i].draw();

				boolean hit = player.checkCollision(bullets[i]);

				if(bullets[i].position.y > height + 10 || hit == true){

					bullets[i].animation.stop();
					bullets[i].active = false;
				}
			}
		}
	}

	void spawnBullet(float xPos, float yPos){

		EnemyBullet bullet = getFreeBullet();

		if(bullet != null){

			bullet.position = new PVector(xPos, yPos);
			bullet.active = true;
		}
	}

	EnemyBullet getFreeBullet(){

		EnemyBullet returnValue = null;

		for(int i = 0; i < bullets.length; i++){

			if(!bullets[i].active){

				return bullets[i];
			}
		}

		return returnValue;
	}
}