module roman;

import std.array : appender;

string toRoman(int n) {
    auto builder = appender!string();
    foreach (num; mappings) {
        while (n >= num.arabic) {
            builder.put(num.roman);
            n -= num.arabic;
        }
    }
    return builder.data;
}

private struct Numeral {
    int arabic;
    string roman;
}

private immutable Numeral[] mappings = [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}];
