module pythagorean_triplet;

struct Triplet {
    uint a;
    uint b;
    uint c;
}

// For every Pythagorean triplet with total a + b + c = n,
// a² + b² = c²
// <=> a² + b² = (n - a - b)², substituting c
// <=> 0 = n² - 2*n*a - 2*n*b + 2*a*b
// <=> (2*n - 2*a) b = (n² - 2*n*a)
// <=> b = (n² - 2*n*a) / (2*n - 2*a)

pure Triplet[] tripletsWithSum(uint n)
{
    Triplet[] result;
    if (n < 2)
    {
        return result;
    }

    for (uint a = 1;;++a)
    {
        uint numerator = n * (n - 2 * a);
        uint denominator = 2 * (n - a);
        uint b = numerator / denominator;
        if (b <= a)
        {
            break;
        }
        if (numerator % denominator != 0)
        {
            continue;
        }
        uint c = n - a - b;
        result ~= Triplet(a, b, c);
    }
    return result;
}
