module eliuds_eggs;

pure uint eggCount(immutable uint number)
{
    uint count = 0;
    uint working = number;
    while (working != 0) {
        count += working & 1;
        working = working >> 1;
    }

    return count;
}
