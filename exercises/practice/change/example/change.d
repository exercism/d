module change;

pure ushort[] findFewestCoins(immutable ushort[] coins, ushort target)
{
    int[] table = new int[target + 1];
    for (ushort i = 1; i <= target; ++i)
    {
        int best = target + 1;
        foreach (coin ; coins)
        {
            if (coin <= i && table[i - coin] < best)
            {
                best = table[i - coin] + 1;
            }
        }
        table[i] = best;
    }
    if (table[target] > target)
    {
        throw new Exception("can't make target with given coins");
    }

    ushort[] result;
    ushort remaining = target;
    while (remaining > 0)
    {
        foreach (coin ; coins)
        {
            assert(coin <= remaining);
            if (table[remaining - coin] < table[remaining])
            {
                result ~= coin;
                remaining -= coin;
                break;
            }
        }
    }
    return result;
}
