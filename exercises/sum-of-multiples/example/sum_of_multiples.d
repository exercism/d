module sum_of_multiples;

import std.range : iota;
import std.algorithm.searching : any;
import std.algorithm.iteration : filter, sum;

pure int calculateSum(immutable int[] factors, immutable int limit)
{
    return iota(0, limit).filter!(num => factors.filter!(a => a != 0)
            .any!(t => num % t == 0)).sum;
}
