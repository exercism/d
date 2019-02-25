module helloworld;

string hello() {
  return "Hello, World!";
}

unittest {
    assert(hello() == "Hello, World!");
}
