Character[] characters;

int numberOfCharacters = 100;

void setup(){

	frameRate(60);
	size(1024,768);
 	ellipseMode(CENTER);

	characters = new Character[numberOfCharacters];

	for(int i = 1; i < characters.length; i++){

		characters[i] = new Human();
	}
	characters[0] = new Zombie();
}

void draw(){

	background(50, 166, 240);
	
	CharacterManager();
}

void CharacterManager(){

	// Update movement and draw characters
	for(int i = 0; i < characters.length; i++){

		characters[i].Update();
		characters[i].Draw();
	}

	// Check collisions between characters
	for(int i = 0; i < characters.length; i++){
		for(int x = 0; x < characters.length; x++){

			if(i != x){

				boolean hit = roundCollision(characters[i], characters[x]);

				if(hit){

					if(characters[i].alive && characters[x].alive){

						characters[i].velocity.x *= -1;
						characters[i].velocity.y *= -1;
						//characters[x].velocity.x *= -1;
						//characters[x].velocity.y *= -1;

					} else { 
						
						characters[i].Kill();
						characters[x].Kill();
					}
				}
			}
		}
	}	
}


