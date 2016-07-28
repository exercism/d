
module circular;

import std.containers.array;
import std.exception;
import std.stdio;

class Buffer(T)
{
public:
	this (size_t capacity)
	{
		this.capacity = capacity;
	}

private:
	Array!T container;
	const size_t capacity;
}


unittest
{
immutable int allTestsEnabled = 0;

// test read empty buffer
{
	Buffer!(int) myBuffer;
	assertThrown(myBuffer.pop(), "Empty buffer should throw exception if popped!");
}

static if (allTestsEnabled)
{
}

}

void main ()
{
}


