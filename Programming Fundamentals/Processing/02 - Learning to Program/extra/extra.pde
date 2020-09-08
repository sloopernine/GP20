//!!! WIP !!! 

PCurve pCurve1 = new PCurve(20, 20, 20);

void setup(){

	surface.setTitle("Robin Bono | 02 - Learning to Program");
  	size(1024, 1024);
}

void draw(){

	BackgroundStuff();

	pCurve1.SetValues(20, 20, 20);

	pCurve1.Update();
}


void BackgroundStuff(){

	background(255, 255, 255);
}

class PCurve{

	int x; 		//xPos
	int y; 		//yPos
	int nL; 	//Number of lines
	int sMW;	//Main stroke width
	int sSW;	//Secondary stroke width
	int sO;		//Space offset

	PCurve(int xPos, int yPos, int numLines){

		x = x;
		y = y;
		nL = numLines;
	}

	void Update(){

		for(int i=0; i<nL*spaceOffset; i+=spaceOffset){

			if(i % 3 == 0){
  			
 	 			strokeWeight(2.5);
				stroke(0, 0, 0, 150);
			} else {
  
      			strokeWeight(2);
				stroke(175, 175, 175, 150);
			}
		

			line(0, height-i, i, 0);
		}
	}

	void SetSpaceOffset(int offset){

		sO = offset;
	}

	int GetSpaceOffset(){

		return
	}

	void SetMainStroke(int sWidth){

		sMW = sWidth;
	}
	void SetSecStroke(int sWidth){

		sSW = sWidth;
	}

	void SetValues(int xPos, int yPos, int numLines){

		x = x;
		y = y;
		nL = numLines;
	}

	int GetX(){

		return x;
	}
	int GetY(){

		return y;
	}
	int GetNumLines(){

		return nL;
	}
}
