boolean isPaused = true;
boolean pauseButtonBlock;

boolean doReset = false;
boolean increaseCellSize = false;
boolean decreaseCellSize = false;

void keyPressed()
{

    if(key == 'p' || key == 32 && pauseButtonBlock == false){

    	isPaused = !isPaused;
    }
}

void keyReleased()
{

    if(key == 'g'){

    	pauseButtonBlock = false;
    }

    if(key == 'r'){

    	doReset = true;
    }

    if (key == 'w'){

  		increaseCellSize = true;
    }
    else if (key == 's'){
      
      	decreaseCellSize = true;
    }
}