module helloworld;

import std.format;

string hello(const char[] name = "World") {
    return format("Hello, %s!", name);
}
