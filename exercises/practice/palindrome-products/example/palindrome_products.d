module palindrome_products;

struct Result {
    int value;
    int[2][] factors;
}

private pure bool isPalindrome(int n)
{
    if (n < 0) return false;
    if (n != 0 && n % 10 == 0) return false;
    int reversed = 0;
    while (n > reversed)
    {
        reversed = reversed * 10 + n % 10;
        n /= 10;
    }
    return n == reversed || n == reversed / 10;
}

pure Result smallest(int min, int max)
{
    if (min > max)
        throw new Exception("min must be <= max");

    Result result;
    int bestValue = int.max;

    foreach (i; min .. max + 1)
    {
        if (i * i > bestValue)
            break;

        foreach (j; i .. max + 1)
        {
            int product = i * j;
            if (product > bestValue)
                break;

            if (isPalindrome(product))
            {
                if (product < bestValue)
                {
                    bestValue = product;
                    result.value = product;
                    result.factors = [[i, j]];
                }
                else
                {
                    result.factors ~= [i, j];
                }
            }
        }
    }

    return result;
}

pure Result largest(int min, int max)
{
    if (min > max)
        throw new Exception("min must be <= max");

    Result result;
    int bestValue = -1;

    for (int i = max; i >= min; i--)
    {
        if (i * i < bestValue)
            break;

        for (int j = i; j >= min; j--)
        {
            int product = i * j;
            if (product < bestValue)
                break;

            if (isPalindrome(product))
            {
                if (product > bestValue)
                {
                    bestValue = product;
                    result.value = product;
                    result.factors = [[j, i]];
                }
                else if (product == bestValue)
                {
                    result.factors ~= [j, i];
                }
            }
        }
    }

    return result;
}
