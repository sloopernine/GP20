//Ansvarig: Johan B
// Edited Robin B

class GameManager{

	PFont fontDigital;
	PFont fontArcade;

	int curScore;
	boolean gameActive;

	GameManager(){

		setup();
	}

	void setup(){

		fontDigital = createFont("data/fonts/Digital.ttf", 32);
		fontArcade = createFont("data/fonts/Arcade.ttf", 32);

		curScore = 0;
		gameActive = true;
		player.alive = true;
	}

	void update(){

		if (player.alive == false){

			textFont(fontArcade);
			textSize(70);
			textAlign(CENTER);
			text("GAME OVER", width/2, height/2);
			gameActive = false;
		}

		WriteText();
	}

	void WriteText(){

		fill(55, 55, 255);
		textSize(32);
		strokeWeight(3);
		textAlign(LEFT);
		textFont(fontDigital);
		text("Score: " + curScore, width/2, height-15);
		text("Shield: " + player.shield * 50 + "%", 35, height-15);
	}

	void AddScore(int scoreAdded){

		println("YES!");
		println(curScore);
		curScore+=scoreAdded;
	}
}