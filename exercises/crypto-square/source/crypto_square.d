module crypto;


unittest
{
import std.algorithm.comparison : equal;
immutable int allTestsEnabled = 0;

// normalize_strange_characters
{
	auto theCipher = Cipher("s#$%^&plunk");
	assert(equal("splunk", theCipher.normalizePlainText()));
}

static if (allTestsEnabled)
{
// normalize_numbers
{
	auto theCipher = Cipher("1, 2, 3 GO!");
	assert(equal("123go", theCipher.normalizePlainText()));
}

// size_of_small_square
{
	auto theCipher = Cipher("1234");
	assert(2U == theCipher.size());
}

// size_of_slightly_larger_square
{
	auto theCipher = Cipher("123456789");
	assert(3U == theCipher.size());
}

// size_of_non_perfect_square
{
	auto theCipher = Cipher("123456789abc");
	assert(4U == theCipher.size());
}

// size_of_non_perfect_square_less
{
	auto theCipher = Cipher("zomgzombies");
	assert(4U == theCipher.size());
}

// plain_text_segments_from_phrase
{
	const string[] expected = ["neverv", "exthin", "eheart", "withid", "lewoes"];
	auto theCipher = Cipher("Never vex thine heart with idle woes");
	const auto actual = theCipher.plainTextSegments();

	assert(equal(expected, actual));
}

// plain_text_segments_from_complex_phrase
{
	const string[] expected = ["zomg", "zomb", "ies"];
	auto theCipher = Cipher("ZOMG! ZOMBIES!!!");
	const auto actual = theCipher.plainTextSegments();

	assert(equal(expected, actual));
}

// Cipher_text_short_phrase
{
	auto theCipher = Cipher("Time is an illusion. Lunchtime doubly so.");
	assert(equal("tasneyinicdsmiohooelntuillibsuuml", theCipher.cipherText()));
}

// Cipher_text_long_phrase
{
	auto theCipher = Cipher("We all know interspecies romance is weird.");
	assert(equal("wneiaweoreneawssciliprerlneoidktcms", theCipher.cipherText()));
}

// normalized_Cipher_text1
{
	auto theCipher = Cipher("Madness, and then illumination.");
	assert(equal("msemo aanin dnin ndla etlt shui", theCipher.normalize.cipherText()));
}

// normalized_Cipher_text2
{
	auto theCipher = Cipher("Vampires are people too!");
	assert(equal("vrel aepe mset paoo irpo", theCipher.normalize.cipherText()));
}
}
}