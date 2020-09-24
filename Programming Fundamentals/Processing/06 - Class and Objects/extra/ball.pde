class Ball
{
    //Our class variables
    PVector position; //Ball position
    PVector velocity; //Ball direction
    float size;
    color c;
    boolean alive;

    //Ball Constructor, called when we type new Ball(x, y);
    Ball(color rgb, float mSize, float x, float y)
    {
        
        c = rgb;
        size = mSize;

        //Set our position when we create the code.
        position = new PVector(x, y);

        //Create the velocity vector and give it a random direction.
        velocity = new PVector();
        velocity.x = random(11) - 5;
        velocity.y = random(11) - 5;

        alive = true;
    }

    //Update our ball
    void Update()
    {
        position.x += velocity.x;
        position.y += velocity.y;

        Bounce();

        fill(c);
        stroke(0, 0, 0);
        ellipse(position.x, position.y, size, size);
    }

    void Bounce(){

        // Check if ball hit walls horizontal
        if(position.x - (size/2) < 0 || position.x + (size/2) > width){

            velocity.x *= -1;
        }

        // Check if ball hit walls vertical
        if(position.y - (size/2) < 0 || position.y + (size/2) > height){

            velocity.y *= -1;
        }
    }
}