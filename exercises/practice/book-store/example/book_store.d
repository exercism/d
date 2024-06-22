module book_store;

import std.algorithm : min;
import std.algorithm.sorting : sort;

pure int total(immutable int[] basket)
{
    auto tally = [0, 0, 0, 0, 0, 0];
    foreach (book; basket) {
        ++tally[book];
    }

    sort(tally);

    int five = tally[1];
    int four = tally[2] - tally[1];
    int three = tally[3] - tally[2];
    int two = tally[4] - tally[3];
    int one = tally[5] - tally[4];

    // Two groups of four are cheaper than a group of five plus a group of three.
    int adjustment = min(three, five);
    five -= adjustment;
    three -= adjustment;
    four += 2 * adjustment;

    return 5 * five * 600 + 4 * four * 640 + 3 * three * 720 + 2 * two * 760 + 1 * one * 800;
}
