module helloworld_test;

unittest {
const int allTestsEnabled = 0;

    assert(hello() == "Hello, World!");
static if (allTestsEnabled) {
    assert(hello("Alice") == "Hello, Alice!");
    assert(hello("Bob") == "Hello, Bob!");
    assert(hello("") == "Hello, !");
}

}
