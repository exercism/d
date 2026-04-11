module simple_cipher;

import std.array;
import std.algorithm;
import std.range;
import std.random;
import std.exception;
import std.array : appender;

struct Cipher {
    private string key;

    this(string key) {
        enforce(key.length > 0, "Key cannot be empty");
        enforce(key.all!(c => c >= 'a' && c <= 'z'),
            "Key must be lowercase letters");
        this.key = key;
    }

    static Cipher withRandomKey() {
        Cipher c;
        c.key = generateKey(100);
        return c;
    }

    string encode(string text) const {
        return transform(text, true);
    }

    string decode(string text) const {
        return transform(text, false);
    }

private:
    string transform(string text, bool encodeMode) const {
        auto result = appender!string();
        size_t keyIndex = 0;

        foreach (c; text) {
            if (c >= 'a' && c <= 'z') {
                int shift = key[keyIndex % key.length] - 'a';
                if (!encodeMode) shift = -shift;

                int val = (c - 'a' + shift) % 26;
                if (val < 0) val += 26;

                result.put(cast(char)('a' + val));
                keyIndex++;
            } else {
                result.put(c);
            }
        }

        return result.data;
    }

    static string generateKey(size_t length) {
        auto rng = Random(unpredictableSeed);
        return iota(length)
            .map!(_ => cast(char)('a' + uniform(0, 26, rng)))
            .array;
    }
}

void main() {}