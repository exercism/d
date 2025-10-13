module say;

import std.array : appender;

immutable string[] names = [
    "zero ",
    "one ",
    "two ",
    "three ",
    "four ",
    "five ",
    "six ",
    "seven ",
    "eight ",
    "nine ",
    "ten ",
    "eleven ",
    "twelve ",
    "thirteen ",
    "fourteen ",
    "fifteen ",
    "sixteen ",
    "seventeen ",
    "eighteen ",
    "nineteen ",
];

immutable string[] decadeNames = [
    "zero",
    "ten",
    "twenty",
    "thirty",
    "forty",
    "fifty",
    "sixty",
    "seventy",
    "eighty",
    "ninety",
];

pure string pronounce(long number)
{
    auto builder = appender!string();
    int hundreds = cast(int)(number) / 100;
    int units = cast(int)(number) % 100;
    if (hundreds != 0)
    {
        builder.put(names[hundreds]);
        builder.put("hundred ");
    }
    if (units >= 20)
    {
        builder.put(decadeNames[units / 10]);
        if (units % 10 != 0)
        {
            builder.put("-");
            builder.put(names[units % 10]);
        }
        else
        {
            builder.put(" ");
        }
    }
    else if (units != 0)
    {
        builder.put(names[units]);
    }
    return builder.data;
}

pure string say(long number)
{
    if (number < 0 || number > 999999999999)
    {
        throw new Exception("input out of range");
    }
    if (number == 0)
    {
        return "zero";
    }
    auto builder = appender!string();
    long billions = number / 1000000000;
    long millions = number / 1000000 % 1000;
    long thousands = number / 1000 % 1000;
    long units = number % 1000;
    if (billions != 0)
    {
        builder.put(pronounce(billions));
        builder.put("billion ");
    }
    if (millions != 0)
    {
        builder.put(pronounce(millions));
        builder.put("million ");
    }
    if (thousands != 0)
    {
        builder.put(pronounce(thousands));
        builder.put("thousand ");
    }
    if (units != 0)
    {
        builder.put(pronounce(units));
    }
    string result = builder.data;
    return result[0 .. $ - 1];
}
