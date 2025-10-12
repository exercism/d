module sublist;

enum Relation
{
    equal,
    sublist,
    superlist,
    unequal
}

pure Relation compare(T)(immutable T[] listOne, immutable T[] listTwo)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Empty lists
    {
        immutable float[] listOne = [];
        immutable float[] listTwo = [];
        assert(compare!(float)(listOne, listTwo) == Relation.equal);
    }

    static if (allTestsEnabled)
    {
        // Empty list within non empty list
        {
            immutable double[] listOne = [];
            immutable double[] listTwo = [1, 2, 3];
            assert(compare!(double)(listOne, listTwo) == Relation.sublist);
        }

        // Non empty list contains empty list
        {
            immutable uint[] listOne = [1, 2, 3];
            immutable uint[] listTwo = [];
            assert(compare!(uint)(listOne, listTwo) == Relation.superlist);
        }

        // List equals itself
        {
            immutable ushort[] listOne = [1, 2, 3];
            immutable ushort[] listTwo = [1, 2, 3];
            assert(compare!(ushort)(listOne, listTwo) == Relation.equal);
        }

        // Different lists
        {
            immutable long[] listOne = [1, 2, 3];
            immutable long[] listTwo = [2, 3, 4];
            assert(compare!(long)(listOne, listTwo) == Relation.unequal);
        }

        // False start
        {
            immutable int[] listOne = [1, 2, 5];
            immutable int[] listTwo = [0, 1, 2, 3, 1, 2, 5, 6];
            assert(compare!(int)(listOne, listTwo) == Relation.sublist);
        }

        // Consecutive
        {
            immutable double[] listOne = [1, 1, 2];
            immutable double[] listTwo = [0, 1, 1, 1, 2, 1, 2];
            assert(compare!(double)(listOne, listTwo) == Relation.sublist);
        }

        // Sublist at start
        {
            immutable double[] listOne = [0, 1, 2];
            immutable double[] listTwo = [0, 1, 2, 3, 4, 5];
            assert(compare!(double)(listOne, listTwo) == Relation.sublist);
        }

        // Sublist in middle
        {
            immutable ulong[] listOne = [2, 3, 4];
            immutable ulong[] listTwo = [0, 1, 2, 3, 4, 5];
            assert(compare!(ulong)(listOne, listTwo) == Relation.sublist);
        }

        // Sublist at end
        {
            immutable int[] listOne = [3, 4, 5];
            immutable int[] listTwo = [0, 1, 2, 3, 4, 5];
            assert(compare!(int)(listOne, listTwo) == Relation.sublist);
        }

        // At start of superlist
        {
            immutable long[] listOne = [0, 1, 2, 3, 4, 5];
            immutable long[] listTwo = [0, 1, 2];
            assert(compare!(long)(listOne, listTwo) == Relation.superlist);
        }

        // In middle of superlist
        {
            immutable float[] listOne = [0, 1, 2, 3, 4, 5];
            immutable float[] listTwo = [2, 3];
            assert(compare!(float)(listOne, listTwo) == Relation.superlist);
        }

        // At end of superlist
        {
            immutable ushort[] listOne = [0, 1, 2, 3, 4, 5];
            immutable ushort[] listTwo = [3, 4, 5];
            assert(compare!(ushort)(listOne, listTwo) == Relation.superlist);
        }

        // First list missing element from second list
        {
            immutable short[] listOne = [1, 3];
            immutable short[] listTwo = [1, 2, 3];
            assert(compare!(short)(listOne, listTwo) == Relation.unequal);
        }

        // Second list missing element from first list
        {
            immutable ulong[] listOne = [1, 2, 3];
            immutable ulong[] listTwo = [1, 3];
            assert(compare!(ulong)(listOne, listTwo) == Relation.unequal);
        }

        // First list missing additional digits from second list
        {
            immutable long[] listOne = [1, 2];
            immutable long[] listTwo = [1, 22];
            assert(compare!(long)(listOne, listTwo) == Relation.unequal);
        }

        // Order matters to a list
        {
            immutable short[] listOne = [1, 2, 3];
            immutable short[] listTwo = [3, 2, 1];
            assert(compare!(short)(listOne, listTwo) == Relation.unequal);
        }

        // Same digits but different numbers
        {
            immutable uint[] listOne = [1, 0, 1];
            immutable uint[] listTwo = [10, 1];
            assert(compare!(uint)(listOne, listTwo) == Relation.unequal);
        }
    }
}
