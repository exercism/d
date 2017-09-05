module exercism;

bool enabled(bool cond) {
	version(ExercismTestAll)
		return true;
	else
		return cond;
}

void main() {
	import std.stdio : writeln;
	writeln("All unit tests have been run successfully.");
}
