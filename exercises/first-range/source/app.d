import std.range;
import std.algorithm;

unittest {
	auto rng = myFirstRange([0, 1, 2, 3, 4]);
	typeof(rng.front) count;
	foreach(elem; rng)
	{
		count += elem;
	}	

}