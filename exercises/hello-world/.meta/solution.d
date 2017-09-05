#!/usr/bin/env dub
/+
dub.json:
{
	"name": "hello_world_solution",
	"dependencies": {
		"exercism": { "path": "../exercism" }
	},
	"versions": ["ExercismTestAll"]
}
+/

import exercism;

import std.format;

string hello(const char[] name = "World") {
    return format("Hello, %s!", name);
}
