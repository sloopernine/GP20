int step = 0;
int numberOfPoints = 100;
float xOffset;
float yOffset;
float curveWidth;
float sfrequency;
float cfrequency;

void setup()
{
	size(800, 600);
	strokeWeight(10);
}

void draw()
{
	xOffset = 411.2;
	yOffset = 280.0;
	sfrequency = 0.19;
	cfrequency = 0.19;
	curveWidth = 7.0;


	background(8, 193, 246);

	for(int x = 0; x < numberOfPoints; x++)
	{

		stroke(0, 254, 78);
		point((x * curveWidth) + xOffset, yOffset + sin(step * sfrequency) * 87);
		stroke(168, 18, 254);
		point((x * curveWidth) + xOffset, yOffset + cos(step * cfrequency) * 139);
		step++;
	}

	float radius = 4;
  float radiusModifier = 0.4;
	int numberOfPointsCircle = 602;
	float angle = TWO_PI / (float)numberOfPointsCircle;
  //angle += 34.1;
  angle = 0.1;


	for(int i = 0; i < numberOfPointsCircle; i++)
	{
     	point(radius * sin(angle * i) + xOffset, radius * cos(angle * i) + yOffset);
     	radius += radiusModifier;
	}
}
