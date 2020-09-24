class Zombie extends Character{

	Zombie(){

		super();

		// 210, 180, 100 	White
		// 70, 50, 0		Brown
		// 0, 120, 30 		Green
		cColor = color(0, 120, 30);
		
		alive = false;
	}
}