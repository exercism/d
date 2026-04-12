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

}