module dominoes;

struct Stone {
    int left;
    int right;
}

pure bool canChain(immutable Stone[] dominoes)
{
    enum int n = 7; // values 0..6
    int[n] parent;
    int[n] rank;
    int[n] tally;

    foreach (i; 0 .. n)
        parent[i] = i;

    int find(int x)
    {
        while (parent[x] != x)
        {
            parent[x] = parent[parent[x]];
            x = parent[x];
        }
        return x;
    }

    void unite(int a, int b)
    {
        int ra = find(a);
        int rb = find(b);
        if (ra == rb) return;

        if (rank[ra] < rank[rb])
        {
            parent[ra] = rb;
        }
        else if (rank[ra] > rank[rb])
        {
            parent[rb] = ra;
        }
        else
        {
            parent[rb] = ra;
            rank[ra]++;
        }
    }

    foreach (ref stone; dominoes)
    {
        tally[stone.left]++;
        tally[stone.right]++;
        unite(stone.left, stone.right);
    }

    // All vertices must have even tally
    foreach (t; tally)
        if (t % 2 != 0) return false;

    // At most one connected component among vertices with nonzero tally
    int roots = 0;
    foreach (i; 0 .. n)
        if (tally[i] > 0 && parent[i] == i)
            roots++;

    return roots <= 1;
}
