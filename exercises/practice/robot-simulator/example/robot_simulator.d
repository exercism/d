module robot_simulator;

string[string][string] directions;

shared static this()
{
    directions["north"] = ["left": "west", "right": "east"];
    directions["east"] = ["left": "north", "right": "south"];
    directions["south"] = ["left": "east", "right": "west"];
    directions["west"] = ["left": "south", "right": "north"];
}

class RobotSimulator
{
public:
    this(int x, int y, string direction)
    {
        this.x = x;
        this.y = y;
        this.direction = direction;
    }

    void move(string commands)
    {
        foreach (command; commands)
        {
            if (command == 'A')
            {
                advance();
            } else
            {
                rotate(command);
            }
        }
    }

private:
    void rotate(char command)
    {
        string key = command == 'L' ? "left" : "right";
        this.direction = directions[this.direction][key];
    }

    void advance()
    {
        if (this.direction == "north")
        {
            this.y += 1;
        } else if (this.direction == "east")
        {
            this.x += 1;
        } else if (this.direction == "south")
        {
            this.y -= 1;
        } else if (this.direction == "west")
        {
            this.x -= 1;
        }
    }

    int x;
    int y;
    string direction;
}
