
module crypto;


unittest
{
immutable int allTestsEnabled = 0;

// normalize_strange_characters
{
	auto theCipher = new cipher("s#$%^&plunk");
	assert("splunk" == theCipher.normalizePlainText());
}

static if (allTestsEnabled)
{
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

}

void main ()
{
}

