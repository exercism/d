
module crypto;

import std.string;
import std.array;
import std.math : sqrt, floor, ceil;
import std.conv : to;

import std.stdio;


class cipher
{
public:
	this (const string text)
	{
		this.normalized =  toLower(text.removechars(" `#$%^&.,<>:;'!~-?*@()[]{}_=|/\t\a\n\"+"));
	}

	string normalizePlainText ()
	{
		return normalized;
	}

	/**
	* Return the number of encrypted segments(that is number of columns for the crypto square).
	*/
	size_t size ()
	{
		size_t root = to!ulong(floor(sqrt(to!float(normalized.length))));

		size_t distance = normalized.length - root * root;
		if (distance == 0)
		{
			return root;
		}
		else
		{
			return to!ulong(root) + 1;
		}
	}

	string[] plainTextSegments ()
	{
		size_t columns = size();
		size_t rem = normalized.length % columns;
		string[] result;

		size_t len = normalized.length;
		for (size_t j = 0; j <= (len - columns); j += columns)
		{
			result ~= normalized[j..j + columns];
		}

		// we need to handle the leftovers
		if (rem)
		{
			result ~= normalized[len - rem .. len];
		}

		return result;
	}

	string cipherText ()
	{
		string result = normalizedCipherText();

		return result.removechars(" ");
	}

	string normalizedCipherText ()
	{
		string result;
		string[] segments = plainTextSegments();
		size_t columns = size();

		for (size_t i = 0; i < columns; ++i)
		{
			string cryptoSegment;
			foreach (s; segments)
			{
				if (i < s.length) cryptoSegment ~= s[i];
			}

			result ~= cryptoSegment;
			result ~= " ";
		}

		return strip(result);

	}

private:
	const string normalized;
}

unittest
{

// normalize_strange_characters
{
	auto theCipher = new cipher("s#$%^&plunk");
	assert("splunk" == theCipher.normalizePlainText());
}

// normalize_numbers
{
	auto theCipher = new cipher("1, 2, 3 GO!");
	assert("123go" == theCipher.normalizePlainText());
}

// size_of_small_square
{
	auto theCipher = new cipher("1234");
	assert(2U == theCipher.size());
}

// size_of_slightly_larger_square
{
	auto theCipher = new cipher("123456789");
	assert(3U == theCipher.size());
}

// size_of_non_perfect_square
{
	auto theCipher = new cipher("123456789abc");
	assert(4U == theCipher.size());
}

// size_of_non_perfect_square_less
{
	auto theCipher = new cipher("zomgzombies");
	assert(4U == theCipher.size());
}

// plain_text_segments_from_phrase
{
	const string[] expected = ["neverv", "exthin", "eheart", "withid", "lewoes"];
	auto theCipher = new cipher("Never vex thine heart with idle woes");
	const auto actual = theCipher.plainTextSegments();

	assert(expected == actual);
}

// plain_text_segments_from_complex_phrase
{
	const string[] expected = ["zomg", "zomb", "ies"];
	auto theCipher = new cipher("ZOMG! ZOMBIES!!!");
	const auto actual = theCipher.plainTextSegments();

	assert(expected == actual);
}

// cipher_text_short_phrase
{
	auto theCipher = new cipher("Time is an illusion. Lunchtime doubly so.");
	assert("tasneyinicdsmiohooelntuillibsuuml" == theCipher.cipherText());
}

// cipher_text_long_phrase
{
	auto theCipher = new cipher("We all know interspecies romance is weird.");
	assert("wneiaweoreneawssciliprerlneoidktcms" == theCipher.cipherText());
}

// normalized_cipher_text1
{
	auto theCipher = new cipher("Madness, and then illumination.");
	assert("msemo aanin dnin ndla etlt shui" == theCipher.normalizedCipherText());
}

// normalized_cipher_text2
{
	auto theCipher = new cipher("Vampires are people too!");
	assert("vrel aepe mset paoo irpo" == theCipher.normalizedCipherText());
}

}

void main ()
{
}

