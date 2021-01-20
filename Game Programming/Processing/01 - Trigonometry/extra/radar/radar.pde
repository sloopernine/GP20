WalkerInterface[] walker;
PVector[] walkerPos;
int numberOfWalkers;

float xOffset;
float yOffset;

float radarRadius;
int numberOfPoints;
int counter;

PVector[] circlePoints;
PVector walkerSingle;

void setup() 
{
	size(800, 600);
  	strokeWeight(5);
  	background(0, 0, 0);

  	circlePoints = new PVector[1024];
  	walkerSingle = new PVector( 300, 300);

	numberOfWalkers = 100;
  	walker = new WalkerInterface[numberOfWalkers];
  	walkerPos = new PVector[numberOfWalkers];

  	
  	for(int i = 0; i < numberOfWalkers-1; i++)
  	{
  		walker[i] = new Walker();
  	}

  	for(int i = 0; i < numberOfWalkers-1; i++)
  	{
  		walkerPos[i] = new PVector();
  	}

  	for(int i = 0; i < numberOfWalkers-1; i++)
  	{
  		walkerPos[i] = walker[i].getStartPosition(width, height);
  	}
}

void draw() {
  
  	stroke(0, 0, 0);
  	fill(0, 10);
    rect(0, 0, width, height);

	xOffset = 400.0;
	yOffset = 300.0;
	
	float radius=260;
	int numPoints=1024;
	float angle=TWO_PI/(float)numPoints;
	
  	stroke(1, 90, 7, 150);
  	strokeWeight(5);
  	for(int i=0; i<numPoints; i++)
	{
		float x = radius*sin(angle*i) + xOffset;
		float y = radius*cos(angle*i) + yOffset;

		circlePoints[i] = new PVector(x, y);
		point(x, y);
	}

	DrawSweepLine(numPoints);

  	for(int i = 0; i < numberOfWalkers-1; i++)
	{
		if(linePoint(xOffset,yOffset, circlePoints[counter].x,circlePoints[counter].y, walkerPos[i].x, walkerPos[i].y))
		{
			walker[i].setVisible();
		}

		if(walker[i].getVisible())
		{
			strokeWeight(5);
			stroke(2, 249, 19, 150);
			//stroke(253, 5, 5, 150);
  			point(walkerPos[i].x, walkerPos[i].y);
		}

		walkerPos[i].add(walker[i].update());
	}
}

void DrawSweepLine(int numOfPoints)
{
	stroke(2, 249, 19, 150);
	strokeWeight(6);
	line(xOffset,yOffset,circlePoints[counter].x, circlePoints[counter].y);
	
	if(counter == 0)
	{
		counter = numOfPoints-1;
	}
	else
	{
		counter--;
	}
}

boolean linePoint(float x1, float y1, float x2, float y2, float px, float py) {

  // get distance from the point to the two ends of the line
  float d1 = dist(px,py, x1,y1);
  float d2 = dist(px,py, x2,y2);

  // get the length of the line
  float lineLength = dist(x1,y1, x2,y2);

  // since floats are so minutely accurate, add
  // a little buffer zone that will give collision
  float offset = 0.1;    // higher # = less accurate

  // if the two distances are equal to the line's 
  // length, the point is on the line!
  // note we use the buffer here to give a range, 
  // rather than one #
  if (d1+d2 >= lineLength-offset && d1+d2 <= lineLength+offset) {
    return true;
  }
  return false;
}
