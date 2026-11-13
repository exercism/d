module crypto;

struct Cipher
{
    // implement this struct
}

unittest
{
    import std.algorithm.comparison : equal;

    immutable int allTestsEnabled = 0;

    // Empty plaintext results in an empty ciphertext
    {
        auto theCipher = Cipher("");
        assert(equal("", theCipher.cipherText()));
    }

    static if (allTestsEnabled)
    {
        // Normalization results in empty plaintext
        {
            auto theCipher = Cipher("... --- ...");
            assert(equal("", theCipher.cipherText()));
        }

        // Lowercase
        {
            auto theCipher = Cipher("A");
            assert(equal("a", theCipher.cipherText()));
        }

        // Remove spaces
        {
            auto theCipher = Cipher("  b ");
            assert(equal("b", theCipher.cipherText()));
        }

        // Remove punctuation
        {
            auto theCipher = Cipher("@1,%!");
            assert(equal("1", theCipher.cipherText()));
        }

        // 9 character plaintext results in 3 chunks of 3 characters
        {
            auto theCipher = Cipher("This is fun!");
            assert(equal("tsf hiu isn", theCipher.cipherText()));
        }

        // 8 character plaintext results in 3 chunks, the last one with a trailing space
        {
            auto theCipher = Cipher("Chill out.");
            assert(equal("clu hlt io ", theCipher.cipherText()));
        }

        // 54 character plaintext results in 8 chunks, the last two with trailing spaces
        {
            auto theCipher = Cipher("If man was meant to stay on the ground, god would have given us roots.");
            assert(equal("imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau ", theCipher.cipherText()));
        }
    }
}
