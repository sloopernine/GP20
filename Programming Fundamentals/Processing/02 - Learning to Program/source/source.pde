int spaceOffset = 20;

void setup(){

	surface.setTitle("Robin Bono | 02 - Learning to Program");
  	size(1024, 1024);
}

void draw(){

	background(255, 255, 255);

	ParabolicCurve();
}

void ParabolicCurve(){

	for(int l=0; l<height; l+=spaceOffset){

		if(l % 3 == 0){
  			
 	 		strokeWeight(2.5);
			stroke(0, 0, 0, 150);
		} else {
  
      		strokeWeight(2);
			stroke(175, 175, 175, 150);
		}
		
		//Top left corner
		line(0, height-l, l, 0);
		//Top right corner
		line(l, 0, height, l);
		//Bottom right corner
		line(height, l, height-l, height);
		//Bottom left corner
		line(l, height, 0, l);
	}
}
