
module crypto;

import std.string;
import std.array;
import std.math : sqrt, floor;
import std.conv : to;

import std.stdio;


class cipher
{
public:
	this (const string text)
	{
		this.text = text;
	}

	string normalizePlainText ()
	{
		return toLower(text.removechars(" `#$%^&.,<>:;'!~-?*@()[]{}_=|/\t\a\n\"+"));
	}

	size_t size ()
	{
		return to!ulong(text.length / floor(sqrt(to!float(text.length))));
	}

private:
	const string text;
}

unittest
{
immutable int all_tests_enabled = 0;

// normalize_strange_characters
{
	auto the_cipher = new cipher("s#$%^&plunk");
	assert("splunk" == the_cipher.normalizePlainText());
}

// normalize_numbers
{
	auto the_cipher = new cipher("1, 2, 3 GO!");
	//writefln("Normalized: %s", the_cipher.normalizePlainText());
	assert("123go" == the_cipher.normalizePlainText());
}

// size_of_small_square
{
	auto the_cipher = new cipher("1234");
	assert(2U == the_cipher.size());
}

// size_of_slightly_larger_square
{
	auto the_cipher = new cipher("123456789");
	assert(3U == the_cipher.size());
}

// size_of_non_perfect_square
{
	auto the_cipher = new cipher("123456789abc");
	//writefln("Size: %s", the_cipher.size());
	assert(4U == the_cipher.size());
}

static if (all_tests_enabled)
{
// plain_text_segments_from_phrase
{
	const string[] expected = ["neverv", "exthin", "eheart", "withid", "lewoes"];

	const auto actual = cipher("Never vex thine heart with idle woes").plain_text_segments();

	//assert_COLLECTIONS(expected.begin(), expected.end(), actual.begin(), actual.end());
}

// plain_text_segments_from_complex_phrase
{
	const string[] expected = ["zomg", "zomb", "ies"];
	const auto actual = cipher("ZOMG! ZOMBIES!!!").plain_text_segments();

	//assert_COLLECTIONS(expected.begin(), expected.end(), actual.begin(), actual.end());
}

// cipher_text_short_phrase
{
	assert("tasneyinicdsmiohooelntuillibsuuml" == cipher("Time is an illusion. Lunchtime doubly so.").cipher_text());
}

// cipher_text_long_phrase
{
	assert("wneiaweoreneawssciliprerlneoidktcms" == cipher("We all know interspecies romance is weird.").cipher_text());
}

// normalized_cipher_text1
{
	assert("msemoa anindn inndla etltsh ui" == cipher("Madness, and then illumination.").normalized_cipher_text());
}

// normalized_cipher_text2
{
	assert("vrela epems etpao oirpo" == cipher("Vampires are people too!").normalized_cipher_text());
}

}

}

void main ()
{
}

