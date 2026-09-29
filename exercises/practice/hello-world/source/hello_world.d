module hello_world;

string hello()
{
    return "Goodbye, Mars!";
}

unittest
{
    // Say Hi!
    assert(hello() == "Hello, World!");
}
