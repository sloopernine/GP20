// Robin B
class SceneManager{
	
	StarLine[] starLine;
	int starLineAmount = 10;

	Star[] stars;
	StarNear[] starsNear;
	StarFar[] starsFar;
	int starAmount = width/10 * height/10;


	SceneManager(){

		//setupStarLines();
		setupStarField();
	}


	void update(){

		updateStarField();
		//starLineUpdate();
	}

	void setupStarField(){

		stars = new Star[starAmount];
		starsNear = new StarNear[starAmount];
		starsFar = new StarFar[starAmount];
		int starsCounter = 0;
		int starsFarCounter = 0;
		int starsNearCounter = 0;

		for(int y = 0; y < height; y++){

			for(int x = 0; x < width; x++){

				int lottery = (int)random(0, 5000);

				if(lottery == 25 && starsCounter < starAmount-1){

					stars[starsCounter] = new Star();
					stars[starsCounter].position = new PVector(x, y);
					starsCounter += 1;
				}
				if(lottery == 2500 && starsFarCounter < starAmount-1){

					starsFar[starsFarCounter] = new StarFar();
					starsFar[starsFarCounter].position = new PVector(x, y);
					starsFarCounter += 1;
				}
				if(lottery == 4500 && starsNearCounter < starAmount-1){

					starsNear[starsNearCounter] = new StarNear();
					starsNear[starsNearCounter].position = new PVector(x, y);
					starsNearCounter += 1;
				}
			}
		}
	}

	void updateStarField(){

		for(int i = 0; i < stars.length; i++){

			if(stars[i] != null){

				stars[i].update();
			}
		}

		for(int i = 0; i < starsFar.length; i++){

			if(starsFar[i] != null){

				starsFar[i].update();
			}	
		}

		for(int i = 0; i < starsNear.length; i++){

			if(starsNear[i] != null){

				starsNear[i].update();
			}
		}
	}

	void setupStarLines(){

		starLine = new StarLine[starLineAmount];

		for(int i = 0; i < starLine.length; i++){

			starLine[i] = new StarLine();

			starLine[i].position = new PVector(random(10, width - 10), random(10, height - 10));
			starLine[i].speed = random(20, 30);
			starLine[i].active = true;
		}
	}

	void starLineUpdate(){

		spawnStarLine();

		for(int i = 0; i < starLine.length; i++){

			if(starLine[i] != null){

				starLine[i].update();
			}
		}
	}

	void spawnStarLine(){

		StarLine line = getFreeStarLine();

		if(line != null){

			if(line.active == false){

				line.position = new PVector(random(0, width), -5);
				line.speed = random(20, 30);
				line.active = true;
			}
		}
	}

	StarLine getFreeStarLine(){

		StarLine returnValue = null;

		for(int i = 0; i < starLine.length; i++){

			if(!starLine[i].active){

				return starLine[i];
			}
		}

		return returnValue;
	}
}