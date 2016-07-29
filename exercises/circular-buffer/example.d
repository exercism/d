
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
	Buffer!(int) myBuffer(1);
	assertThrown(myBuffer.pop(), "Empty buffer should throw exception if popped!");
}

static if (allTestsEnabled)
{
// test write and read back one item
{
	Buffer!(char) myBuffer(1);
	myBuffer.push('1');
	assert(myBuffer.pop() == '1');
}

// test write and read back multiple items
{
	Buffer!(char) myBuffer(2);
	myBuffer.push('1');
	myBuffer.push('2');
	assert(myBuffer.pop() == '1');
	assert(myBuffer.pop() == '2');
}

// test clearing the buffer
{
	Buffer!(char) myBuffer(3);
	myBuffer.push('1');
	myBuffer.push('2');
	myBuffer.push('3');

	myBuffer.clear();
	assertThrown(myBuffer.pop(), "Empty buffer should throw exception if popped!");
}

// test alternate write and read
{
	Buffer!(char) myBuffer(2);
	myBuffer.push('1');
	assert(myBuffer.pop() == '1');
	myBuffer.push('2');
	assert(myBuffer.pop() == '2');
}

// test read back oldest item
{
	Buffer!(char) myBuffer(4);
	myBuffer.push('1');
	myBuffer.push('2');
	myBuffer.push('3');
	myBuffer.pop();
	myBuffer.push('4');

	assert(myBuffer.pop() == '4');
}

// test write buffer
{
	Buffer!(char) myBuffer(3);
	myBuffer.push('1');
	myBuffer.push('2');
	myBuffer.push('3');

	assertThrown(myBuffer.push('4'), "Empty buffer should throw exception if popped!");
}

// test overwrite full buffer
{
	Buffer!(char) myBuffer(3);
	myBuffer.push('1');
	myBuffer.push('2');
	myBuffer.push('3');

	myBuffer.force_push('A');
	assert(myBuffer.pop() == '3');
	assert(myBuffer.pop() == '2');
	assert(myBuffer.pop() == 'A');
}

// test overwrite non-full buffer
{
	Buffer!(char) myBuffer(3);
	myBuffer.push('1');
	myBuffer.push('2');

	myBuffer.force_push('A');
	assert(myBuffer.pop() == '1');
	assert(myBuffer.pop() == '2');
	assert(myBuffer.pop() == 'A');
}

// test alternate read and overwrite
{
	Buffer!(char) myBuffer(5);
	myBuffer.push('1');
	myBuffer.push('2');
	myBuffer.push('3');
	myBuffer.pop();
	myBuffer.pop();

	myBuffer.push('4');
	myBuffer.pop();

	myBuffer.push('5');
	myBuffer.push('6');
	myBuffer.push('7');
	myBuffer.push('8');
	myBuffer.force_push('A');
	myBuffer.force_push('B');

	assert(myBuffer.pop() == '6');
	assert(myBuffer.pop() == '7');
	assert(myBuffer.pop() == '8');
	assert(myBuffer.pop() == 'A');
	assert(myBuffer.pop() == 'B');
	assertThrown(myBuffer.push('4'), "Empty buffer should throw exception if popped!");
}


}

}

void main ()
{
}


