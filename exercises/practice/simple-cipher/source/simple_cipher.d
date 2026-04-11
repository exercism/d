import std.stdio;
import std.random;
import std.string;
import std.algorithm;
import std.array;
import std.range;
import std.exception;

class VigenereCipher {
    private string key;

    this(string key = "") {
        if (key.length == 0) {
            this.key = generateRandomKey(100);
        } else {
            validateKey(key);
            this.key = key;
        }
    }

    // Generate random key of given length
    private string generateRandomKey(size_t length) {
        auto rng = Random(unpredictableSeed);
        return array(map!(i => cast(char)('a' + uniform(0, 26, rng)))(iota(length)));
    }

    // Ensure key is lowercase letters only
    private void validateKey(string key) {
        enforce!Exception(key.length > 0, "Key cannot be empty");
        enforce!Exception(all!((c) => c >= 'a' && c <= 'z')(key),
            "Key must contain only lowercase letters");
    }

    // Encode plaintext
    string encode(string plaintext) {
        return transformText(plaintext, true);
    }

    // Decode ciphertext
    string decode(string ciphertext) {
        return transformText(ciphertext, false);
    }

    // Core logic
    private string transformText(string text, bool encodeMode) {
        string result;
        size_t keyIndex = 0;

        foreach (char c; text) {
            if (c >= 'a' && c <= 'z') {
                int shift = key[keyIndex % key.length] - 'a';

                if (!encodeMode) {
                    shift = -shift;
                }

                int newChar = (c - 'a' + shift) % 26;
                if (newChar < 0) newChar += 26;

                result ~= cast(char)('a' + newChar);
                keyIndex++;
            } else {
                // Keep non-lowercase chars unchanged
                result ~= c;
            }
        }

        return result;
    }

    string getKey() {
        return key;
    }
}

void main() {
    auto cipher = new VigenereCipher("abcd");

    string plaintext = "hello";
    auto encoded = cipher.encode(plaintext);
    auto decoded = cipher.decode(encoded);

    writeln("Key: ", cipher.getKey());
    writeln("Plaintext: ", plaintext);
    writeln("Encoded: ", encoded);
    writeln("Decoded: ", decoded);

    // Random key example
    auto randomCipher = new VigenereCipher();
    writeln("\nRandom Key: ", randomCipher.getKey());
}

unittest {
    // Basic encoding test
    auto cipher = new VigenereCipher("abcd");
    assert(cipher.encode("hello") == "hfnoo");
}

unittest {
    // Decode should reverse encode
    auto cipher = new VigenereCipher("abcd");
    string original = "hello";
    auto encoded = cipher.encode(original);
    auto decoded = cipher.decode(encoded);

    assert(decoded == original);
}

unittest {
    // Single character key (Caesar cipher behavior)
    auto cipher = new VigenereCipher("d"); // shift = 3
    assert(cipher.encode("abc") == "def");
    assert(cipher.decode("def") == "abc");
}

unittest {
    // Key = "a" should not change text
    auto cipher = new VigenereCipher("a");
    assert(cipher.encode("hello") == "hello");
    assert(cipher.decode("hello") == "hello");
}

unittest {
    // Key wrapping
    auto cipher = new VigenereCipher("ab");
    // shifts: 0,1,0,1,...
    assert(cipher.encode("aaaa") == "abab");
}

unittest {
    // Non-lowercase characters should remain unchanged
    auto cipher = new VigenereCipher("abc");
    assert(cipher.encode("hello world!") == "hfnlp yosnd!");
}

unittest {
    // Random key generation (length check)
    auto cipher = new VigenereCipher();
    assert(cipher.getKey().length >= 100);
}
