module helloworld;

import std.format;

string hello(const char[] name = "World") {
    return format("Hello, %s!", name);
}

unittest {
    assert(hello() == "Hello, World!");
    assert(hello("Alice") == "Hello, Alice!");
    assert(hello("Bob") == "Hello, Bob!");
    assert(hello("") == "Hello, !");
}
