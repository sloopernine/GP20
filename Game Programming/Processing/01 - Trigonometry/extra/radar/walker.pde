class Walker implements WalkerInterface {

  float visibleCounter;

  String getName()
  {
    return "Robin B"; //When asked, tell them our walkers name
  }

  PVector getStartPosition(int playAreaWidth, int playAreaHeight)
  {
    //Select a starting position or use a random one.
    float x = (int) random(0, playAreaWidth);
    float y = (int) random(0, playAreaHeight);

    //a PVector holds floats but make sure its whole numbers that are returned!
    return new PVector(x, y);
  }

  PVector update()
  {

    if(visibleCounter > 0f)
    {
      visibleCounter = visibleCounter - 0.1f;
    }
    //add your own walk behavior for your walker here.
    //Make sure to only use the outputs listed below.
    
    switch((int)random(0, 4)) 
    {
      case 0:
        return new PVector(-1, 0);
      case 1:
        return new PVector(1, 0);
      case 2:
        return new PVector(0, 1);
      default:
        return new PVector(0, -1);
    }
  }

  boolean getVisible()
  {
    if(visibleCounter > 0)
    {
      return true;
    }
    else
    {
      return false;  
    }
  }

  void setVisible()
  {
    visibleCounter = 5;
  }
}

//All valid outputs:
// PVector(-1, 0);
// PVector(1, 0);
// PVector(0, 1);
// PVector(0, -1);

//Any other outputs will kill the walker!
