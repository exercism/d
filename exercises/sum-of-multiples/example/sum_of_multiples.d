module sum_of_multiples;

import std.range : iota;
import std.algorithm.searching : any;
import std.algorithm.iteration : filter, sum;

pure int calculateSum(immutable int[] factors, immutable int limit)
{
    return iota(0, limit).filter!(num => factors.filter!(a => a != 0)
            .any!(t => num % t == 0)).sum;
}

unittest
{
    assert(calculateSum([3, 5], 1) == 0);
    assert(calculateSum([3, 5], 4) == 3);
    assert(calculateSum([3], 7) == 9);
    assert(calculateSum([3, 5], 10) == 23);
    assert(calculateSum([3, 5], 100) == 2318);
    assert(calculateSum([3, 5], 1000) == 233168);
    assert(calculateSum([7, 13, 17], 20) == 51);
    assert(calculateSum([4, 6], 15) == 30);
    assert(calculateSum([5, 6, 8], 150) == 4419);
    assert(calculateSum([5, 25], 51) == 275);
    assert(calculateSum([43, 47], 10000) == 2203160);
    assert(calculateSum([1], 100) == 4950);
    assert(calculateSum([0], 10000) == 0);
    assert(calculateSum([0], 1) == 0);
    assert(calculateSum([3, 0], 4) == 3);
    assert(calculateSum([2, 3, 5, 7, 11], 10000) == 39614537);
}
