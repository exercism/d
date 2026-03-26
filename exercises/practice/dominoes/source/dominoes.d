module dominoes;

struct Stone {
    int left;
    int right;
}

pure bool canChain(immutable Stone[] dominoes)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Empty input = empty output
    {
        immutable Stone[] dominoes;
        assert(canChain(dominoes));
    }

    static if (allTestsEnabled)
    {
        // Singleton input = singleton output
        {
            immutable Stone[] dominoes = [Stone(1, 1)];
            assert(canChain(dominoes));
        }

        // Singleton that can't be chained
        {
            immutable Stone[] dominoes = [Stone(1, 2)];
            assert(!canChain(dominoes));
        }

        // Three elements
        {
            immutable Stone[] dominoes = [Stone(1, 2), Stone(3, 1), Stone(2, 3)];
            assert(canChain(dominoes));
        }

        // Can reverse dominoes
        {
            immutable Stone[] dominoes = [Stone(1, 2), Stone(1, 3), Stone(2, 3)];
            assert(canChain(dominoes));
        }

        // Can't be chained
        {
            immutable Stone[] dominoes = [Stone(1, 2), Stone(4, 1), Stone(2, 3)];
            assert(!canChain(dominoes));
        }

        // Disconnected - simple
        {
            immutable Stone[] dominoes = [Stone(1, 1), Stone(2, 2)];
            assert(!canChain(dominoes));
        }

        // Disconnected - double loop
        {
            immutable Stone[] dominoes = [Stone(1, 2), Stone(2, 1), Stone(3, 4), Stone(4, 3)];
            assert(!canChain(dominoes));
        }

        // Disconnected - single isolated
        {
            immutable Stone[] dominoes = [Stone(1, 2), Stone(2, 3), Stone(3, 1), Stone(4, 4)];
            assert(!canChain(dominoes));
        }

        // Need backtrack
        {
            immutable Stone[] dominoes = [Stone(1, 2), Stone(2, 3), Stone(3, 1), Stone(2, 4), Stone(2, 4)];
            assert(canChain(dominoes));
        }

        // Separate loops
        {
            immutable Stone[] dominoes = [Stone(1, 2), Stone(2, 3), Stone(3, 1), Stone(1, 1), Stone(2, 2), Stone(3, 3)];
            assert(canChain(dominoes));
        }

        // Nine elements
        {
            immutable Stone[] dominoes = [Stone(1, 2), Stone(5, 3), Stone(3, 1), Stone(1, 2), Stone(2, 4), Stone(1, 6), Stone(2, 3), Stone(3, 4), Stone(5, 6)];
            assert(canChain(dominoes));
        }

        // Separate three-domino loops
        {
            immutable Stone[] dominoes = [Stone(1, 2), Stone(2, 3), Stone(3, 1), Stone(4, 5), Stone(5, 6), Stone(6, 4)];
            assert(!canChain(dominoes));
        }
    }
}
