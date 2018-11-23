import hello_world;

unittest {
    import std.stdio : writeln;
    writeln("This line just confirms that the test file is being run.");
const int allTestsEnabled = 0;

    assert(hello() == "Hello, World!");
static if (allTestsEnabled) {
    assert(hello("Alice") == "Hello, Alice!");
    assert(hello("Bob") == "Hello, Bob!");
    assert(hello("") == "Hello, !");
}

}
