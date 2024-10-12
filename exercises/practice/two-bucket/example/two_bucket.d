module two_bucket;

import std.algorithm : max, min;
import std.numeric : gcd;
import std.typecons;

alias TwoBucketInput = Tuple!(
    int, "size1",
    int, "size2",
    int, "goal",
    string, "startBucket",
);

alias TwoBucketResult = Tuple!(
    int, "moves",
    string, "goalBucket",
    int, "otherAmount",
);

struct Bucket {
    string name;
    int size;
    int amount = 0;

    pure bool isEmpty() { return amount == 0; }
    pure bool isFull() { return amount == size; }
    pure void empty() { amount = 0; }
    pure void fill() { amount = size; }
    pure int remaining() { return size - amount; }

    pure void pourInto(ref Bucket other) {
        auto quantity = min(amount, other.remaining());
        amount -= quantity;
        other.amount += quantity;
    }
}

pure TwoBucketResult measure(TwoBucketInput input)
{
    // validate input
    if (input.goal > max(input.size1, input.size2))
        throw new Exception("goal is too big");

    auto g = gcd(input.size1, input.size2);
    if (g > 1 && input.goal % g != 0)
        throw new Exception("goal is not possible");

    // initialize the buckets
    Bucket first, second;
    if (input.startBucket == "one") {
        first = Bucket("one", input.size1);
        second = Bucket("two", input.size2);
    } else {
        second = Bucket("one", input.size1);
        first = Bucket("two", input.size2);
    }

    // 1. fill start bucket
    first.fill();
    int moves = 1;

    // 2. fill second bucket if it's the goal
    if (second.size == input.goal && first.amount != input.goal) {
        second.fill();
        moves++;
    }

    // 3. loop until victory
    while (true) {
        if (first.amount == input.goal)
            return TwoBucketResult(moves, first.name, second.amount);
        if (second.amount == input.goal)
            return TwoBucketResult(moves, second.name, first.amount);

        if (first.isEmpty())
            first.fill();
        else if (second.isFull())
            second.empty();
        else
            first.pourInto(second);
        moves++;
    }
}
