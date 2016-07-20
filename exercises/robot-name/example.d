
module robot_factory;

import std.string;
import std.ascii : uppercase, digits;
import std.regex;
import std.random;

import std.stdio;

class robot
{
public:
	this ()
	{
		init_name();
	}

	string name () const @property
	{
		return name_;
	}

	void reset ()
	{
		string old_name = name_;
		// intialize a new name
		init_name();
		// free the old name in the dictionary
		name_dictionary[old_name] = false;
	}

	static uint collisons () @property
	{
		return collisions_;
	}

private:
	void init_name ()
	{
		string new_name = generate_name();
		while (new_name in name_dictionary && name_dictionary[new_name] == true)
		{
			++collisions_;
			new_name = generate_name();
		}

		name_dictionary[new_name] = true;
		name_ = new_name;
	}

	string generate_name ()
	{
		char[] upper = uppercase.dup;
		char[] dig = digits.dup;
		randomShuffle(upper.representation);
		randomShuffle(dig.representation);

		string n = "".dup;
		auto gen = Random(unpredictableSeed);
		auto idx_1 = uniform(0, upper.length, gen);
		n ~= upper[idx_1];
		auto idx_2 = uniform(0, upper.length, gen);
		n ~= upper[idx_2];

		foreach(i; [0, 1, 2])
		{
			auto idx = uniform(0, dig.length, gen);
			n ~= dig[idx];
		}

		return n;
	}

	string name_;

	// !! that causes a segmentation fault !!
	//static char[] upper = uppercase.dup;
	//static char[] dig = digits.dup;

	static bool[string] name_dictionary;
	static uint collisions_ = 0;
}

unittest
{

// test for properly formatted name
{
	auto pattern = regex(`^[A-Z]{2}\d{3}`);
	auto the_robot = new robot();

	// test the regex pattern
	assert(matchAll("VAV224", pattern).empty);
	assert(matchAll("V221", pattern).empty);
	assert(matchAll("190", pattern).empty);
	assert(matchAll("12345", pattern).empty);
	assert(matchAll("SB1", pattern).empty);
	assert(matchAll("TT", pattern).empty);

	writefln("Robot name: %s", the_robot.name);

	// test that the name respects the pattern
	// that is: "2 uppercase letters followed by 3 digits"
	assert(!matchAll(the_robot.name, pattern).empty);
}

// test name stickiness
{
	auto the_robot = new robot();
	auto name = the_robot.name;

	writefln("Robot name: %s", the_robot.name);
	assert(name == the_robot.name);
}

// test different names for different robots
{
	auto robot_1 = new robot();
	auto robot_2 = new robot();

	writefln("Robot name: %s", robot_1.name);
	writefln("Robot name: %s", robot_2.name);
	assert(robot_1.name != robot_2.name);
}

// test name reset
{
	auto the_robot = new robot();
	auto name_1 = the_robot.name;
	the_robot.reset();
	auto name_2 = the_robot.name;

	writefln("Robot name: %s", name_1);
	writefln("Robot name: %s", name_2);
	assert(name_1 != name_2);
}

// collision test
{
	foreach(i; 1..10000)
	{
		auto the_robot = new robot();
	}

	writefln("Collisons: %s that is %s%%", robot.collisons, (robot.collisons/10000.0f) * 100);
}

}

void main ()
{
}
