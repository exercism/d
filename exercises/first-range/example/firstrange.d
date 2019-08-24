module firstrange;

import std.range;
import std.algorithm;
auto myFirstRange(T)(const T[] data)
{
	struct myFirstRange(Type)
	{
		private
		{
			immutable Type[] data;
			size_t loc = 0;
		}
		this(const Type[] pData)
		{
			data = pData.idup;
		}

		@property Type front() const
		{
			return data[loc];
		}

		void popFront()
		{
			++loc;
		}

		bool empty()
		{
			return data.length == loc;
		}
	}
	return myFirstRange!T(data);
}

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
