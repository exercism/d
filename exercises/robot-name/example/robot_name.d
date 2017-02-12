
module robot;

import std.string;
import std.ascii : uppercase, digits;
import std.regex;
import std.random;

import std.stdio;

class Robot
{
public:
	this ()
	{
		initName();
	}

	string name () const @property
	{
		return name_;
	}

	void reset ()
	{
		string oldName = name_;
		// intialize a new name
		initName();
		// free the old name in the dictionary
		nameDictionary[oldName] = false;
	}

	static uint collisons () @property
	{
		return collisions_;
	}

private:
	void initName ()
	{
		string newName = generateName();
		while (newName in nameDictionary && nameDictionary[newName] == true)
		{
			++collisions_;
			newName = generateName();
		}

		nameDictionary[newName] = true;
		name_ = newName;
	}

	string generateName ()
	{
		char[] upper = uppercase.dup;
		char[] dig = digits.dup;
		randomShuffle(upper.representation);
		randomShuffle(dig.representation);

		string n = "".dup;
		auto gen = Random(unpredictableSeed);
		auto idx = uniform(0, upper.length, gen);
		n ~= upper[idx];
		idx = uniform(0, upper.length, gen);
		n ~= upper[idx];

		foreach(i; [0, 1, 2])
		{
			idx = uniform(0, dig.length, gen);
			n ~= dig[idx];
		}

		return n;
	}

	string name_;

	// !! that causes a segmentation fault !!
	//static char[] upper = uppercase.dup;
	//static char[] dig = digits.dup;

	static bool[string] nameDictionary;
	static uint collisions_ = 0;
}

unittest
{

// test for properly formatted name
{
	auto pattern = regex(`^[A-Z]{2}\d{3}`);
	auto theRobot = new Robot();

	// test the regex pattern
	assert(matchAll("VAV224", pattern).empty);
	assert(matchAll("V221", pattern).empty);
	assert(matchAll("190", pattern).empty);
	assert(matchAll("12345", pattern).empty);
	assert(matchAll("SB1", pattern).empty);
	assert(matchAll("TT", pattern).empty);

	writefln("Robot name: %s", theRobot.name);

	// test that the name respects the pattern
	// that is: "2 uppercase letters followed by 3 digits"
	assert(!matchAll(theRobot.name, pattern).empty);
}

// test name stickiness
{
	auto theRobot = new Robot();
	auto name = theRobot.name;

	writefln("Robot name: %s", theRobot.name);
	assert(name == theRobot.name);
}

// test different names for different Robots
{
	auto erTwoDeeTwo = new Robot();
	auto beeBeeEight = new Robot();

	writefln("Robot name: %s", erTwoDeeTwo.name);
	writefln("Robot name: %s", beeBeeEight.name);
	assert(erTwoDeeTwo.name != beeBeeEight.name);
}

// test name reset
{
	auto theRobot = new Robot();
	auto nameOne = theRobot.name;
	theRobot.reset();
	auto nameTwo = theRobot.name;

	writefln("Robot name: %s", nameOne);
	writefln("Robot name: %s", nameTwo);
	assert(nameOne != nameTwo);
}

// collision test
{
	foreach(i; 1..10000)
	{
		auto theRobot = new Robot();
	}

	writefln("Collisons: %s that is %s%%", Robot.collisons, (Robot.collisons/10000.0f) * 100);
}

}

void main ()
{
}

