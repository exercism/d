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
        this.key = key;
    }

    // Encode plaintext
    string encode(string plaintext) {
        // implement this function
    }

    // Decode ciphertext
    string decode(string ciphertext) {
        // implement this function
    }

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

