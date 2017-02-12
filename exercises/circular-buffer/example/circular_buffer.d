
module circular;

import std.exception;
import std.stdio;
import std.string;

class Buffer(ElementType)
{
public:
	this (size_t capacity)
	{
		container.length = capacity;
		unread = 0;
		readIndex = 0;
		writeIndex = 0;
		this.capacity = capacity;
	}

	ElementType pop ()
	{
		if (empty())
		{
			throw new Exception(format("Popped empty buffer!"));
		}

		ElementType last = container[readIndex];
		readIndex = (readIndex + 1) % capacity;
		--unread;

		return last;
	}

	void push (ElementType element)
	{
		if (full())
		{
			throw new Exception(format("Pushed into full buffer!"));
		}

		container[writeIndex] = element;
		writeIndex = (writeIndex + 1) % capacity;
		++unread;
	}

	void clear ()
	{
		unread = 0;
		readIndex = 0;
		writeIndex = 0;
	}

	void forcePush (ElementType element)
	{
		if (this.full())
		{
			container[readIndex] = element;
			readIndex = advanceIndex(readIndex);
			writeIndex = readIndex;
		}
		else
		{
			push(element);
		}
	}

	bool empty ()
	{
		return unread == 0;
	}

	bool full ()
	{
		return unread == capacity;
	}

private:
	size_t advanceIndex (size_t index)
	{
		return (index + 1) % capacity;
	}

	ElementType[] container;
	int unread;
	size_t readIndex;
	size_t writeIndex;
	const size_t capacity;
}


unittest
{

// test read empty buffer
{
	auto myBuffer = new Buffer!(int)(1UL);
	assertThrown(myBuffer.pop(), "Empty buffer should throw exception if popped!");
}

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

// test forcePush full buffer
{
	auto myBuffer = new Buffer!(char)(3);
	myBuffer.push('1');
	myBuffer.push('2');
	myBuffer.push('3');

	myBuffer.forcePush('A');
	assert(myBuffer.pop() == '2');
	assert(myBuffer.pop() == '3');
	assert(myBuffer.pop() == 'A');
}

// test forcePush non-full buffer
{
	auto myBuffer = new Buffer!(int)(2);
	myBuffer.forcePush(1000);
	myBuffer.forcePush(2000);

	assert(myBuffer.pop() == 1000);
	assert(myBuffer.pop() == 2000);
}

// test alternate read and forcePush
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
	myBuffer.forcePush('A');
	myBuffer.forcePush('B');

	assert(myBuffer.pop() == '6');
	assert(myBuffer.pop() == '7');
	assert(myBuffer.pop() == '8');
	assert(myBuffer.pop() == 'A');
	assert(myBuffer.pop() == 'B');
	assertThrown(myBuffer.pop(), "Empty buffer should throw exception if popped!");
}

}

void main ()
{
}

