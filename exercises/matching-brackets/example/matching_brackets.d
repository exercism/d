module matching_brackets;

import std.array : array, back, empty, popBack;
import std.string : indexOf;

static immutable string open = "[{(";
static immutable string close = "]})";

pure bool isPaired(immutable string input)
{
    dchar[] stack;

    foreach (immutable c; input.array)
    {
        if (open.indexOf(c) != -1)
        {
            stack ~= c;
        }
        else if (close.indexOf(c) != -1)
        {
            if (stack.empty || open[close.indexOf(c)] != stack.back)
            {
                return false;
            }
            stack.popBack();
        }
    }

    return stack.empty;
}
