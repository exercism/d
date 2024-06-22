module pascals_triangle;

pure int[][] rows(int count)
{
    int[][] result = new int[][](count);
    int[] previous;
    for (int i = 0; i < count; ++i)
    {
        int[] current = new int[](i + 1);
        current[0] = 1;
        for (int j = 1; j < i; ++j)
        {
            current[j] = previous[j - 1] + previous[j];
        }
        current[i] = 1;
        result[i] = current;
        previous = current;
    }
    return result;
}
