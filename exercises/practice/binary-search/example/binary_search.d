module binary_search;

class BinarySearch
{
public:
    this(immutable int[] values)
    {
        this.values = values;
    }

    final int find(immutable int value)
    {
        int start = 0;
        int stop =  cast(int) this.values.length - 1;

        while (start <= stop)
        {
            int index = (start + stop) / 2;
            int median = this.values[index];
            if (median == value)
            {
                return index;
            }

            if (median < value)
            {
                start = index + 1;
            }
            else
            {
                stop = index - 1;
            }
        }

        throw new Exception("value not in list");
    }

private:
    immutable int[] values;
}
