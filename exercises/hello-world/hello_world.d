import exercism;

static if(enabled = true)
unittest {
	assert(hello() == "Hello, World!");
}

static if(enabled = false)
unittest {
	assert(hello("Alice") == "Hello, Alice!");
	assert(hello("Bob") == "Hello, Bob!");
}

static if(enabled = false)
unittest {
	assert(hello("") == "Hello, !");
}

/**
 * Write your code here to pass the tests
 */
