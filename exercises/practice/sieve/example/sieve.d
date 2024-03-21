module sieve;

import std.algorithm;
import std.array;
import std.range;

pure int[] primes(immutable int limit)
{
    int[] results = [];
    int[] nums = iota(2, limit + 1).array;
    while (nums.length > 0)
    {
        int current = nums.front;
        results ~= nums.front;
        
        nums = nums.dropOne().filter!(n => n % current != 0).array;
    }

    return results;
}
