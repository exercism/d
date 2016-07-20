
module robot_factory;

import std.regex;
import std.stdio;

unittest
{

immutable int all_tests_enabled = 0;

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

static if (all_tests_enabled)
{
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

}

void main ()
{
}
