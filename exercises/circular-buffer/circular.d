
module circular;

import std.exception;

unittest
{
immutable int allTestsEnabled = 0;

// test read empty buffer
{
	auto myBuffer = new Buffer!(int)(1UL);
	assertThrown(myBuffer.pop(), "Empty buffer should throw exception if popped!");
}

static if (allTestsEnabled)
{

// test write and read back one item
{
	auto myBuffer = new Buffer!(char)(1);
	myBuffer.push('1');
	assert(myBuffer.pop() == '1');
}

// test write and read back multiple items
{
	auto myBuffer =  new Buffer!(char)(2);
	myBuffer.push('1');
	myBuffer.push('2');
	assert(myBuffer.pop() == '1');
	assert(myBuffer.pop() == '2');
}

// test clearing the buffer
{
	auto myBuffer = new Buffer!(char)(3);
	myBuffer.push('1');
	myBuffer.push('2');
	myBuffer.push('3');

	myBuffer.clear();
	assertThrown(myBuffer.pop(), "Empty buffer should throw exception if popped!");
}

// test alternate write and read
{
	auto myBuffer = new Buffer!(char)(2);
	myBuffer.push('1');
	assert(myBuffer.pop() == '1');
	myBuffer.push('2');
	assert(myBuffer.pop() == '2');
}

// test read back oldest item
{
	auto myBuffer = new Buffer!(char)(4);
	myBuffer.push('1');
	myBuffer.push('2');
	myBuffer.pop();
	myBuffer.push('3');
	myBuffer.pop();

	assert(myBuffer.pop() == '3');
}

// test write buffer
{
	auto myBuffer = new Buffer!(char)(3);
	myBuffer.push('1');
	myBuffer.push('2');
	myBuffer.push('3');

	assertThrown(myBuffer.push('4'), "Full buffer should throw exception if new element pushed!");
}

// test force_push full buffer
{
	auto myBuffer = new Buffer!(char)(3);
	myBuffer.push('1');
	myBuffer.push('2');
	myBuffer.push('3');

	myBuffer.force_push('A');
	assert(myBuffer.pop() == '2');
	assert(myBuffer.pop() == '3');
	assert(myBuffer.pop() == 'A');
}

// test force_push non-full buffer
{
	auto myBuffer = new Buffer!(int)(2);
	myBuffer.force_push(1000);
	myBuffer.force_push(2000);

	assert(myBuffer.pop() == 1000);
	assert(myBuffer.pop() == 2000);
}

// test alternate read and force_push
{
	auto myBuffer = new Buffer!(char)(5);
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
	assertThrown(myBuffer.pop(), "Empty buffer should throw exception if popped!");
}

}

}

void main ()
{
}


