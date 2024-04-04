module robot_simulator;

class RobotSimulator
{
    this(int x, int y, string direction)
    {
        // implement this function
    }

    void move(string commands)
    {
        // implement this function
    }
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Create robot at origin facing north
    {
        RobotSimulator robot = new RobotSimulator(0, 0, "north");
        assert(robot.x == 0);
        assert(robot.y == 0);
        assert(robot.direction == "north");
    }

    static if (allTestsEnabled)
    {
        // Create robot at negative position facing south
        {
            RobotSimulator robot = new RobotSimulator(-1, -1, "south");
            assert(robot.x == -1);
            assert(robot.y == -1);
            assert(robot.direction == "south");
        }

        // Rotating clockwise changes north to east
        {
            RobotSimulator robot = new RobotSimulator(0, 0, "north");
            robot.move("R");
            assert(robot.x == 0);
            assert(robot.y == 0);
            assert(robot.direction == "east");
        }

        // Rotating clockwise changes east to south
        {
            RobotSimulator robot = new RobotSimulator(0, 0, "east");
            robot.move("R");
            assert(robot.x == 0);
            assert(robot.y == 0);
            assert(robot.direction == "south");
        }

        // Rotating clockwise changes south to west
        {
            RobotSimulator robot = new RobotSimulator(0, 0, "south");
            robot.move("R");
            assert(robot.x == 0);
            assert(robot.y == 0);
            assert(robot.direction == "west");
        }

        // Rotating clockwise changes west to north
        {
            RobotSimulator robot = new RobotSimulator(0, 0, "west");
            robot.move("R");
            assert(robot.x == 0);
            assert(robot.y == 0);
            assert(robot.direction == "north");
        }

        // Rotating counter-clockwise changes north to west
        {
            RobotSimulator robot = new RobotSimulator(0, 0, "north");
            robot.move("L");
            assert(robot.x == 0);
            assert(robot.y == 0);
            assert(robot.direction == "west");
        }

        // Rotating counter-clockwise changes west to south
        {
            RobotSimulator robot = new RobotSimulator(0, 0, "west");
            robot.move("L");
            assert(robot.x == 0);
            assert(robot.y == 0);
            assert(robot.direction == "south");
        }

        // Rotating counter-clockwise changes south to east
        {
            RobotSimulator robot = new RobotSimulator(0, 0, "south");
            robot.move("L");
            assert(robot.x == 0);
            assert(robot.y == 0);
            assert(robot.direction == "east");
        }

        // Rotating counter-clockwise changes east to north
        {
            RobotSimulator robot = new RobotSimulator(0, 0, "east");
            robot.move("L");
            assert(robot.x == 0);
            assert(robot.y == 0);
            assert(robot.direction == "north");
        }

        // Moving forward one facing north increments Y
        {
            RobotSimulator robot = new RobotSimulator(0, 0, "north");
            robot.move("A");
            assert(robot.x == 0);
            assert(robot.y == 1);
            assert(robot.direction == "north");
        }

        // Moving forward one facing south decrements Y
        {
            RobotSimulator robot = new RobotSimulator(0, 0, "south");
            robot.move("A");
            assert(robot.x == 0);
            assert(robot.y == -1);
            assert(robot.direction == "south");
        }

        // Moving forward one facing east increments X
        {
            RobotSimulator robot = new RobotSimulator(0, 0, "east");
            robot.move("A");
            assert(robot.x == 1);
            assert(robot.y == 0);
            assert(robot.direction == "east");
        }

        // Moving forward one facing west decrements X
        {
            RobotSimulator robot = new RobotSimulator(0, 0, "west");
            robot.move("A");
            assert(robot.x == -1);
            assert(robot.y == 0);
            assert(robot.direction == "west");
        }

        // Follow series of instructions moving east and north from README
        {
            RobotSimulator robot = new RobotSimulator(7, 3, "north");
            robot.move("RAALAL");
            assert(robot.x == 9);
            assert(robot.y == 4);
            assert(robot.direction == "west");
        }

        // Follow series of instructions moving west and north
        {
            RobotSimulator robot = new RobotSimulator(0, 0, "north");
            robot.move("LAAARALA");
            assert(robot.x == -4);
            assert(robot.y == 1);
            assert(robot.direction == "west");
        }

        // Follow series of instructions moving west and south
        {
            RobotSimulator robot = new RobotSimulator(2, -7, "east");
            robot.move("RRAAAAALA");
            assert(robot.x == -3);
            assert(robot.y == -8);
            assert(robot.direction == "south");
        }

        // Follow series of instructions moving east and north
        {
            RobotSimulator robot = new RobotSimulator(8, 4, "south");
            robot.move("LAAARRRALLLL");
            assert(robot.x == 11);
            assert(robot.y == 5);
            assert(robot.direction == "north");
        }
    }

}
