module hello_world;

string hello()
{
    return "Goodbye, Mars!";
}

unittest
{
    assert(hello() == "Hello, World!");
}
