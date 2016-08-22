module helloworld_test;

import std.stdio;

void main() {
    assert(hello() == "Hello, World!");
    assert(hello("Alice") == "Hello, Alice!");
    assert(hello("Bob") == "Hello, Bob!");
    assert(hello("") == "Hello, !");

    writeln("All tests passed.");
}
