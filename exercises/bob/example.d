
module bob;

import std.stdio;
import std.string;
import std.ascii : isUpper, isAlpha, toUpper, isPrintable;
import std.algorithm.searching : countUntil, endsWith;

bool all_upper (string text)
{
	auto pos = countUntil!((dchar c) => toUpper(c) != c)(text);
	return pos == -1;
}

bool has_upper (string text)
{
	auto pos = countUntil!((dchar c) => isUpper(c))(text);
	return pos != -1;
}

bool all_printable (string text)
{
	auto pos = countUntil!((dchar c) => !isPrintable(c))(text);
	return pos == -1;
}

bool has_alpha (string text)
{
	auto pos = countUntil!((dchar c) => !isAlpha(c))(text);
	return pos == -1;
}

bool is_shouting (string text)
{
	if (!all_upper(text)) return false;

	return has_upper(text) && all_printable(text);
}

bool is_question (string text)
{
	return strip(text).endsWith!(a => a == '?');
}

bool is_silence (string text)
{
	return strip(text).length == 0;
}

string hey (string text)
{
	if (is_silence(text))
	{
		return "Fine. Be that way!";
	}
    else if (is_shouting(text))
    {
		return "Whoa, chill out!";
	}
    else if (is_question(text))
    {
		return "Sure.";
	}

    return "Whatever.";
}

unittest
{
	assert(hey("Tom-ay-to, tom-aaaah-to.") == "Whatever.");
	assert(hey("WATCH OUT!") == "Whoa, chill out!");
	assert(hey("Does this cryogenic chamber make me look fat?") == "Sure.");
	assert(hey("Let's go make out behind the gym!") == "Whatever.");
	assert(hey("It's OK if you don't want to go to the DMV.") == "Whatever.");
	assert(hey("WHAT THE HELL WERE YOU THINKING?") == "Whoa, chill out!");
	assert(hey("1, 2, 3 GO!") == "Whoa, chill out!");
	assert(hey("1, 2, 3") == "Whatever.");
	assert(hey("4?") == "Sure.");
	assert(hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!") == "Whoa, chill out!");
	assert(hey("I HATE YOU") == "Whoa, chill out!");
	assert(hey("Ending with a ? means a question.") == "Whatever.");
	assert(hey("Wait! Hang on.  Are you going to be OK?") == "Sure.");
	assert(hey("Are you ok? ") == "Sure.");
	assert(hey("") == "Fine. Be that way!");
	assert(hey("   ") == "Fine. Be that way!");
	assert(hey(" A bit of silence can be nice.  ") == "Whatever.");
}

void main ()
{
}

