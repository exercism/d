module helloworld_test;

import helloworld;

import std.stdio;

unittest {
    assert(hello() == "Hello, World!");
}

unittest {
    assert(hello("Alice") == "Hello, Alice!");
    assert(hello("Bob") == "Hello, Bob!");
}


void main() {
    writeln("All tests passed.");
}
