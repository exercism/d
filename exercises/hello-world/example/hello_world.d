module hello_world;

import std.format;

string hello(const char[] name = "World") {
    return format("Hello, %s!", name);
}
