module firstrange;
import std.range;
import std.algorithm;


version = moreTests;
@safe unittest
{
	auto rng = myFirstRange!int([0, 1, 2, 3, 4]);
	typeof(rng.front) count;
	foreach (elem; rng)
	{
		count += elem;
	}
	assert(count == 10);
	
	version (moreTests)
	{
		//Can you get this(just the line below) syntax working?
		auto inferredRange = myFirstRange([1, 4, 5]);
		assert(inferredRange.map!(x => 2 * x).sum == 20);
	}
}
