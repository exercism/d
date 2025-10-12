module killer_sudoku_helper;

import std.algorithm : min;

struct State {
    uint index;
    uint total;
    uint count;
    ushort combination;
}

pure ushort[] combinations(int sum, int size, ushort exclude)
{
    ushort[] result;
    State[] pending;
    pending ~= State(9, sum, size, 0);
    while (pending.length > 0)
    {
        State state = pending[$ - 1];
        pending = pending[0 .. $ - 1];

        if (state.count == 0)
        {
            state.index = 0;
        }
        else
        {
            state.index = min(state.index, state.total);
        }

        while (state.index > 0)
        {
            ushort entry = cast(ushort)(1 << (state.index - 1));
            if ((exclude & entry) == 0)
            {
                pending ~= State(state.index - 1, state.total - state.index, state.count - 1, state.combination | entry);
            }

            state.index--;
        }

        if (state.total == 0 && state.count == 0)
        {
            result ~= state.combination;
        }
    }
    return result;
}
